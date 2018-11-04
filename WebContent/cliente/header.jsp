<header class="colorCliente">
	<nav class="left">
		<a data-ui-sref=".loja" data-ng-click="apagarMensagem()" class="pure-button button-cli">
			<i class="fa fa-tags fa-lg"></i>
		</a> 
		<a data-ui-sref=".carrinho" data-ng-click="apagarMensagem()" class="pure-button button-cli">
			<i class="fa fa-shopping-cart fa-lg"></i>
		</a> 
	</nav>
	<nav class="right"> 
		<a data-ui-sref=".banco" data-ng-click="apagarMensagem()" class="pure-button button-adm">
			<b>Saldo: </b>
			<b data-ng-class="{red: resposta.saldo<=49}">
				{{saldo | currency : "R$" }}
			</b> 
		</a> 
		&nbsp &nbsp &nbsp
		<a data-ui-sref=".suporte" data-ng-click="apagarMensagem()" class="pure-button button-cli">
			<i class="fa fa-comment fa-lg"></i>
		</a> 
		<a data-ui-sref=".conta" data-ng-click="apagarMensagem()" class="pure-button button-cli">
			<i class="fa fa-user fa-lg"></i>
		</a> 
		<button data-ng-click="sair()" class="pure-button button-error"><i class="fa fa-sign-out fa-lg"></i></button>
	</nav>
</header>

<div data-ui-view class="animacaoCliente"></div>

<footer data-ng-show="mensagem.sucesso" data-ng-mouseover="apagarMensagem()" class="sucesso">
	<b>
		<i class="fa fa-check-circle-o fa-lg"></i> 
		{{mensagem.sucesso}} 
		<i class="fa fa-exclamation"></i>
	</b>
</footer>

<footer data-ng-show="mensagem.falha" data-ng-mouseover="apagarMensagem()" class="falha">
	<b>
		<i class="fa fa-times-circle fa-lg"></i> 
		{{mensagem.falha}} 
		<i class="fa fa-exclamation"></i>
	</b>
</footer>
