package modelo.entidades;

import java.time.LocalDateTime;

public class Acesso {
	private Integer idAcesso;
	private String nome;
	private String ip;
	private LocalDateTime data;
	private Conta conta;

	public Acesso() {
	}

	public Acesso(Integer idAcesso, String nome, String ip, LocalDateTime data) {
		this.idAcesso = idAcesso;
		this.nome = nome;
		this.ip = ip;
		this.data = data;
	}

	public Acesso(Integer idAcesso, String nome, String ip, LocalDateTime data, Conta conta) {
		this.idAcesso = idAcesso;
		this.nome = nome;
		this.ip = ip;
		this.data = data;
		this.conta = conta;
	}

	@Override
	public String toString() {
		return "{\"idAcesso\":" + idAcesso + ",\"nome\":\"" + nome + "\",\"ip\":\"" + ip + "\",\"data\":\"" + data + "\",\"conta\":" + conta + "}";
	}

	public Integer getIdAcesso() {
		return idAcesso;
	}

	public void setIdAcesso(Integer idAcesso) {
		this.idAcesso = idAcesso;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public Conta getConta() {
		return conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

}
