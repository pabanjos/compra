compra.controller('controleCliente', [ '$scope', '$rootScope', '$http', '$location', function($scope, $rootScope, $http, $location) {
	/* acesso */
	$scope.entrar = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'entrar',
				usuario : $scope.teste.usuario,
				senha : $scope.teste.senha
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			if($scope.resposta.logado === undefined) {
				$location.path("/acesso");
			} else {
				$rootScope.logado = $scope.resposta.logado;
				if ($rootScope.logado.perfil === 'Cliente') {
					$rootScope.saldo = $scope.resposta.logado.saldo;
					$location.path("/cliente");
				} else if ($rootScope.logado.perfil === 'Administrador') {
					$location.path("/administrador");
				}
			}
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
		$scope.teste = {};
	};
	$scope.apagarMensagem = function() {
		$rootScope.mensagem = {};
	}
	$scope.cadastrar = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'cadastrar',
				usuario : $scope.nova.usuario,
				senha : $scope.nova.senha,
				nome : $scope.nova.nome,
				email : $scope.nova.email,
				sexo : $scope.nova.sexo,
				telefone : $scope.nova.telefone,
				cep : $scope.nova.cep,
				nascimento : $scope.nova.nascimento
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
		delete $scope.nova;
	};
	$scope.buscar = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'buscar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.saldo = $scope.resposta.saldo;
			$rootScope.logado = $scope.resposta.logado;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.atualizar = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'atualizar',
				usuario : $scope.usuario,
				senha : $scope.senha,
				nome : $scope.nome,
				email : $scope.email,
				telefone : $scope.telefone,
				cep : $scope.cep,
				nascimento : $scope.nascimento
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.logado = $scope.resposta.logado;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.deletar = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'deletar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
			delete $rootScope.logado;
			$location.path("/acesso");
		}, function(response) {
		});
	};
	$scope.sair = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'sair'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
			delete $rootScope.logado;
			$location.path("/acesso");
		}, function(response) {
		});
	};
	/* banco */
	$scope.efetuar = function() {
		$http({
			method : 'POST',
			url : 'ControleBanco',
			params : {
				acao : 'efetuar',
				operacao : $scope.banco.operacao,
				valor : $scope.banco.valor,
				idConta : $scope.banco.idConta,
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.saldo = $scope.resposta.saldo;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
		delete $scope.banco;
	};
	$scope.exportar = function() {
		$http({
			method : 'POST',
			url : 'ControleBanco',
			params : {
				acao : 'exportar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	/* compra */
	$scope.exibir = function() {
		$http({
			method : 'GET',
			url : 'http://localhost:8080/WebService_REST/controle/listas/filmes'
		}).then(function(response) {
			$scope.lista = response.data;
		}, function(response) {
		});
	};
	$scope.calcular = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : ''
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.remover = function(id) {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'remover',
				idFilme : id
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.adicionar = function(id) {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'adicionar',
				idFilme : id
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.inserir = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'inserir',
				cupom : $scope.cupom
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
		delete $scope.cupom;
	};
	$scope.retirar = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'retirar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.finalizar = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'finalizar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.saldo = $scope.resposta.saldo;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	$scope.salvar = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : 'salvar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.mensagem = $scope.resposta.mensagem;
		}, function(response) {
		});
	};
	/* chat */
	$scope.exibirContas = function() {
		$http({
			method : 'POST',
			url : 'ControleChat',
			params : {
				acao : ''
			}
		}).then(function(response) {
			$scope.chat = response.data;
		}, function(response) {
		});
	};
	$scope.exibirChat = function(id) {
		$http({
			method : 'POST',
			url : 'ControleChat',
			params : {
				acao : 'buscar',
				idContato : id
			}
		}).then(function(response) {
			$scope.chat = response.data;
		}, function(response) {
		});
	};
	$scope.enviar = function() {
		$http({
			method : 'POST',
			url : 'ControleChat',
			params : {
				acao : 'enviar',
				texto : $scope.texto
			}
		}).then(function(response) {
			$scope.chat = response.data;
		}, function(response) {
		});
		delete $scope.texto;
	};
} ]);
