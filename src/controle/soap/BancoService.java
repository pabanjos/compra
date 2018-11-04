/**
 * BancoService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package controle.soap;

public interface BancoService extends javax.xml.rpc.Service {
    public java.lang.String getBancoAddress();

    public controle.soap.Banco getBanco() throws javax.xml.rpc.ServiceException;

    public controle.soap.Banco getBanco(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
