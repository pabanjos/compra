package controle.cliente;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controle.soap.BancoProxy;
import modelo.entidades.Compra;
import modelo.entidades.Conta;
import modelo.entidades.Filme;
import modelo.persistencia.DaoCompra;
import modelo.persistencia.DaoFilme;

@WebServlet("/ControleCarrinho")
public class ControleCarrinho extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Conta logado = (Conta) req.getSession().getAttribute("logado");
		String acao = req.getParameter("acao");
		String mensagem = "{}";
		try {
			if (acao.equals("adicionar")) {
				Integer idFilme = Integer.parseInt(req.getParameter("idFilme"));
				if (logado.getCompras().containsKey(idFilme)) {
					Filme filmeLoja = new DaoFilme().selecionarPorId(idFilme);
					Compra filmeCarrinho = logado.getCompras().get(idFilme);
					if (filmeLoja.getEstoque() > filmeCarrinho.getQuantidade()) {
						filmeCarrinho.setQuantidade(filmeCarrinho.getQuantidade() + 1);
						calcular(logado);
					} else {
						mensagem = "{\"falha\":\"Blue ray " + filmeLoja.getTitulo() + " fora de estoque\"}";
					}
				} else {
					Compra compra = new Compra();
					compra.setQuantidade(1);
					compra.setStatus("Pendente");
					compra.setData(LocalDateTime.now());
					compra.setConta(logado);
					compra.setFilme(new DaoFilme().selecionarPorId(idFilme));
					logado.getCompras().put(idFilme, compra);
					calcular(logado);
					mensagem = "{\"sucesso\":\"" + compra.getFilme().getTitulo() + " adicionado ao carrinho\"}";
				}
			} else if (acao.equals("remover")) {
				Integer idFilme = Integer.parseInt(req.getParameter("idFilme"));
				if (logado.getCompras().containsKey(idFilme)) {
					if (logado.getCompras().get(idFilme).getQuantidade() == 1) {
						logado.getCompras().remove(idFilme);
						mensagem = "{\"sucesso\":\"Filme removido do carrinho\"}";
					} else {
						Compra filme = logado.getCompras().get(idFilme);
						filme.setQuantidade(filme.getQuantidade() - 1);
					}
				}
				calcular(logado);
			} else if (acao.equals("inserir")) {
				if (req.getParameter("cupom") != null) {
					Integer cupom = Integer.parseInt(req.getParameter("cupom"));
					if (cupom >= 1 && cupom <= 100) {
						Compra.setDesconto(cupom);
						mensagem = "{\"sucesso\":\"Cupom inserido\"}";
						calcular(logado);
					} else {
						mensagem = "{\"falha\":\"Cupom inválido\"}";
					}
				}
			} else if (acao.equals("retirar")) {
				Compra.setDesconto(0);
				calcular(logado);
				mensagem = "{\"sucesso\":\"Cupom retirado\"}";
			} else if (acao.equals("salvar")) {
				if (logado.getCompras().isEmpty()) {
					mensagem = "{\"falha\":\"Carrinho vazio\"}";
				} else {
					new DaoCompra().inserir(logado);
					mensagem = "{\"sucesso\":\"Carrinho salvo\"}";
				}
			} else if (acao.equals("finalizar")) {
				if (logado.getCompras().isEmpty()) {
					mensagem = "{\"falha\":\"Carrinho vazio\"}";
				} else if (logado.getSaldo() < Compra.getValorTotalFinal()) {
					mensagem = "{\"falha\":\"Saldo insuficiente\"}";
				} else {
					/* - Verificar se ha itens em estoque - */
					boolean finalizar = true;
					for (Compra compra : logado.getCompras().values()) {
						Filme filmeLoja = new DaoFilme().selecionarPorId(compra.getFilme().getIdFilme());
						if (filmeLoja.getEstoque() < compra.getQuantidade()) {
							finalizar = false;
							mensagem = "{\"falha\":\"Blue ray " + filmeLoja.getTitulo() + " fora de estoque\"}";
						}
					}
					/* - finalizar a compra, ou nao - */
					if (finalizar) {
						new DaoCompra().deletar(logado.getIdConta());
						for (Compra c : logado.getCompras().values()) {
							c.getFilme().setEstoque(c.getFilme().getEstoque() - c.getQuantidade());
							c.setStatus("Comprado");
							new DaoFilme().atualizarEstoque(c.getFilme().getEstoque(), c.getFilme().getIdFilme());
						}
						new ControleArquivo().exportar(logado, "nota fiscal");
						mensagem = "{\"sucesso\":\"Arquivo salvo\"}";
						new DaoCompra().inserir(logado);
						logado.getCompras().clear();
						logado.setSaldo(logado.getSaldo() - Compra.getValorTotalFinal());
						new BancoProxy().atualizarSaldo(logado.getSaldo(), logado.getIdConta());
						calcular(logado);
						mensagem = "{\"sucesso\":\"Compra finalizada e nota fiscal salva\"}";
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			mensagem = "{\"falha\":\"" + e.getMessage() + "\"}";
		} finally {
			retornar(req, res, logado, mensagem);
		}
	}

	public static void calcular(Conta logado) throws Exception {
		Compra.setQuantidadeTotal(0);
		Compra.setValorTotal(0);
		Compra.setValorTotalFinal(0);
		if (!logado.getCompras().isEmpty()) {
			for (Compra compra : logado.getCompras().values()) {
				Compra.setQuantidadeTotal(Compra.getQuantidadeTotal() + compra.getQuantidade());
				Compra.setValorTotal(Compra.getValorTotal() + compra.getValor());
			}
		}
		Compra.setValorTotalFinal(Compra.getValorTotal());
		if (Compra.getDesconto() != 0) {
			Compra.setValorTotalFinal((Compra.getValorTotal() * Compra.getDesconto()) / 100);
		}
		Compra.setFrete(Integer.parseInt(logado.getPessoa().getCep()) <= 50000000 ? 40 : 60);
		Compra.setValorTotalFinal(Compra.getValorTotalFinal() + Compra.getFrete());
	}

	private void retornar(HttpServletRequest req, HttpServletResponse res, Conta logado, String mensagem) throws IOException {
		String json = "{\"mensagem\":" + mensagem;
		if (logado != null) {
			json += ",\"saldo\":" + logado.getSaldo();
			json += ",\"compras\":" + logado.getCompras().values();
		}
		json += ",\"frete\":" + Compra.getFrete();
		json += ",\"desconto\":" + Compra.getDesconto();
		json += ",\"quantidadeTotal\":" + Compra.getQuantidadeTotal();
		json += ",\"valorTotal\":" + Compra.getValorTotal();
		json += ",\"valorTotalFinal\":" + Compra.getValorTotalFinal();
		json += "}";
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		res.getWriter().write(json);
		res.getWriter().flush();
		res.getWriter().close();
	}
	
}