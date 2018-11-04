package controle.cliente;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.entidades.Conta;
import modelo.entidades.Mensagem;
import modelo.persistencia.DaoConta;
import modelo.persistencia.DaoLista;
import modelo.persistencia.DaoMensagem;

@WebServlet("/ControleChat")
public class ControleSuporte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Conta logado = (Conta) session.getAttribute("logado");
		Conta destinatario = (Conta) session.getAttribute("destinatario");
		try {
			String acao = req.getParameter("acao");
			if (acao.equals("buscar")) {
				Integer idContato = Integer.parseInt(req.getParameter("idContato"));
				destinatario = new DaoConta().selecionarContaPorId(idContato);
				session.setAttribute("destinatario", destinatario);
				new DaoMensagem().atualizarVisualizadas(idContato, logado.getIdConta());
			} else if (acao.equals("enviar")) {
				if (req.getParameter("texto") != null) {
					String texto = req.getParameter("texto");
					new DaoMensagem().inserir(censurar(texto), logado.getIdConta(), destinatario.getIdConta());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			retornar(req, res, destinatario);
		}
	}

	private String censurar(String texto) {
		return texto.replace("\n", " ").replace("caralho", "c******").replace("porra", "p****").replace("fuder", "f****").replace("puta", "p***").replace("vsf", "v**").replace("fdp", "f**");
	}

	private void retornar(HttpServletRequest req, HttpServletResponse res, Conta destinatario) {
		Conta logado = (Conta) req.getSession().getAttribute("logado");
		String saida = "{\"contas\":[";
		try {
			List<Conta> contas = new DaoLista().selecionarContas();
			for (int x = 0; x < contas.size(); x++) {
				int naoVisualizadas = 0;
				for (Mensagem mensagem : new DaoMensagem().selecionar(logado.getIdConta(), contas.get(x).getIdConta())) {
					if (mensagem.getDestinatario().getIdConta().equals(logado.getIdConta()) && mensagem.getVisualizada().equals("nao")) {
						naoVisualizadas++;
					}
				}
				saida += "{\"contato\":" + contas.get(x).toString();
				saida += ",\"naoVisualizadas\":\"" + naoVisualizadas + "\"}";
				if ((x + 1) != contas.size()) {
					saida += ",";
				}
			}
			saida += "]";
			if (destinatario != null) {
				saida += ",\"destinatario\":" + destinatario;
				saida += ",\"mensagens\":" + new DaoMensagem().selecionar(logado.getIdConta(), destinatario.getIdConta()).toString();
			}
			saida += "}";
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(saida);
			res.getWriter().flush();
			res.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}