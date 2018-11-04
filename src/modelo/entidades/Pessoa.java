package modelo.entidades;

import java.time.LocalDate;

public class Pessoa {
	private Integer idPessoa;
	private String nome;
	private String email;
	private String sexo;
	private String telefone;
	private String cep;
	private LocalDate nascimento;

	public Pessoa() {
	}

	public Pessoa(Integer idPessoa, String nome, String email, String sexo, String telefone, String cep, LocalDate nascimento) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.email = email;
		this.sexo = sexo;
		this.telefone = telefone;
		this.cep = cep;
		this.nascimento = nascimento;
	}

	@Override
	public String toString() {
		return "{\"idPessoa\":" + idPessoa + ",\"nome\":\"" + nome + "\",\"email\":\"" + email + "\",\"sexo\":\"" + sexo + "\",\"telefone\":\"" + telefone + "\",\"cep\":\"" + cep + "\",\"nascimento\":\"" + nascimento + "\"}";
	}

	public Integer getIdPessoa() {
		return idPessoa;
	}

	public void setIdPessoa(Integer idPessoa) {
		this.idPessoa = idPessoa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public LocalDate getNascimento() {
		return nascimento;
	}

	public void setNascimento(LocalDate nascimento) {
		this.nascimento = nascimento;
	}

}
