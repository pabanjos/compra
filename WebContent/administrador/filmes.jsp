<section>
	<form class="pure-form">
		<table data-ng-init="exibir('filmes')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="8">
						<button type="button"
							class="pure-button button-secondary button-left"
						    data-ng-dialog="administrador/cadastro.jsp"
						    data-ng-dialog-class="ngdialog-theme-default"
						    data-ng-dialog-controller="controleAdministrador"
						    data-ng-dialog-close-previous>
						    Cadastrar
						</button>
						Filmes
					</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='titulo';direction=!direction">Titulo <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='genero';direction=!direction">Genero <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='protagonista';direction=!direction">Protagonista <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='diretor';direction=!direction">Diretor <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='lancamento';direction=!direction">Lancamento <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='preco';direction=!direction">Preço <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='estoque';direction=!direction">Estoque <i class="fa fa-sort"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.titulo" placeholder="titulo.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.genero" placeholder="genero.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.protagonista" placeholder="protagonista.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.diretor" placeholder="diretor.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.lancamento" placeholder="lancamento.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.preco" placeholder="preco.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.estoque" placeholder="estoque.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="filme in lista | filter:search | orderBy:order:direction | limitTo : limit" data-ng-click="selecionar(item)" class="selecao">
					<th>{{filme.titulo}}</th>
					<th>{{filme.genero}}</th>
					<th>{{filme.protagonista}}</th>
					<th>{{filme.diretor}}</th>
					<th>{{filme.lancamento}}</th>
					<th>{{filme.preco | currency : "R$" }}</th>
					<th>{{filme.estoque}}</th>
				</tr>
			</tbody>
		</table>
	</form>
	<br />
		<div data-ng-show="selecionado" class="content">
			<div class="content-left colorAdministrador" style="width: 210px; padding:30px;">
				<form class="pure-form" data-enctype="multipart/form-data">
					<figure>
						<img data-ng-src="posters/{{selecionado.genero}}/{{selecionado.poster}}" />
						<figcaption>
							<input type="file" style="width: 112px;" />
						</figcaption>
					</figure>
				</form>
			</div>
			<div class="content-right colorAdministrador" style="width: 530px; padding:30px;">
				<form class="pure-form">
					<ul>
						<li>Titulo: {{selecionado.titulo}}</li>
						<li>Genero: {{selecionado.genero}}</li>
						<li>Protagonista: {{selecionado.protagonista}}</li>
						<li>Diretor: {{selecionado.diretor}}</li>
						<li>Lancamento: {{selecionado.lancamento}}</li>
						<li>Preço: {{selecionado.preco}}</li>
						<li>Estoque: <input type="text" data-ng-model="selecionado.estoque" data-ng-blur="alterarEstoque(selecionado.idFilme)"></li>
					</ul>
					<button data-ng-click="deletarFilme(selecionado.idFilme)" class="pure-button button-error ok">deletar filme</button>
				</form>
			</div>
		</div>
</section>