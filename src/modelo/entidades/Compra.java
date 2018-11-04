package modelo.entidades;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Compra {
	private Integer idCompra;
	private Integer quantidade;
	private String status;
	private LocalDateTime data;
	private Conta conta;
	private Filme filme;
	private Integer valor;

	private static Integer desconto = 0;
	private static Integer frete = 0;
	private static Integer quantidadeTotal = 0;
	private static Integer valorTotal = 0;
	private static Integer valorTotalFinal = 0;

	public Compra() {
	}

	public Compra(Integer idCompra, Integer quantidade, String status, LocalDateTime data, Conta conta, Filme filme) {
		this.idCompra = idCompra;
		this.quantidade = quantidade;
		this.status = status;
		this.data = data;
		this.conta = conta;
		this.filme = filme;
	}

	@Override
	public String toString() {
		return "{\"idCompra\":" + idCompra + ",\"quantidade\":" + quantidade + ",\"status\":\"" + status + "\",\"data\":\"" + data + "\",\"conta\":" + conta + ",\"filme\":" + filme + ",\"valor\":" + valor + "}";
	}

	public String toCSV() {
		return getData2() + "\t" + filme.getTitulo() + "\t" + quantidade + "\t" + filme.getPreco() + "\n";
	}

	public Integer getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Conta getConta() {
		return conta;
	}

	public void setConta(Conta conta) {
		this.conta = conta;
	}

	public Filme getFilme() {
		return filme;
	}

	public void setFilme(Filme filme) {
		this.filme = filme;
	}

	public Integer getValor() {
		valor = this.quantidade * this.filme.getPreco();
		return valor;
	}

	public void setValor(Integer valor) {
		this.valor = valor;
	}

	public static Integer getDesconto() {
		return desconto;
	}

	public static void setDesconto(Integer desconto) {
		Compra.desconto = desconto;
	}

	public static Integer getFrete() {
		return frete;
	}

	public static void setFrete(Integer frete) {
		Compra.frete = frete;
	}

	public static Integer getQuantidadeTotal() {
		return quantidadeTotal;
	}

	public static void setQuantidadeTotal(Integer quantidadeTotal) {
		Compra.quantidadeTotal = quantidadeTotal;
	}

	public static Integer getValorTotal() {
		return valorTotal;
	}

	public static void setValorTotal(Integer valorTotal) {
		Compra.valorTotal = valorTotal;
	}

	public static Integer getValorTotalFinal() {
		return valorTotalFinal;
	}

	public static void setValorTotalFinal(Integer valorTotalFinal) {
		Compra.valorTotalFinal = valorTotalFinal;
	}

}