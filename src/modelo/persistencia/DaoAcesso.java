package modelo.persistencia;

import modelo.entidades.Acesso;

public class DaoAcesso extends Dao {

	public void inserirAcesso(Acesso acesso) throws Exception {
		conectar();
		ps = con.prepareStatement("insert into Acesso values (null,?,?,now(),?)");
		ps.setString(1, acesso.getNome());
		ps.setString(2, acesso.getIp());
		ps.setInt(3, acesso.getConta().getIdConta());
		ps.execute();
		con.close();
	}
}
