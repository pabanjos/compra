package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import beans.Operacao;
import utils.Dao;

public class DaoOperacao extends Dao {

	public List<Operacao> selecionarPorUsuario(final Integer conta) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("select * from operacao where usuarioLocal=?");
		ps.setInt(1, conta);
		rs = ps.executeQuery();
		List<Operacao> lista = new ArrayList<>();
		while (rs.next()) {
			lista.add(new Operacao(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4).toLocalDateTime()));
		}
		con.close();
		return lista;
	}

}