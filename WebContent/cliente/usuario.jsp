<section data-ng-init="obterUsuarioAtual()">
		<fieldset class="conta colorCliente">
			<legend class="colorCliente">Usuario</legend>
			<form class="pure-form pure-form-aligned" novalidate>
				<fieldset>
					<div class="pure-control-group">
						<label for="login">Login</label> <input type="text"
							id="login" data-ng-model="atual.login" maxlength="15" size="15"
							data-ng-value="atual.login" required>
					</div>
					<div class="pure-control-group">
						<label for="senha">Senha</label> <input type="password" id="senha"
							data-ng-model="atual.senha" maxlength="15" size="15"
							data-ng-value="atual.senha" required>
					</div>
					<div class="pure-control-group">
						<label for="nome">Nome</label> <input type="text" id="nome"
							data-ng-model="atual.pessoa.nome" maxlength="15" size="15"
							data-ng-value="atual.pessoa.nome" required>
					</div>
					<div class="pure-control-group">
						<label for="email">Email</label> <input type="email" id="email"
							data-ng-model="atual.pessoa.email" maxlength="20" size="15"
							data-ng-value="atual.pessoa.email" required>
					</div>
					<div class="pure-control-group">
						<label for="telefone">Telefone</label> <input type="text"
							id="telefone" data-ng-model="atual.pessoa.telefone" maxlength="15" size="15"
							data-ng-value="atual.pessoa.telefone"
							data-ui-mask="(99) 9999-9999" required>
					</div>
					<div class="pure-control-group">
						<label for="cep">CEP</label> <input type="text" id="cep"
							data-ng-model="atual.pessoa.cep" maxlength="15" size="15"
							data-ng-value="atual.pessoa.cep"
							data-ui-mask="99999-999" required>
					</div>
					<div class="pure-control-group">
						<label for="nascimento">Nascimento</label> <input type="date"
							id="nascimento" data-ng-model="atual.pessoa.nascimento"
							data-ng-value="atual.pessoa.nascimento" required>
					</div>
					<button data-ng-click="atualizar()" id="alterar" 
						class="pure-button pure-button-primary button-large ok">
						<i class="fa fa-save fa-lg"></i> <span>alterar</span>
					</button>
					<button data-ng-click="deletar()" id="deletar" 
						class="pure-button button-error button-large ok">
						<i class="fa fa-times fa-lg"></i> Deletar
					</button>
				</fieldset>
			</form>
		</fieldset>
</section>