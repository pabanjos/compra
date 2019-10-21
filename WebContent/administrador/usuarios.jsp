<section>
	<form class="pure-form">
		<table data-ng-init="exibir('usuarios')">
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Usuario</th>
					<th colspan="6">Pessoa</th>
				</tr>
				<tr class="coluna">
					<th data-ng-click="order='usuario';direction=!direction">Login <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='senha';direction=!direction">Senha <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='saldo';direction=!direction">Saldo <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.nome';direction=!direction">Nome <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.email';direction=!direction">Email <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.sexo';direction=!direction">Sexo <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.telefone';direction=!direction">Telefone <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.cep';direction=!direction">CEP <i class="fa fa-sort"></i></th>
					<th data-ng-click="order='pessoa.nascimento';direction=!direction">Nascimento <i class="fa fa-sort"></i></th>
				</tr>
				<tr>
					<th><input type="search" data-ng-model="search.login" placeholder="login.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.senha" placeholder="senha.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.saldo" placeholder="saldo.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.nome" placeholder="nome.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.email" placeholder="email.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.sexo" placeholder="sexo.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.telefone" placeholder="telefone.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.cep" placeholder="cep.." class="pure-input-rounded pure-input-1"></th>
					<th><input type="search" data-ng-model="search.pessoa.nascimento" placeholder="nascimento.." class="pure-input-rounded pure-input-1"></th>
				</tr>
			</thead>
			<tbody data-ng-init="limit=8">
				<tr data-ng-repeat="usuario in lista | filter:search | orderBy:order:direction | limitTo:limit" data-ng-click="selecionar(c)" class="selecao">
					<th>{{usuario.login}}</th>
					<th>{{usuario.senha}}</th>
					<th>{{usuario.saldo | currency : "R$" }}</th>
					<th>{{usuario.pessoa.nome}}</th>
					<th>{{usuario.pessoa.email}}</th>
					<th>{{usuario.pessoa.sexo}}</th>
					<th>{{usuario.pessoa.telefone}}</th>
					<th>{{usuario.pessoa.cep}}</th>
					<th>{{usuario.pessoa.nascimento | date:'dd/MM/yyyy'}}</th>
				</tr>
			</tbody>
			<tfoot data-ng-show="" class="colorAdministrador">
				<tr>
					<th colspan="9">
						<button data-ng-click="limit=limit+8" class="pure-button pure-input-1 button-adm">Mostrar mais...</button>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
	<br />
	<form class="pure-form" data-ng-show="selecionado">
		<table>
			<thead class="colorAdministrador">
				<tr>
					<th colspan="3">Usuario</th>
					<th colspan="6">Pessoa</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><input type="text" name="login" data-ng-model="selecionado.login" data-ng-value="selecionado.login" maxlength="15" class="pure-input-1"></th>
					<th><input type="text" name="senha" data-ng-model="selecionado.senha" data-ng-value="selecionado.senha" maxlength="15" class="pure-input-1"></th>
					<th><input type="text" name="saldo" data-ng-model="selecionado.saldo" data-ng-value="selecionado.saldo" maxlength="15" class="pure-input-1" readonly></th>
					<th><input type="text" name="nome" data-ng-model="selecionado.pessoa.nome" data-ng-value="selecionado.pessoa.nome" maxlength="15" class="pure-input-1"></th>
					<th><input type="text" name="email" data-ng-model="selecionado.pessoa.email" data-ng-value="selecionado.pessoa.email" maxlength="20" class="pure-input-1"></th>
					<th><input type="text" name="sexo" data-ng-model="selecionado.pessoa.sexo" data-ng-value="selecionado.pessoa.sexo" class="pure-input-1" readonly></th>
					<th><input type="text" name="telefone" data-ng-model="selecionado.pessoa.telefone" data-ng-value="selecionado.pessoa.telefone" maxlength="15" data-ui-mask="(99) 9999-9999" class="pure-input-1"></th>
					<th><input type="text" name="cep" data-ng-model="selecionado.pessoa.cep" data-ng-value="selecionado.pessoa.cep" maxlength="15" data-ui-mask="99999-999" class="pure-input-1"></th>
					<th><input type="text" name="nascimento" data-ng-model="selecionado.pessoa.nascimento" data-ng-value="selecionado.pessoa.nascimento" class="pure-input-1" readonly></th>
				</tr>
			</tbody>
			<tfoot class="colorAdministrador">
				<tr>
					<th colspan="3">
						<button data-ng-click="tornar(selecionado.idUsuario)" class="pure-button pure-input-1 button-warning">
							<i class="fa fa-key"></i> Tornar Administrador
						</button>
					</th>
					<th colspan="3">
						<button data-ng-click="atualizar(selecionado.idUsuario)" class="pure-button pure-input-1 pure-button-primary">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
					</th>
					<th colspan="3">
						<button data-ng-click="deletar(selecionado.idUsuario)" class="pure-button pure-input-1 button-error">
							<i class="fa fa-user-times"></i> Deletar
						</button>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</section>