<section>
	<form class="pure-form">
		<table data-ng-init="exibir('transacoes')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Transação</th>
					<th colspan="2">Conta</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='operacao';direction=!direction">Operação <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='valor';direction=!direction">Valor <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='data';direction=!direction">Hora - Data <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='contaLocal.usuario';direction=!direction">Usuario <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='contaLocal.saldo';direction=!direction">Saldo <i class="fa fa-sort" aria-hidden="true"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.operacao" placeholder="operacao.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.valor" placeholder="valor.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.data" placeholder="data.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.contaLocal.usuario" placeholder="usuario.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.contaLocal.saldo" placeholder="saldo.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="t in lista | filter:search | orderBy:order:direction | limitTo : limit">
					<th>{{t.operacao}}</th>
					<th>{{t.valor | currency : "R$" }}</th>
					<th>{{t.data | date:'dd/MM/yyyy'}} às {{t.data | date:'hh:mm'}}</th>
					<th>{{t.contaLocal.usuario}}</th>
					<th>{{t.contaLocal.saldo | currency : "R$" }}</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>