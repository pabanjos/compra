package modelo.persistencia;

import java.util.ArrayList;
import java.util.List;

import modelo.entidades.Conta;
import modelo.entidades.Pessoa;

public class DaoLista extends Dao {

	public List<Conta> selecionarContas() throws Exception {
		conectar();
		ps = con.prepareStatement("select * from Conta inner join Pessoa on Conta.idConta = Pessoa.conta");
		rs = ps.executeQuery();
		ArrayList<Conta> lista = new ArrayList<Conta>();
		while (rs.next()) {
			lista.add(new Conta(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12).toLocalDate())));
		}
		con.close();
		return lista;
	}

}
