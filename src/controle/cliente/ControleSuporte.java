package controle.cliente;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Mensagem;
import beans.Usuario;
import modelo.persistencia.DaoLista;
import modelo.persistencia.DaoMensagem;
import modelo.persistencia.DaoUsuario;

@WebServlet("/ControleChat")
public class ControleSuporte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(final HttpServletRequest req, final HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Usuario logado = (Usuario) session.getAttribute("logado");
		Usuario destinatario = (Usuario) session.getAttribute("destinatario");
		try {
			String acao = req.getParameter("acao");
			if (acao.equals("buscar")) {
				Integer idUsuarioto = Integer.parseInt(req.getParameter("idUsuarioto"));
				destinatario = new DaoUsuario().selecionarUsuarioPorId(idUsuarioto);
				session.setAttribute("destinatario", destinatario);
				new DaoMensagem().atualizarVisualizadas(idUsuarioto, logado.getIdUsuario());
			} else if (acao.equals("enviar")) {
				if (req.getParameter("texto") != null) {
					String texto = req.getParameter("texto");
					new DaoMensagem().inserir(censurar(texto), logado.getIdUsuario(), destinatario.getIdUsuario());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			retornar(req, res, destinatario);
		}
	}

	private String censurar(final String texto) {
		return texto.replace("\n", " ").replace("caralho", "c******").replace("porra", "p****")
				.replace("fuder", "f****").replace("puta", "p***").replace("vsf", "v**").replace("fdp", "f**");
	}

	private void retornar(final HttpServletRequest req, final HttpServletResponse res, final Usuario destinatario) {
		Usuario logado = (Usuario) req.getSession().getAttribute("logado");
		String saida = "{\"contas\":[";
		try {
			List<Usuario> contas = new DaoLista().selecionarUsuarios();
			for (int x = 0; x < contas.size(); x++) {
				int naoVisualizadas = 0;
				for (Mensagem mensagem : new DaoMensagem().selecionar(logado.getIdUsuario(),
						contas.get(x).getIdUsuario())) {
					if (mensagem.getDestinatario().getIdUsuario().equals(logado.getIdUsuario())
							&& mensagem.getVisualizada().equals("nao")) {
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
				saida += ",\"mensagens\":"
						+ new DaoMensagem().selecionar(logado.getIdUsuario(), destinatario.getIdUsuario()).toString();
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