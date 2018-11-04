<section>
	<form class="pure-form">
		<table data-ng-init="exibir('compras')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Compra</th>
					<th colspan="1">Conta</th>
					<th colspan="2">Filme</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='quantidade';direction=!direction">Quantidade <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='status';direction=!direction">Status <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='data';direction=!direction">Hora - Data <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='conta.usuario';direction=!direction">Usuario <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='filme.titulo';direction=!direction">Titulo <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='filme.preco';direction=!direction">Preço <i class="fa fa-sort" aria-hidden="true"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.quantidade" placeholder="quantidade.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.status" placeholder="status.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.data" placeholder="data.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.conta.usuario" placeholder="usuario.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.filme.titulo" placeholder="titulo.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.filme.preco" placeholder="preco.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="item in lista | filter:search | orderBy:order:direction | limitTo:limit">
					<th>{{item.quantidade}}</th>
					<th>{{item.status}}</th>
					<th>{{item.data | date:'dd/MM/yyyy'}} às {{item.data | date:'hh:mm'}}</th>
					<th>{{item.conta.usuario}}</th>
					<th>{{item.filme.titulo}}</th>
					<th>{{item.filme.preco | currency : "R$" }}</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>