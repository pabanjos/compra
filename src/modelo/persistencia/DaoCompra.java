package modelo.persistencia;

import java.util.HashMap;
import java.util.Map;

import modelo.entidades.Compra;
import modelo.entidades.Conta;
import modelo.entidades.Filme;

public class DaoCompra extends Dao {

	public void inserir(Conta conta) throws Exception {
		conectar();
		ps = con.prepareStatement("insert into Compra values(null,?,?,now(),?,?)");
		for (Compra compra : conta.getCompras().values()) {
			ps.setInt(1, compra.getQuantidade());
			ps.setString(2, compra.getStatus());
			ps.setInt(3, compra.getConta().getIdConta());
			ps.setInt(4, compra.getFilme().getIdFilme());
			ps.execute();
		}
		con.close();
	}

	public Map<Integer, Compra> selecionarPendentesPorConta(Integer conta) throws Exception {
		conectar();
		String sql1 = "select * from Compra ";
		String sql2 = "inner join Conta on Compra.conta = Conta.idConta  ";
		String sql3 = "inner join Filme on Compra.filme = Filme.idFilme ";
		String sql4 = "where Compra.conta=" + conta + " and status='Pendente'";
		ps = con.prepareStatement(sql1 + sql2 + sql3 + sql4);
		rs = ps.executeQuery();
		Map<Integer, Compra> lista = new HashMap<Integer, Compra>();
		while (rs.next()) {
			lista.put(rs.getInt(12), new Compra(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(),
							new Conta(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)),
							new Filme(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getInt(18), rs.getInt(19),rs.getInt(20))));
		}
		con.close();
		return lista;
	}

	public HashMap<Integer, Compra> selecionarTodosPorConta(Integer conta) throws Exception {
		conectar();
		String sql1 = "select * from Compra ";
		String sql2 = "inner join Conta on Compra.conta = Conta.idConta  ";
		String sql3 = "inner join Filme on Compra.filme = Filme.idFilme ";
		String sql4 = "where Compra.conta=" + conta + "";
		ps = con.prepareStatement(sql1 + sql2 + sql3 + sql4);
		rs = ps.executeQuery();
		HashMap<Integer, Compra> lista = new HashMap<Integer, Compra>();
		while (rs.next()) {
			lista.put(rs.getInt(12),
					new Compra(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(),
							new Conta(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)),
							new Filme(rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getInt(18), rs.getInt(19),rs.getInt(20))));
		}
		con.close();
		return lista;
	}

	public void updateStatus(Integer idConta) throws Exception {
		conectar();
		ps = con.prepareStatement("update Compra set status='Comprado' where status='Pendente' and conta=" + idConta);
		ps.execute();
		con.close();
	}

	public void deletar(Integer idConta) throws Exception {
		conectar();
		ps = con.prepareStatement("delete from Compra where conta=" + idConta + " and status='Pendente'");
		ps.execute();
		con.close();
	}

}