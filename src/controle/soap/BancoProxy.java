package controle.soap;

public class BancoProxy implements controle.soap.Banco {
  private String _endpoint = null;
  private controle.soap.Banco banco = null;
  
  public BancoProxy() {
    _initBancoProxy();
  }
  
  public BancoProxy(String endpoint) {
    _endpoint = endpoint;
    _initBancoProxy();
  }
  
  private void _initBancoProxy() {
    try {
      banco = (new controle.soap.BancoServiceLocator()).getBanco();
      if (banco != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)banco)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)banco)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (banco != null)
      ((javax.xml.rpc.Stub)banco)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public controle.soap.Banco getBanco() {
    if (banco == null)
      _initBancoProxy();
    return banco;
  }
  
  public int efetuar(java.lang.String operacao, int valor, int idContaLocal, int saldoLocal, int idContaDestino, int saldoDestino) throws java.rmi.RemoteException{
    if (banco == null)
      _initBancoProxy();
    return banco.efetuar(operacao, valor, idContaLocal, saldoLocal, idContaDestino, saldoDestino);
  }
  
  public void atualizarSaldo(int saldo, int idConta) throws java.rmi.RemoteException{
    if (banco == null)
      _initBancoProxy();
    banco.atualizarSaldo(saldo, idConta);
  }
  
  public void inserir(java.lang.String operacao, int valor, int idContaLocal, int idContaDestino) throws java.rmi.RemoteException{
    if (banco == null)
      _initBancoProxy();
    banco.inserir(operacao, valor, idContaLocal, idContaDestino);
  }
  
  
}