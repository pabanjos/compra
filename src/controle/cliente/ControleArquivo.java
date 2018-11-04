package controle.cliente;

import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import modelo.entidades.Compra;
import modelo.entidades.Conta;
import modelo.entidades.Transacao;
import modelo.persistencia.DaoTransacao;

public class ControleArquivo {
	
	
	public static void main(String[] args) {
		System.out.println(new BigDecimal("5.55").multiply(new BigDecimal("2.22")));
	}

	public void exportar(Conta logado, String arquivo) throws Exception {
		File f1 = new File("C:\\arquivos");
		if (!f1.exists()) {
			f1.mkdir();
		}
		File f2 = new File(f1 + "\\" + logado.getUsuario());
		if (!f2.exists()) {
			f2.mkdir();
		}
		File f3 = new File(f2 + "\\" + LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
		if (!f3.exists()) {
			f3.mkdir();
		}
		FileWriter fw = new FileWriter(f3 + "\\" + arquivo + ".csv");
		if (arquivo.equals("nota fiscal")) {
			for (Compra c : logado.getCompras().values()) {
				fw.write(c.toCSV());
			}
		} else if (arquivo.equals("extrato")) {
			for (Transacao t : new DaoTransacao().selecionarPorConta(logado.getIdConta())) {
				fw.write(t.toCSV());
			}
		}
		fw.flush();
		fw.close();
	}

}
