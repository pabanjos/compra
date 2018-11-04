package modelo.persistencia;

import modelo.entidades.Filme;

public class DaoFilme extends Dao {

	public Filme selecionarPorId(Integer idFilme) throws Exception {
		conectar();
		ps = con.prepareStatement("select * from filme where idFilme="+idFilme);
		rs = ps.executeQuery();
		Filme filme = null;
		while(rs.next()) {
			filme = new Filme(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9));
		}
		con.close();
		return filme;
	}

	public void atualizarEstoque(Integer estoque, Integer idFilme) throws Exception {
		conectar();
		ps = con.prepareStatement("update Filme set estoque=? where idFilme=?");
		ps.setInt(1, estoque);
		ps.setInt(2, idFilme);
		ps.execute();
		con.close();
	}

}