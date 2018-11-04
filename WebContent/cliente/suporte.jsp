<section data-ng-init="buscar()">
	<div class="content">
		<div class="content-left">
			<details data-ng-init="exibirContas()" open>
				<summary data-ng-class="{colorCliente:logado.perfil=='Cliente',colorAdministrador:logado.perfil=='Administrador'}">Suporte</summary>
				<a data-ng-href=""
					data-ng-repeat="c in chat.contas | orderBy:'perfil'"
					data-ng-hide="c.contato.idConta==logado.idConta"
					data-ng-click="exibirChat(c.contato.idConta)"
					data-ng-class="{colorCliente:c.contato.perfil=='Cliente',colorAdministrador:c.contato.perfil=='Administrador'}">
					{{c.contato.perfil}}: {{c.contato.usuario}} <span data-ng-show="c.naoVisualizadas>0"
					style="float: right; color: yellow;">{{c.naoVisualizadas}}</span>
				</a>
			</details>
		</div>
		<div data-ng-show="chat.mensagens" class="content-right"
				data-ng-class="{colorCliente:logado.perfil=='Cliente',colorAdministrador:logado.perfil=='Administrador'}">
			<br>
			<h1>{{chat.destinatario.usuario}}</h1>
			<div class="chat">
				<div data-ng-repeat="msg in chat.mensagens">
					<div
						data-ng-class="{remetente:logado.idConta==msg.remetente.idConta,
										right:logado.idConta==msg.remetente.idConta,
										colorTeal:logado.idConta==msg.remetente.idConta,
										destinatario:logado.idConta==msg.destinatario.idConta,
										left:logado.idConta==msg.destinatario.idConta,
										colorCyan:logado.idConta==msg.destinatario.idConta}">
						<p class="right">{{msg.data | date:'dd/MM/yyyy'}} às {{msg.data | date:'hh:mm'}}</p>
						<p class="left">{{msg.remetente.usuario}}</p>
						<br>
						<p class="center">{{msg.texto}}</p>
					</div>
				</div>
			</div>
			<form class="pure-form" novalidate>
				<textarea data-ng-model="texto" maxlength="140"
					placeholder="Digite a Mensagem.." rows="3" class="pure-input-1"
					autofocus></textarea>
				<br /> <br />
				<button data-ng-click="enviar(chat.destinatario.idContato)"
					class="pure-button pure-input-1 button-large pure-button-primary">Enviar</button>
			</form>
		</div>
	</div>
</section>