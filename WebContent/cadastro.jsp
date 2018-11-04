<form class="pure-form pure-form-aligned" novalidate>
	<fieldset>
		<h1>Nova Conta</h1>
		<div class="pure-control-group">
			<label for="usuario">Usuario</label> 
			<input type="text" id="usuario" data-ng-model="nova.usuario" maxlength="15" size="15" placeholder="usuario" autofocus required>
		</div>
		<div class="pure-control-group">
			<label for="senha">Senha</label> 
			<input type="password" id="senha" data-ng-model="nova.senha" maxlength="15" size="15" placeholder="senha" required>
		</div>
		<div class="pure-control-group">
			<label for="nome">Nome</label> 
			<input type="text" id="nome" data-ng-model="nova.nome" maxlength="15" size="15" placeholder="nome" required>
		</div>
		<div class="pure-control-group">
			<label for="email">Email</label> 
			<input type="email" id="email" data-ng-model="nova.email" maxlength="20" size="15" placeholder="email" required>
		</div>
		<div class="pure-control-group">
			<label class="pure-radio">Sexo</label> 
			<input type="radio" data-ng-model="nova.sexo" name="sexo" value="Masculino" checked> Masculino 
			<input type="radio" data-ng-model="nova.sexo" name="sexo"  value="Feminino"> Feminino
		</div>
		<div class="pure-control-group">
			<label for="telefone">Telefone</label> 
			<input type="text" id="telefone" data-ng-model="nova.telefone" maxlength="20" size="15" data-ui-mask="(99) 9999-9999" required>
		</div>
		<div class="pure-control-group">
			<label for="cep">CEP</label> 
			<input type="text" id="cep" data-ng-model="nova.cep" maxlength="20" data-ui-mask="99999-999" maxlength="30" size="15" required>
		</div>
		<div class="pure-control-group">
			<label for="nascimento">Nascimento</label> 
			<input type="date" id="nascimento" data-ng-model="nova.nascimento" required>
		</div>
			<button type="submit" data-ng-click="cadastrar()" class="pure-button pure-button-primary button-large ok">Cadastrar</button>
	</fieldset>
</form>
