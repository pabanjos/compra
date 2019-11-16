<section data-ng-init="buscar()">
	<div class="content">
		<div class="content-left" style="width: 360px;">
			<fieldset class="colorCliente">
				<legend class="colorCliente">Transações</legend>
				<form class="pure-form">
					<input type="search" data-ng-model="search" placeholder="procurar.." class="pure-input-1">
				</form>
				<br />
					<ul>
						<li data-ng-repeat="transacao in resposta.transacoes | filter:search" 
						data-ng-class="{green: transacao.operacao=='deposito', 
										blue: transacao.operacao=='transferencia', 
										red: transacao.operacao=='saque'}">
							{{transacao.data | date:'dd/MM/yyyy'}} - {{transacao.operacao}} :
							{{transacao.valor | currency : "R$" }}
						</li>
					</ul>
				<br />
				<form class="pure-form">
					<button data-ng-click="exportar()"
						class="pure-button pure-input-1 button-large button-success">
						Salvar
					</button>
				</form>
			</fieldset>
		</div>
		<div class="content-right" style="width: 500px;">
			<fieldset class="colorCliente">
				<legend class="colorCliente"> Nova Transação </legend>
				<form class="pure-form" novalidate>
					<select data-ng-model="banco.operacao" style="width: 55%;"
						data-ng-required="true">
						<option value="">selecione uma operação</option>
						<option value="deposito">Depósito</option>
						<option value="saque">Saque</option>
						<option value="transferencia">Transferencia</option>
					</select> <input type="text" data-ng-model="banco.valor"
						data-ui-mask="999,00" data-ui-mask-placeholder
						data-ui-mask-placeholder-char="x" style="width: 20%;"
						data-ng-required="true"> <input type="text"
						data-ng-disabled="banco.operacao!='transferencia'"
						data-ng-model="banco.idConta" placeholder="Conta" value="0"
						style="width: 20%;" maxlength="4"> <br /> <br />
					<button type="submit"
						class="pure-button pure-input-1 button-large pure-button-primary"
						data-ng-click="efetuar()">Efetuar</button>
				</form>
			</fieldset>
		</div>
	</div>
</section>

