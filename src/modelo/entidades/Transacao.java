package modelo.entidades;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Transacao {
	private Integer idTransacao;
	private String operacao;
	private Integer valor;
	private LocalDateTime data;
	private Conta contaLocal;
	private Conta contaDestino;

	public Transacao() {
	}

	public Transacao(Integer idTransacao, String operacao, Integer valor, LocalDateTime data) {
		this.idTransacao = idTransacao;
		this.operacao = operacao;
		this.valor = valor;
		this.data = data;
	}

	public Transacao(Integer idTransacao, String operacao, Integer valor, LocalDateTime data, Conta contaLocal) {
		this.idTransacao = idTransacao;
		this.operacao = operacao;
		this.valor = valor;
		this.data = data;
		this.contaLocal = contaLocal;
	}

	public Transacao(Integer idTransacao, String operacao, Integer valor, LocalDateTime data, Conta contaLocal, Conta contaDestino) {
		this.idTransacao = idTransacao;
		this.operacao = operacao;
		this.valor = valor;
		this.data = data;
		this.contaLocal = contaLocal;
		this.contaDestino = contaDestino;
	}

	@Override
	public String toString() {
		return "{\"idTransacao\":" + idTransacao + ", \"operacao\":\"" + operacao + "\", \"valor\":" + valor + ", \"data\":\"" + data + "\", \"contaLocal\":" + contaLocal + ", \"contaDestino\":" + contaDestino + "}";
	}

	public String toCSV() {
		return getData2() + "\t" + operacao + "\t" + valor + "\n";
	}

	public Integer getIdTransacao() {
		return idTransacao;
	}

	public void setIdTransacao(Integer idTransacao) {
		this.idTransacao = idTransacao;
	}

	public String getOperacao() {
		return operacao;
	}

	public void setOperacao(String operacao) {
		this.operacao = operacao;
	}

	public Integer getValor() {
		return valor;
	}

	public void setValor(Integer valor) {
		this.valor = valor;
	}

	public String getData2() {
		return data.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")).concat(" às ").concat(data.format(DateTimeFormatter.ofPattern("hh:mm")));
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public Conta getContaLocal() {
		return contaLocal;
	}

	public void setContaLocal(Conta contaLocal) {
		this.contaLocal = contaLocal;
	}

	public Conta getContaDestino() {
		return contaDestino;
	}

	public void setContaDestino(Conta contaDestino) {
		this.contaDestino = contaDestino;
	}

}