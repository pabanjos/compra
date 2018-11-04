package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import modelo.entidades.Transacao;

public class DaoTransacao extends Dao {

	public List<Transacao> selecionarPorConta(Integer conta) throws Exception {
		conectar();
		ps = con.prepareStatement("select * from Transacao where contaLocal=?");
		ps.setInt(1, conta);
		rs = ps.executeQuery();
		List<Transacao> lista = new ArrayList<Transacao>();
		while (rs.next()) {
			lista.add(new Transacao(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4).toLocalDateTime()));
		}
		con.close();
		return lista;
	}

}