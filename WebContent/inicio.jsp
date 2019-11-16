<header class="colorAcesso">
	<button type="button"
		class="pure-button button-secondary"
	    data-ng-dialog="cadastro.jsp"
	    data-ng-dialog-class="ngdialog-theme-default"
	    data-ng-dialog-controller="controleCliente"
	    data-ng-dialog-close-previous>
	    Cadastrar
	</button>
	<form name="acesso" class="pure-form right" novalidate>
		<input type="text" placeholder="Login" data-ng-model="convidado.login" maxlength="10" size="10" required> 
		<input type="password" placeholder="Senha" data-ng-model="convidado.senha" maxlength="10" size="10"  required>
		<button data-ng-click="entrar()" class="pure-button pure-button-primary" id="entrar" >
			<i class="fa fa-sign-in fa-lg"></i>
		</button>
	</form>
</header>

<div data-ui-view class="animacaoAcesso"></div>
<script>
</script>
