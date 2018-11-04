package modelo.entidades;

import java.util.List;
import java.util.Map;

public class Conta {
	private Integer idConta;
	private String usuario;
	private String senha;
	private String perfil;
	private Integer saldo;
	private Pessoa pessoa;
	private Map<Integer, Compra> compras;
	private List<Transacao> transacoes;

	public Conta() {
	}

	public Conta(Integer idConta, Integer saldo) {
		this.idConta = idConta;
		this.saldo = saldo;
	}

	public Conta(Integer idConta, String usuario, String senha, String perfil, Integer saldo) {
		this.idConta = idConta;
		this.usuario = usuario;
		this.senha = senha;
		this.perfil = perfil;
		this.saldo = saldo;
	}

	public Conta(Integer idConta, String usuario, String senha, String perfil, Integer saldo, Pessoa pessoa) {
		this.idConta = idConta;
		this.usuario = usuario;
		this.senha = senha;
		this.perfil = perfil;
		this.saldo = saldo;
		this.pessoa = pessoa;
	}

	@Override
	public String toString() {
		return "{\"idConta\":" + idConta + ",\"usuario\":\"" + usuario + "\",\"senha\":\"" + senha + "\",\"perfil\":\"" + perfil + "\",\"saldo\":" + saldo + ",\"pessoa\":" + pessoa + "}";
	}

	public Integer getIdConta() {
		return idConta;
	}

	public void setIdConta(Integer idConta) {
		this.idConta = idConta;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public Integer getSaldo() {
		return saldo;
	}

	public void setSaldo(Integer saldo) {
		this.saldo = saldo;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Map<Integer, Compra> getCompras() {
		return compras;
	}

	public void setCompras(Map<Integer, Compra> compras) {
		this.compras = compras;
	}

	public List<Transacao> getTransacoes() {
		return transacoes;
	}

	public void setTransacoes(List<Transacao> transacoes) {
		this.transacoes = transacoes;
	}

}