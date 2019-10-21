package controle.cliente;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Operacao;
import beans.Usuario;
import controle.soap.BancoProxy;
import modelo.persistencia.DaoUsuario;

@WebServlet("/ControleBanco")
public class ControleBanco extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(final HttpServletRequest req, final HttpServletResponse res)
			throws ServletException, IOException {
		Usuario logado = (Usuario) req.getSession().getAttribute("logado");
		String acao = req.getParameter("acao");
		String mensagem = "{}";
		try {
			if (acao.equals("exportar")) {
				new ControleArquivo().exportar(logado, "extrato");
				mensagem = "{\"sucesso\":\"Extrato salvo\"}";
			} else if (acao.equals("efetuar")) {
				if ((req.getParameter("valor") == null) || (req.getParameter("operacao") == null)) {
					mensagem = "{\"falha\":\"Preencha todos os campos\"}";
				} else {
					Operacao transacao = new Operacao(null, req.getParameter("operacao"),
							Integer.parseInt(req.getParameter("valor")), LocalDateTime.now(), logado, logado);
					if ((transacao.getValor() < 100) || (transacao.getValor() > 999)) {
						mensagem = "{\"falha\":\"Valor inválido\"}";
					} else {
						if (transacao.getTipo().equals("deposito")) {
							logado.setSaldo(efetuar(transacao));
							logado.getTransacoes().add(transacao);
							mensagem = "{\"sucesso\":\"Valor depositado\"}";
						} else if (transacao.getTipo().equals("saque")) {
							if (logado.getSaldo() < transacao.getValor()) {
								mensagem = "{\"falha\":\"Valor excedeu seu saldo\"}";
							} else {
								logado.setSaldo(efetuar(transacao));
								logado.getTransacoes().add(transacao);
								mensagem = "{\"sucesso\":\"Valor sacado\"}";
							}
						} else if (transacao.getTipo().equals("transferencia")) {
							if (req.getParameter("idUsuario") == null) {
								mensagem = "{\"falha\":\"Preencha o nº da conta\"}";
							} else {
								Usuario contaDestino = new DaoUsuario()
										.selecionarUsuarioPorId(Integer.parseInt(req.getParameter("idUsuario")));
								if (contaDestino == null) {
									mensagem = "{\"falha\":\"Usuario inexistente\"}";
								} else if (logado.getIdUsuario().equals(contaDestino.getIdUsuario())) {
									mensagem = "{\"falha\":\"Não pode transferir para si mesmo\"}";
								} else if (logado.getSaldo() < transacao.getValor()) {
									mensagem = "{\"falha\":\"Valor excedeu seu saldo\"}";
								} else {
									transacao.setUsuarioDestino(contaDestino);
									logado.setSaldo(efetuar(transacao));
									logado.getTransacoes().add(transacao);
									mensagem = "{\"sucesso\":\"Valor transferido\"}";
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			mensagem = "{\"falha\":\"" + e.getMessage() + "\"}";
		} finally {
			String json = "{\"mensagem\":" + mensagem + ",\"saldo\":\"" + logado.getSaldo() + "\",\"transacoes\":"
					+ logado.getTransacoes() + "}";
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(json);
			res.getWriter().flush();
			res.getWriter().close();
		}
	}

	private Integer efetuar(final Operacao t) throws Exception {
		String op = t.getTipo();
		Integer va = t.getValor();
		Integer id = t.getUsuarioLocal().getIdUsuario();
		Integer sa = t.getUsuarioLocal().getSaldo();
		Integer id2 = t.getUsuarioDestino().getIdUsuario();
		Integer sa2 = t.getUsuarioDestino().getSaldo();
		return new BancoProxy().efetuar(op, va, id, sa, id2, sa2);
	}
}