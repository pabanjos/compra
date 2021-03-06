package controle.cliente;

import java.io.IOException;
import java.net.InetAddress;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Compra;
import beans.Pessoa;
import beans.Registro;
import beans.Usuario;
import modelo.persistencia.DaoCompra;
import modelo.persistencia.DaoOperacao;
import modelo.persistencia.DaoUsuario;

@WebServlet("/ControleUsuario")
public class ControleUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(final HttpServletRequest req, final HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Usuario logado = (Usuario) session.getAttribute("logado");
		String acao = req.getParameter("acao");
		String mensagem = "{}";
		try {
			if (acao.equals("cadastrar")) {
				if ((req.getParameter("nome") == null) || (req.getParameter("email") == null)
						|| (req.getParameter("sexo") == null) || (req.getParameter("telefone") == null)
						|| (req.getParameter("nascimento") == null) || (req.getParameter("usuario") == null)
						|| (req.getParameter("senha") == null)) {
					mensagem = "{\"falha\":\"Preencha todos os campos\"}";
				} else {
					Pessoa p = new Pessoa();
					p.setNome(req.getParameter("nome"));
					p.setEmail(req.getParameter("email"));
					p.setSexo(req.getParameter("sexo"));
					p.setTelefone(req.getParameter("telefone"));
					p.setCep(req.getParameter("cep"));
					p.setNascimento(LocalDate.parse(req.getParameter("nascimento").substring(0, 10)));
					Usuario c = new Usuario();
					c.setLogin(req.getParameter("login"));
					c.setSenha(req.getParameter("senha"));
					c.setPerfil("Cliente");
					c.setPessoa(p);
					new DaoUsuario().inserir(c);
					mensagem = "{\"sucesso\":\"Usuario cadastrada\"}";
				}

			} else if (acao.equals("entrar")) {
				if ((req.getParameter("login") == null) || (req.getParameter("senha") == null)) {
					mensagem = "{\"falha\":\"Preencha todos os campos\"}";
				} else {
					String login = req.getParameter("login");
					String senha = req.getParameter("senha");
					Usuario resultado = new DaoUsuario().entrar(login, senha);
					if (resultado == null) {
						mensagem = "{\"falha\":\"Dados inválidos\"}";
					} else {
						resultado.setCompras(new DaoCompra().selecionarPendentesPorLogin(resultado.getIdUsuario()));
						resultado.setTransacoes(new DaoOperacao().selecionarPorUsuario(resultado.getIdUsuario()));
						inserirAcesso(resultado);
						session.setAttribute("logado", resultado);
						mensagem = "{\"sucesso\":\"Logado\"}";
					}
				}

			} else if (acao.equals("atualizar")) {
				logado.setLogin(req.getParameter("usuario") != null ? req.getParameter("usuario") : logado.getLogin());
				logado.setSenha(req.getParameter("senha") != null ? req.getParameter("senha") : logado.getSenha());
				logado.getPessoa().setNome(
						req.getParameter("nome") != null ? req.getParameter("nome") : logado.getPessoa().getNome());
				logado.getPessoa().setEmail(
						req.getParameter("email") != null ? req.getParameter("email") : logado.getPessoa().getEmail());
				logado.getPessoa().setTelefone(req.getParameter("telefone") != null ? req.getParameter("telefone")
						: logado.getPessoa().getTelefone());
				logado.getPessoa().setCep(
						req.getParameter("cep") != null ? req.getParameter("cep") : logado.getPessoa().getCep());
				logado.getPessoa()
						.setNascimento(req.getParameter("nascimento") != null
								? LocalDate.parse(req.getParameter("nascimento").substring(0, 10))
								: logado.getPessoa().getNascimento());
				new DaoUsuario().atualizar(logado);
				mensagem = "{\"sucesso\":\"Usuario atualizada\"}";

			} else if (acao.equals("sair")) {
				session.invalidate();
				mensagem = "{\"sucesso\":\"Deslogado\"}";

			} else if (acao.equals("deletar")) {
				new DaoUsuario().deletar(logado.getIdUsuario());
				session.invalidate();
				mensagem = "{\"sucesso\":\"Usuario deletada\"}";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mensagem = "{\"falha\":\"" + e.getMessage() + "\"}";
		} finally {
			if (acao.equals("buscar")) {
				buscar(req, res, "{}");
			} else {
				retornar(req, res, mensagem);
			}
		}
	}

	private void inserirAcesso(final Usuario c) throws Exception {
		Registro acesso = new Registro();
		acesso.setNome(InetAddress.getLocalHost().getHostName());
		acesso.setIp(InetAddress.getLocalHost().getHostAddress());
		acesso.setUsuario(c);
		new DaoUsuario().inserirAcesso(acesso);
	}

	private void retornar(final HttpServletRequest req, final HttpServletResponse res, final String mensagem) {
		Usuario logado = (Usuario) req.getSession().getAttribute("logado");
		String json = "{\"mensagem\":" + mensagem;
		try {
			if (logado != null) {
				json += ",\"logado\":" + logado;
				json += ",\"saldo\":" + logado.getSaldo();
			}
			json += "}";
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(json);
			res.getWriter().flush();
			res.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void buscar(final HttpServletRequest req, final HttpServletResponse res, final String mensagem) {
		Usuario logado = (Usuario) req.getSession().getAttribute("logado");
		String json = "{\"mensagem\":" + mensagem;
		try {
			if (logado != null) {
				json += ",\"logado\":" + logado;
				if (logado.getPerfil().equals("Cliente")) {
					json += ",\"saldo\":" + logado.getSaldo();
					json += ",\"compras\":" + logado.getCompras().values();
					json += ",\"transacoes\":" + logado.getTransacoes();
					ControleCarrinho.calcular(logado);
					json += ",\"frete\":" + Compra.getFrete();
					json += ",\"desconto\":" + Compra.getDesconto();
					json += ",\"quantidadeTotal\":" + Compra.getQuantidadeTotal();
					json += ",\"valorTotal\":" + Compra.getValorTotal();
					json += ",\"valorTotalFinal\":" + Compra.getValorTotalFinal();
				}
			}
			json += "}";
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(json);
			res.getWriter().flush();
			res.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}