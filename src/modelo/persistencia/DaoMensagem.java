package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import modelo.entidades.Conta;
import modelo.entidades.Mensagem;

public class DaoMensagem extends Dao {

	public void inserir(String mensagem, Integer remetente, Integer destinatario) throws Exception {
		conectar();
		ps = con.prepareStatement("insert into Mensagem values (null,?,now(),?,?,?)");
		ps.setString(1, mensagem);
		ps.setString(2, "nao");
		ps.setInt(3, remetente);
		ps.setInt(4, destinatario);
		ps.execute();
		con.close();
	}

	public List<Mensagem> selecionar(Integer remetente, Integer destinatario) throws Exception {
		conectar();
		String sql1 = "select * from Mensagem ";
		String sql2 = "inner join Conta remetente on Mensagem.remetente = remetente.idConta ";
		String sql3 = "inner join Conta destinatario on Mensagem.destinatario = destinatario.idConta ";
		String sql4 = "where remetente=? and destinatario=? ";
		String sql5 = "or remetente=? and destinatario=? ";
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
					new Conta(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)),
					new Conta(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getInt(16))));
		}
		con.close();
		return lista;
	}

	public void atualizarVisualizadas(Integer remetente, Integer destinatario) throws Exception {
		conectar();
		ps = con.prepareStatement("update Mensagem set visualizada='sim' where remetente=? and destinatario=?");
		ps.setInt(1, remetente);
		ps.setInt(2, destinatario);
		ps.execute();
		con.close();
	}

	public void deletar(Integer remetente, Integer destinatario) throws Exception {
		conectar();
		ps = con.prepareStatement("delete from Mensagem where remetente=? and destinatario=?");
		ps.setInt(1, remetente);
		ps.setInt(2, destinatario);
		ps.execute();
		con.close();
	}
}
