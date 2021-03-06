<aside class="colorAdministrador">
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
	<a data-ui-sref=".usuarios" class="button-adm">
		<i class="fa fa-users"></i> Usuarios
	</a> 
	<a data-ui-sref=".filmes" class="button-adm">
		<i class="fa fa-tags"></i> Filmes
	</a> 
	<a data-ui-sref=".mensagens" class="button-adm">
		<i class="fa fa-comments"></i> Mensagens
	</a> 
	<a data-ui-sref=".operacoes" class="button-adm">
		<i class="fa fa-usd"></i> Opera��es
	</a> 
	<a data-ui-sref=".compras" class="button-adm">
		<i class="fa fa-shopping-cart"></i> Compras
	</a>
	<a data-ui-sref=".registros" class="button-adm">
		<i class="fa fa-pencil-square-o"></i> Registros
	</a> 
	<a data-ui-sref=".suporte" class="button-adm">
		<i class="fa fa-comment"></i> Suporte
	</a> 
</aside>

<div data-ui-view class="animacaoAdministrador" style="margin-left: 210px;"></div>
