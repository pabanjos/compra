package modelo.persistencia;

import java.sql.PreparedStatement;
import java.time.format.DateTimeFormatter;

import beans.Pessoa;
import beans.Registro;
import beans.Usuario;
import utils.Dao;

public class DaoUsuario extends Dao {

	public void inserir(final Usuario conta) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("insert into usuario values (null,?,?,?,0)", PreparedStatement.RETURN_GENERATED_KEYS);
		ps.setString(1, conta.getLogin());
		ps.setString(2, conta.getSenha());
		ps.setString(3, conta.getPerfil());
		ps.execute();
		rs = ps.getGeneratedKeys();
		rs.next();
		int key = rs.getInt(1);
		ps.close();
		ps = con.prepareStatement("insert into pessoa values (null,?,?,?,?,?,?,?)");
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

	public Usuario entrar(final String login, final String senha) throws Exception {
		abrirConexao("compra");
		String sql1 = "select * from usuario u  ";
		String sql2 = "inner join pessoa p on u.idUsuario = p.usuario ";
		String sql3 = "where login='" + login + "' and senha='" + senha + "'";
		ps = con.prepareStatement(sql1 + sql2 + sql3);
		rs = ps.executeQuery();
		Usuario conta = null;
		while (rs.next()) {
			conta = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getDate(12).toLocalDate()));
		}
		con.close();
		return conta;
	}

	public Usuario selecionarUsuarioPorId(final Integer idUsuario) throws Exception {
		abrirConexao("compra");
		String sql1 = "select * from usuario u ";
		String sql2 = "inner join pessoa p on u.idUsuario = p.usuario ";
		String sql3 = "where u.idUsuario=" + idUsuario;
		ps = con.prepareStatement(sql1 + sql2 + sql3);
		rs = ps.executeQuery();
		Usuario conta = null;
		while (rs.next()) {
			conta = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					new Pessoa(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
							rs.getString(11), rs.getDate(12).toLocalDate()));
		}
		con.close();
		return conta;
	}

	public void atualizar(final Usuario usuario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("update usuario set login=?, senha=?, saldo=? where idUsuario=?");
		ps.setString(1, usuario.getLogin());
		ps.setString(2, usuario.getSenha());
		ps.setInt(3, usuario.getSaldo());
		ps.setInt(4, usuario.getIdUsuario());
		ps.execute();
		ps.close();
		ps = con.prepareStatement("update pessoa set nome=?, email=?, telefone=?, cep=?, nascimento=? where conta=?");
		ps.setString(1, usuario.getPessoa().getNome());
		ps.setString(2, usuario.getPessoa().getEmail());
		ps.setString(3, usuario.getPessoa().getTelefone());
		ps.setString(4, usuario.getPessoa().getCep());
		ps.setString(5, usuario.getPessoa().getNascimento().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		ps.setInt(6, usuario.getIdUsuario());
		ps.execute();
		con.close();
	}

	public void atualizarPerfil(final Integer idUsuario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("update usuario set perfil='Administrador' where idUsuario=" + idUsuario);
		ps.execute();
		con.close();
	}

	public void deletar(final Integer idUsuario) throws Exception {
		abrirConexao("compra");
		ps = con.prepareStatement("delete from usuario where idUsuario=" + idUsuario);
		ps.execute();
		con.close();
	}

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