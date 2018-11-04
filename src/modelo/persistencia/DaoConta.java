package modelo.persistencia;

import java.sql.PreparedStatement;
import java.time.format.DateTimeFormatter;

import modelo.entidades.Acesso;
import modelo.entidades.Conta;
import modelo.entidades.Pessoa;

public class DaoConta extends Dao {

	public void inserir(Conta conta) throws Exception {
		conectar();
		ps = con.prepareStatement("insert into Conta values (null,?,?,?,0)", PreparedStatement.RETURN_GENERATED_KEYS);
		ps.setString(1, conta.getUsuario());
		ps.setString(2, conta.getSenha());
		ps.setString(3, conta.getPerfil());
		ps.execute();
		rs = ps.getGeneratedKeys();
		rs.next();
		int key = rs.getInt(1);
		ps.close();
		ps = con.prepareStatement("insert into Pessoa values (null,?,?,?,?,?,?,?)");
		ps.setString(1, conta.getPessoa().getNome());
		ps.setString(2, conta.getPessoa().getEmail());
		ps.setString(3, conta.getPessoa().getSexo());
		ps.setString(4, conta.getPessoa().getTelefone());
		ps.setString(5, conta.getPessoa().getCep());
		ps.setString(6, conta.getPessoa().getNascimento().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		ps.setInt(7, key);
		ps.execute();
		con.close();
	}

	public Conta entrar(String usuario, String senha) throws Exception {
		conectar();
		String sql1 = "select * from Conta  ";
		String sql2 = "inner join Pessoa on Conta.idConta = Pessoa.conta ";
		String sql3 = "where usuario='" + usuario + "' and senha='" + senha + "'";
		ps = con.prepareStatement(sql1 + sql2 + sql3);
		rs = ps.executeQuery();
		Conta conta = null;
		while (rs.next()) {
			conta = new Conta(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getDate(12).toLocalDate()));
		}
		con.close();
		return conta;
	}

	public Conta selecionarContaPorId(Integer idConta) throws Exception {
		conectar();
		String sql1 = "select * from Conta ";
		String sql2 = "inner join Pessoa on Conta.idConta = Pessoa.conta ";
		String sql3 = "where Conta.idConta=" + idConta;
		ps = con.prepareStatement(sql1 + sql2 + sql3);
		rs = ps.executeQuery();
		Conta conta = null;
		while (rs.next()) {
			conta = new Conta(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getDate(12).toLocalDate()));
		}
		con.close();
		return conta;
	}

	public void atualizar(Conta conta) throws Exception {
		conectar();
		ps = con.prepareStatement("update Conta set usuario=?, senha=?, saldo=? where idConta=?");
		ps.setString(1, conta.getUsuario());
		ps.setString(2, conta.getSenha());
		ps.setInt(3, conta.getSaldo());
		ps.setInt(4, conta.getIdConta());
		ps.execute();
		ps.close();
		ps = con.prepareStatement("update Pessoa set nome=?, email=?, telefone=?, cep=?, nascimento=? where conta=?");
		ps.setString(1, conta.getPessoa().getNome());
		ps.setString(2, conta.getPessoa().getEmail());
		ps.setString(3, conta.getPessoa().getTelefone());
		ps.setString(4, conta.getPessoa().getCep());
		ps.setString(5, conta.getPessoa().getNascimento().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		ps.setInt(6, conta.getIdConta());
		ps.execute();
		con.close();
	}

	public void atualizarPerfil(Integer idConta) throws Exception {
		conectar();
		ps = con.prepareStatement("update Conta set perfil='Administrador' where idConta=" + idConta);
		ps.execute();
		con.close();
	}

	public void deletar(Integer idConta) throws Exception {
		conectar();
		ps = con.prepareStatement("delete from Conta where idConta=" + idConta);
		ps.execute();
		con.close();
	}

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