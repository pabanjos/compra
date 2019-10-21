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
		<input type="text" placeholder="Login" data-ng-model="usuario.login" maxlength="10" size="10" required> 
		<input type="password" placeholder="Senha" data-ng-model="usuario.senha" maxlength="10" size="10"  required>
		<button type="submit" data-ng-click="entrar()" class="pure-button pure-button-primary">
			Acessar <i class="fa fa-sign-in"></i>
		</button>
	</form>
</header>

<div data-ui-view class="animacaoAcesso"></div>

<footer data-ng-show="logs.tipo === 'sucesso'" data-ng-mouseover="apagarMensagem()" class="sucesso">
	<b>
		<i class="fa fa-check-circle-o fa-lg"></i> 
		{{logs.texto}} 
		<i class="fa fa-exclamation"></i>
	</b>
</footer>

<footer data-ng-show="logs.tipo === 'falha'" data-ng-mouseover="apagarMensagem()" class="falha">
	<b>
		<i class="fa fa-times-circle fa-lg"></i> 
		{{logs.texto}} 
		<i class="fa fa-exclamation"></i>
	</b>
</footer>
