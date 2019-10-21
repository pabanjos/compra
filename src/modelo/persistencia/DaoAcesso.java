package modelo.persistencia;

import beans.Registro;
import utils.Dao;

public class DaoAcesso extends Dao {

	public void inserirAcesso(final Registro acesso) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("insert into acesso values (null,?,?,now(),?)");
		ps.setString(1, acesso.getNome());
		ps.setString(2, acesso.getIp());
		ps.setInt(3, acesso.getUsuario().getIdUsuario());
		ps.execute();
		con.close();
	}
}
