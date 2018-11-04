package modelo.entidades;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Mensagem {
	private Integer idMensagem;
	private String texto;
	private LocalDateTime data;
	private String visualizada;
	private Conta remetente;
	private Conta destinatario;

	public Mensagem() {
	}

	public Mensagem(Integer idMensagem, String texto, LocalDateTime data, String visualizada, Conta remetente, Conta destinatario) {
		this.idMensagem = idMensagem;
		this.texto = texto;
		this.data = data;
		this.visualizada = visualizada;
		this.remetente = remetente;
		this.destinatario = destinatario;
	}

	@Override
	public String toString() {
		return "{\"idMensagem\":" + idMensagem + ",\"texto\":\"" + texto + "\",\"data\":\"" + data + "\",\"visualizada\":\"" + visualizada + "\",\"remetente\":" + remetente + ",\"destinatario\":" + destinatario + "}";
	}

	public Integer getIdMensagem() {
		return idMensagem;
	}

	public void setIdMensagem(Integer idMensagem) {
		this.idMensagem = idMensagem;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public LocalDateTime getData() {
		return data;
	}

	public String getDataFormatada() {
		return data.format(DateTimeFormatter.ofPattern("hh:mm:ss dd/MM/yyyy"));
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public String getVisualizada() {
		return visualizada;
	}

	public void setVisualizada(String visualizada) {
		this.visualizada = visualizada;
	}

	public Conta getRemetente() {
		return remetente;
	}

	public void setRemetente(Conta remetente) {
		this.remetente = remetente;
	}

	public Conta getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(Conta destinatario) {
		this.destinatario = destinatario;
	}

}