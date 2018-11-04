<section data-ng-init="buscar()">
		<fieldset class="conta colorCliente">
			<legend class="colorCliente">
				Conta
			</legend>
			<form class="pure-form pure-form-aligned" novalidate>
				<fieldset>
					<div class="pure-control-group">
						<label for="usuario">Usuario</label> <input type="text"
							id="usuario" data-ng-model="usuario" maxlength="15" size="15"
							data-ng-value="logado.usuario" required>
					</div>
					<div class="pure-control-group">
						<label for="senha">Senha</label> <input type="password" id="senha"
							data-ng-model="senha" maxlength="15" size="15"
							data-ng-value="logado.senha" required>
					</div>
					<div class="pure-control-group">
						<label for="nome">Nome</label> <input type="text" id="nome"
							data-ng-model="nome" maxlength="15" size="15"
							data-ng-value="logado.pessoa.nome" required>
					</div>
					<div class="pure-control-group">
						<label for="email">Email</label> <input type="email" id="email"
							data-ng-model="email" maxlength="20" size="15"
							data-ng-value="logado.pessoa.email" required>
					</div>
					<div class="pure-control-group">
						<label for="telefone">Telefone</label> <input type="text"
							id="telefone" data-ng-model="telefone" maxlength="15" size="15"
							data-ng-value="logado.pessoa.telefone"
							data-ui-mask="(99) 9999-9999" required>
					</div>
					<div class="pure-control-group">
						<label for="cep">CEP</label> <input type="text" id="cep"
							data-ng-model="cep" maxlength="15" size="15"
							data-ng-value="logado.pessoa.cep"
							data-ui-mask="99999-999" required>
					</div>
					<div class="pure-control-group">
						<label for="nascimento">Nascimento</label> <input type="date"
							id="nascimento" data-ng-model="nascimento"
							data-ng-value="logado.pessoa.nascimento" required>
					</div>
					<button type="submit"
						data-ng-click="atualizar(logado.idConta)"
						class="pure-button pure-button-primary button-large ok">
						<i class="fa fa-pencil fa-lg"></i> Alterar
					</button>
					<button type="submit" data-ng-click="deletar()"
						class="pure-button button-error button-large ok">
						<i class="fa fa-times fa-lg"></i> Deletar
					</button>
				</fieldset>
			</form>
		</fieldset>
</section>