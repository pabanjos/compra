<section>
	<form class="pure-form">
		<table data-ng-init="exibir('registros')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Registro</th>
					<th colspan="2">Usuario</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='nome';direction=!direction">PC <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='ip';direction=!direction">IP <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='data';direction=!direction">Hora - Data <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='conta.usuario';direction=!direction">Usuario <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='conta.perfil';direction=!direction">Perfil <i class="fa fa-sort" aria-hidden="true"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.nome" placeholder="nome.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.ip" placeholder="ip.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.data" placeholder="data.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.conta.usuario" placeholder="usuario.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.conta.perfil" placeholder="perfil.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="registro in lista | filter:search | orderBy:order:direction | limitTo : limit">
					<th>{{registro.nome}}</th>
					<th>{{registro.ip}}</th>
					<th>{{registro.data | date:'dd/MM/yyyy'}} às {{registro.data | date:'hh:mm'}}</th>
					<th>{{registro.usuario.login}}</th>
					<th>{{registro.usuario.perfil}}</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>