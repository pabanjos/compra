package modelo.persistencia;

import java.util.HashMap;
import java.util.Map;

import beans.Compra;
import beans.Filme;
import beans.Usuario;
import utils.Dao;

public class DaoCompra extends Dao {

	public void inserir(final Usuario usuario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("insert into compra values(null,?,?,now(),?,?)");
		for (Compra compra : usuario.getCompras().values()) {
			ps.setInt(1, compra.getQuantidade());
			ps.setString(2, compra.getStatus());
			ps.setInt(3, compra.getUsuario().getIdUsuario());
			ps.setInt(4, compra.getFilme().getIdFilme());
			ps.execute();
		}
		con.close();
	}

	public Map<Integer, Compra> selecionarPendentesPorLogin(final Integer usuario) throws Exception {
		abrirConexao("compra");
		String sql1 = "select * from compra c ";
		String sql2 = "inner join usuario u on c.usuario = u.idUsuario ";
		String sql3 = "inner join filme f on c.filme = f.idFilme ";
		String sql4 = "where c.usuario=" + usuario + " and status='Pendente'";
		ps = con.prepareStatement(sql1 + sql2 + sql3 + sql4);
		rs = ps.executeQuery();
		Map<Integer, Compra> lista = new HashMap<Integer, Compra>();
		while (rs.next()) {
			lista.put(rs.getInt(12),
					new Compra(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(),
							new Usuario(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
									rs.getInt(11)),
							new Filme(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15),
									rs.getString(16), rs.getString(17), rs.getInt(18), rs.getInt(19), rs.getInt(20))));
		}
		con.close();
		return lista;
	}

	public HashMap<Integer, Compra> selecionarTodosPorLogin(final Integer conta) throws Exception {
		abrirConexao("compra");
		String sql1 = "select * from Compra ";
		String sql2 = "inner join Login on Compra.conta = Login.idLogin  ";
		String sql3 = "inner join Filme on Compra.filme = Filme.idFilme ";
		String sql4 = "where Compra.conta=" + conta + "";
		ps = con.prepareStatement(sql1 + sql2 + sql3 + sql4);
		rs = ps.executeQuery();
		HashMap<Integer, Compra> lista = new HashMap<Integer, Compra>();
		while (rs.next()) {
			lista.put(rs.getInt(12),
					new Compra(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(),
							new Usuario(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
									rs.getInt(11)),
							new Filme(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15),
									rs.getString(16), rs.getString(17), rs.getInt(18), rs.getInt(19), rs.getInt(20))));
		}
		con.close();
		return lista;
	}

	public void updateStatus(final Integer idLogin) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("update Compra set status='Comprado' where status='Pendente' and conta=" + idLogin);
		ps.execute();
		con.close();
	}

	public void deletar(final Integer idLogin) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("delete from Compra where conta=" + idLogin + " and status='Pendente'");
		ps.execute();
		con.close();
	}

}