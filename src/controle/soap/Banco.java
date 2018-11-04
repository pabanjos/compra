/**
 * Banco.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package controle.soap;

public interface Banco extends java.rmi.Remote {
    public int efetuar(java.lang.String operacao, int valor, int idContaLocal, int saldoLocal, int idContaDestino, int saldoDestino) throws java.rmi.RemoteException;
    public void atualizarSaldo(int saldo, int idConta) throws java.rmi.RemoteException;
    public void inserir(java.lang.String operacao, int valor, int idContaLocal, int idContaDestino) throws java.rmi.RemoteException;
}
