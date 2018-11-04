<section>
	<form class="pure-form">
		<table data-ng-init="exibir('mensagens')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Conversa</th>
					<th colspan="2">Remetente</th>
					<th colspan="2">Destinatario</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='texto';direction=!direction">Mensagem <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='data';direction=!direction">Hora - Data <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='visualizada';direction=!direction">Visualizada <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='remetente.usuario';direction=!direction">Usuario <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='remetente.perfil';direction=!direction">Perfil <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='destinatario.usuario';direction=!direction">Usuario <i class="fa fa-sort" aria-hidden="true"></i></th>
					<th data-ng-click="order='destinatario.perfil';direction=!direction">Perfil <i class="fa fa-sort" aria-hidden="true"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.texto" placeholder="mensagem.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.data" placeholder="data.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.visualizada" placeholder="visualizada.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.remetente.usuario" placeholder="usuario.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.remetente.perfil" placeholder="perfil.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.destinatario.usuario" placeholder="usuario.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.destinatario.perfil" placeholder="perfil.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="c in lista | filter:search | orderBy:order:direction | limitTo : limit">
					<th>{{c.texto}}</th>
					<th>{{c.data | date:'dd/MM/yyyy'}} às {{c.data | date:'hh:mm'}}</th>
					<th>{{c.visualizada}}</th>
					<th>{{c.remetente.usuario}}</th>
					<th>{{c.remetente.perfil}}</th>
					<th>{{c.destinatario.usuario}}</th>
					<th>{{c.destinatario.perfil}}</th>
				</tr>
			</tbody>
		</table>
	</form>
</section>