compra.controller('controleCliente', [ '$scope', '$rootScope', '$http', '$location', function($scope, $rootScope, $http, $location) {
	
	$scope.prefixo = 'http://localhost:8080/WebService_REST/api'
	
	/* acesso */
	$scope.entrar = function() {
		$http.post($scope.prefixo + '/usuarios/entrar', $scope.usuario
		).then(function(response) {
			$scope.resposta = response.data;
			if($scope.resposta.dados === undefined) {
				$location.path("/acesso");
			} else {
				$rootScope.logado = $scope.resposta.dados;
				if ($rootScope.logado.perfil === 'Cliente') {
					$rootScope.saldo = $rootScope.logado.saldo;
					$location.path("/cliente");
				} else if ($rootScope.logado.perfil === 'Administrador') {
					$location.path("/administrador");
				}
			}
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
		});
		$scope.usuario = {};
	};
	
	$scope.sair = function() {
		delete $rootScope.logado;
		$location.path("/acesso");
		/*
		$http({
			method : 'GET',
			url : $scope.prefixo + '/usuarios/sair'
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.logs = $scope.resposta.logs;
			delete $rootScope.logado;
			$location.path("/acesso");
		}, function(response) {
		});*/
	};
	
	$scope.apagarMensagem = function() {
		$rootScope.logs = {};
	}
	
	$scope.cadastrar = function() {
		$http({
			method : 'POST',
			url : $scope.prefixo + '/usuarios',
			params : {
				login : $scope.nova.login,
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
		});
		delete $scope.nova;
	};
	
	$scope.buscar = function() {
		$http({
			method : 'POST',
			url : 'ControleUsuario',
			params : {
				acao : 'buscar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.saldo = $scope.resposta.saldo;
			$rootScope.logado = $scope.resposta.logado;
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
		});
	};
	
	$scope.atualizar = function() {
		$http({
			method : 'POST',
			url : 'ControleUsuario',
			params : {
				acao : 'atualizar',
				login : $scope.login,
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
		});
	};
	
	$scope.deletar = function() {
		$http({
			method : 'POST',
			url : 'ControleUsuario',
			params : {
				acao : 'deletar'
			}
		}).then(function(response) {
			$scope.resposta = response.data;
			$rootScope.logs = $scope.resposta.logs;
			delete $rootScope.logado;
			$location.path("/acesso");
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			$rootScope.logs = $scope.resposta.logs;
		}, function(response) {
			console.log(response)
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
			console.log(response)
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
			console.log(response)
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
			console.log(response)
		});
		delete $scope.texto;
	};
	
} ]);
