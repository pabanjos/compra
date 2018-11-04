<section data-ng-init="buscar()">
	<table>
		<thead class="colorCliente">
			<tr>
				<th colspan="10">
					<button class="pure-button button-adm button-left">
						Frete: {{resposta.frete | currency : "R$" }}
					</button> Carrinho
					<button data-ng-click="salvar()" class="pure-button button-success button-right">
						<i class="fa fa-floppy-o"></i> Salvar Carrinho
					</button>
				</th>
			</tr>
			<tr>
				<th>Titulo</th>
				<th>Genero</th>
				<th>Protagonista</th>
				<th>Diretor</th>
				<th>Lancamento</th>
				<th>Preço</th>
				<th colspan="3">Quantidade</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tbody>
			<tr data-ng-repeat="c in resposta.compras">
				<td>{{c.filme.titulo}}</td>
				<td>{{c.filme.genero}}</td>
				<td>{{c.filme.protagonista}}</td>
				<td>{{c.filme.diretor}}</td>
				<td>{{c.filme.lancamento}}</td>
				<td>{{c.filme.preco | currency : "R$" }}</td>
				<th data-ng-click="remover(c.filme.idFilme)"><i class="fa fa-minus fa-lg minus-red"></i></th>
				<th>{{c.quantidade}}</th>
				<th data-ng-click="adicionar(c.filme.idFilme)"><i class="fa fa-plus fa-lg plus-green"></i></th>
				<th>{{c.valor | currency : "R$" }}</th>
			</tr>
		</tbody>
		<tfoot class="colorCliente">
			<tr>
				<td colspan="10">
					<form class="pure-form left" novalidate>
						<input type="text" data-ng-show="resposta.desconto==0" data-ng-model="cupom" data-ng-blur="inserir()" placeholder="cupom de desconto.." required>
						<button data-ng-hide="resposta.desconto==0" data-ng-click="retirar()" class="button-error pure-button">
							Retirar Cupom de {{resposta.desconto}}% de desconto
						</button>
					</form>
					<button class="pure-button button-adm right">
						Total: {{resposta.quantidadeTotal}} Itens | {{resposta.valorTotal | currency : "R$" }}
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="10">
					<button class="pure-button button-adm right">
						Valor Final: {{resposta.valorTotalFinal | currency : "R$" }}
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="10">
					<form class="pure-form">
						<button data-ng-click="finalizar()" class="pure-button pure-input-1 button-large pure-button-primary">
							<i class="fa fa-check"></i> Finalizar Compra
						</button>
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
</section>