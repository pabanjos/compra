package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import beans.Mensagem;
import beans.Usuario;
import utils.Dao;

public class DaoMensagem extends Dao {

	public void inserir(final String mensagem, final Integer remetente, final Integer destinatario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("insert into mensagem values (null,?,now(),?,?,?)");
		ps.setString(1, mensagem);
		ps.setString(2, "nao");
		ps.setInt(3, remetente);
		ps.setInt(4, destinatario);
		ps.execute();
		fecharConexao();
	}

	public List<Mensagem> selecionar(final Integer remetente, final Integer destinatario) throws Exception {
		abrirConexao("compra");
		String sql1 = "select * from mensagem m ";
		String sql2 = "inner join usuario u1 on m.remetente = u1.idUsuario ";
		String sql3 = "inner join usuario u2 on m.destinatario = u2.idUsuario ";
		String sql4 = "where remetente=? and destinatario=? ";
		String sql5 = "or m.remetente=? and m.destinatario=?";
		String sql6 = "order by idMensagem desc";
		ps = con.prepareStatement(sql1 + sql2 + sql3 + sql4 + sql5 + sql6);
		ps.setInt(1, remetente);
		ps.setInt(2, destinatario);
		ps.setInt(3, destinatario);
		ps.setInt(4, remetente);
		rs = ps.executeQuery();
		List<Mensagem> lista = new ArrayList<Mensagem>();
		while (rs.next()) {
			lista.add(new Mensagem(rs.getInt(1), rs.getString(2), rs.getTimestamp(3).toLocalDateTime(), rs.getString(4),
					new Usuario(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)),
					new Usuario(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getInt(16))));
		}
		fecharConexao();
		return lista;
	}

	public void atualizarVisualizadas(final Integer remetente, final Integer destinatario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("update mensagem set visualizada='sim' where remetente=? and destinatario=?");
		ps.setInt(1, remetente);
		ps.setInt(2, destinatario);
		ps.execute();
		fecharConexao();
	}

	public void deletar(final Integer remetente, final Integer destinatario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("delete from mensagem where remetente=? and destinatario=?");
		ps.setInt(1, remetente);
		ps.setInt(2, destinatario);
		ps.execute();
		fecharConexao();
	}
}
