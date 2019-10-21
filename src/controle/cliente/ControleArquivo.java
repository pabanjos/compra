package controle.cliente;

import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import beans.Compra;
import beans.Operacao;
import beans.Usuario;
import modelo.persistencia.DaoOperacao;

public class ControleArquivo {

	public static void main(final String[] args) {
		System.out.println(new BigDecimal("5.55").multiply(new BigDecimal("2.22")));
	}

	public void exportar(final Usuario logado, final String arquivo) throws Exception {
		File f1 = new File("C:\\arquivos");
		if (!f1.exists()) {
			f1.mkdir();
		}
		File f2 = new File(f1 + "\\" + logado.getLogin());
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
			for (Operacao t : new DaoOperacao().selecionarPorUsuario(logado.getIdUsuario())) {
				fw.write(t.toCSV());
			}
		}
		fw.flush();
		fw.close();
	}

}
