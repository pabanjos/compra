package controle.cliente;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controle.soap.BancoProxy;
import modelo.entidades.Conta;
import modelo.entidades.Transacao;
import modelo.persistencia.DaoConta;

@WebServlet("/ControleBanco")
public class ControleBanco extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Conta logado = (Conta) req.getSession().getAttribute("logado");
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
					Transacao transacao = new Transacao(null, req.getParameter("operacao"), Integer.parseInt(req.getParameter("valor")), LocalDateTime.now(), logado, logado);
					if (transacao.getValor() < 100 || transacao.getValor() > 999) {
						mensagem = "{\"falha\":\"Valor inválido\"}";
					} else {
						if (transacao.getOperacao().equals("deposito")) {
							logado.setSaldo(efetuar(transacao));
							logado.getTransacoes().add(transacao);
							mensagem = "{\"sucesso\":\"Valor depositado\"}";
						} else if (transacao.getOperacao().equals("saque")) {
							if (logado.getSaldo() < transacao.getValor()) {
								mensagem = "{\"falha\":\"Valor excedeu seu saldo\"}";
							} else {
								logado.setSaldo(efetuar(transacao));
								logado.getTransacoes().add(transacao);
								mensagem = "{\"sucesso\":\"Valor sacado\"}";
							}
						} else if (transacao.getOperacao().equals("transferencia")) {
							if (req.getParameter("idConta") == null) {
								mensagem = "{\"falha\":\"Preencha o nº da conta\"}";
							} else {
								Conta contaDestino = new DaoConta().selecionarContaPorId(Integer.parseInt(req.getParameter("idConta")));
								if (contaDestino == null) {
									mensagem = "{\"falha\":\"Conta inexistente\"}";
								} else if (logado.getIdConta().equals(contaDestino.getIdConta())) {
									mensagem = "{\"falha\":\"Não pode transferir para si mesmo\"}";
								} else if (logado.getSaldo() < transacao.getValor()) {
									mensagem = "{\"falha\":\"Valor excedeu seu saldo\"}";
								} else {
									transacao.setContaDestino(contaDestino);
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
			String json = "{\"mensagem\":" + mensagem + ",\"saldo\":\"" + logado.getSaldo() + "\",\"transacoes\":" + logado.getTransacoes() + "}";
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(json);
			res.getWriter().flush();
			res.getWriter().close();
		}
	}

	private Integer efetuar(Transacao t) throws Exception {
		String op = t.getOperacao();
		Integer va = t.getValor();
		Integer id = t.getContaLocal().getIdConta();
		Integer sa = t.getContaLocal().getSaldo();
		Integer id2 = t.getContaDestino().getIdConta();
		Integer sa2 = t.getContaDestino().getSaldo();
		return new BancoProxy().efetuar(op, va, id, sa, id2, sa2);
	}
}