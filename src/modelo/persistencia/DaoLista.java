package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import beans.Pessoa;
import beans.Usuario;
import utils.Dao;

public class DaoLista extends Dao {

	public List<Usuario> selecionarUsuarios() throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("select * from Conta inner join Pessoa on Conta.idConta = Pessoa.conta");
		rs = ps.executeQuery();
		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		while (rs.next()) {
			lista.add(new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getDate(12).toLocalDate())));
		}
		con.close();
		return lista;
	}

}
