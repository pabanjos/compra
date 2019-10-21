<section>
	<form class="pure-form">
		<table data-ng-init="exibir('operacoes')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Operação</th>
					<th colspan="2">Usuario</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='tipo';direction=!direction">Tipo <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='valor';direction=!direction">Valor <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='data';direction=!direction">Hora - Data <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='contaLocal.login';direction=!direction">Login <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='contaLocal.saldo';direction=!direction">Saldo <i class="fa fa-sort" aria-hidden="true"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.tipo" placeholder="tipo.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.valor" placeholder="valor.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.data" placeholder="data.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.contaLocal.login" placeholder="login.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.contaLocal.saldo" placeholder="saldo.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="operacao in lista | filter:search | orderBy:order:direction | limitTo : limit">
					<th>{{operacao.tipo}}</th>
					<th>{{operacao.valor | currency : "R$" }}</th>
					<th>{{operacao.data | date:'dd/MM/yyyy'}} às {{operacao.data | date:'hh:mm'}}</th>
					<th>{{operacao.usuarioLocal.login}}</th>
					<th>{{operacao.usuarioLocal.saldo | currency : "R$" }}</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>