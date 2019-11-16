<header class="colorCliente">
	<nav class="left">
		<a data-ui-sref=".loja" class="pure-button button-cli">
			<i class="fa fa-tags fa-lg"></i>
		</a> 
		<a data-ui-sref=".carrinho" class="pure-button button-cli">
			<i class="fa fa-shopping-cart fa-lg"></i>
		</a> 
	</nav>
	<nav class="right"> 
		<a data-ui-sref=".banco" class="pure-button button-adm">
			<b>Saldo: </b>
			<b data-ng-class="{red: resposta.saldo<=49}">
				{{logado.saldo | currency : "R$" }}
			</b> 
		</a> 
		&nbsp &nbsp &nbsp
		<a data-ui-sref=".suporte" class="pure-button button-cli">
			<i class="fa fa-comment fa-lg"></i>
		</a> 
		<a data-ui-sref=".usuario" class="pure-button button-cli">
			<i class="fa fa-user fa-lg"></i>
		</a> 
		<button data-ng-click="sair()" class="pure-button button-error" id="sair">
			<i class="fa fa-sign-out fa-lg"></i></button>
	</nav>
</header>

<div data-ui-view class="animacaoCliente"></div>
<script>
</script>
