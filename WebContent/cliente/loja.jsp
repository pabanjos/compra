<section data-ng-init="buscar();exibir()">
	<form class="pure-form filtro">
		<select class="pure-input-1-5" data-ng-model="search.genero">
			<option value="">genero..</option>
			<option value="Animation">Animation</option>
			<option value="Comedy">Comedy</option>
			<option value="BasedOnHQ">BasedOnHQ</option>
			<option value="Action">Action</option>
			<option value="FeelGood">Feel Good</option>
			<option value="Drama">Drama</option>
			<option value="Fantasy">Fantasy</option>
			<option value="Sci-Fi">Sci-Fi</option>
			<option value="Terror">Terror</option>
		</select>
		<input type="search" class="pure-input-1-5" data-ng-model="search.titulo" placeholder="Titulo..">
		<input type="search" class="pure-input-1-5" data-ng-model="search.diretor" placeholder="Diretor..">
		<input type="search" class="pure-input-1-5" data-ng-model="search.protagonista" placeholder="Protagonista..">
		<select class="pure-input-1-5" data-ng-model="order">
			<option value="">ordem..</option>
			<option value="preco">Maior preco</option>
			<option value="lancamento">Mais recentes</option>
		</select>
	</form>
	<figure data-ng-repeat="item in lista | filter:search | orderBy:order:true" class="produto loja">
		<img data-ng-src="posters/{{item.genero}}/{{item.poster}}" />
		<figcaption>
			<b>{{item.titulo}}</b>
			<p class="gray">{{item.lancamento}}</p>
			<br />
			<p class="green">Preço: {{item.preco | currency : "R$" }}</p>
			<br />
			<button class="pure-button button-small button-secondary" data-ng-click="adicionar(item.idFilme)">Adicionar <i class="fa fa-cart-plus" aria-hidden="true"></i></button>
		</figcaption>
	</figure>
</section>