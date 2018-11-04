<aside data-ng-init="buscar()" class="colorAdministrador">
	<figure class="perfil">
		<img src="posters/adm2.png" alt="">
		<figcaption>
			<b>Logado como Administrador:</b>
			<p>{{logado.usuario}}</p>
			<button data-ng-click="sair()" class="pure-button ok button-error button-small">
				<i class="fa fa-sign-out"></i> sair
			</button>
		</figcaption>
	</figure>
	<a data-ui-sref=".contas" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-users"></i> Clientes
	</a> 
	<a data-ui-sref=".filmes" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-tags"></i> Filmes
	</a> 
	<a data-ui-sref=".mensagens" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-comments"></i> Mensagens
	</a> 
	<a data-ui-sref=".transacoes" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-usd"></i> Transa��es
	</a> 
	<a data-ui-sref=".compras" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-shopping-cart"></i> Compras
	</a>
	<a data-ui-sref=".acessos" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-pencil-square-o"></i> Acessos
	</a> 
	<a data-ui-sref=".suporte" data-ng-click="apagarMensagem()" class="button-adm">
		<i class="fa fa-comment"></i> Suporte
	</a> 
</aside>

<div data-ui-view class="animacaoAdministrador" style="margin-left: 210px;"></div>