<form class="pure-form pure-form-aligned" data-ng-submit="cadastrar()" novalidate>
	<fieldset>
		<h1>Novo Filme</h1>
		<div class="pure-control-group">
			<label for="titulo">Titulo</label> 
			<input type="text" id="titulo" name="titulo" data-ng-model="novo.titulo" maxlength="50" size="15" placeholder="titulo" autofocus required>
		</div>
		<div class="pure-control-group">
			<label for="genero">Genero</label> 
			<input type="text" id="genero" name="genero" data-ng-model="novo.genero" maxlength="15" size="15" placeholder="genero" required>
		</div>
		<div class="pure-control-group">
			<label for="protagonista">Protagonista</label> 
			<input type="text" id="protagonista" name="protagonista" data-ng-model="novo.protagonista" maxlength="20" size="15" placeholder="protagonista" required>
		</div>
		<div class="pure-control-group">
			<label for="diretor">Diretor</label> 
			<input type="text" id="diretor" name="diretor" data-ng-model="novo.diretor" maxlength="20" size="15" placeholder="diretor" required>
		</div>
		<div class="pure-control-group">
			<label for="lancamento">Lancamento</label> 
			<input type="text" id="lancamento" name="lancamento" data-ng-model="novo.lancamento" maxlength="4" size="15" placeholder="lancamento" required>
		</div>
		<div class="pure-control-group">
			<label for="preco">Preço</label> 
			<input type="text" id="preco" name="preco" data-ng-model="novo.preco" maxlength="4" maxlength="30" size="15" placeholder="preco" required>
		</div>
		<div class="pure-control-group">
			<label for="estoque">Estoque</label> 
			<input type="text" id="estoque" name="estoque" data-ng-model="novo.estoque" maxlength="3" size="15" placeholder="estoque" required>
		</div>
			<button type="submit" class="pure-button pure-button-primary button-large ok">Cadastrar</button>
	</fieldset>
</form>
