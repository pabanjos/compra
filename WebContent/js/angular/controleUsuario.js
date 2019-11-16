compra.controller('controleUsuario', [ '$scope', '$rootScope', '$http', 
	'$location', function($scope, $rootScope, $http, $location) {
	
	$scope.prefixo = 'http://localhost:8080/WebService_REST/api'
		
	var array = document.querySelectorAll('button');
	$scope.id = '';
	$scope.text = '';
	for (var i = 0; i < array.length; i++) {
	    array[i].addEventListener('click', function(event) {
			event.toElement.disabled = true;
			$scope.id = this.id;
			$scope.text = this.textContent;
	    	const icon = this.querySelector('i');
			const text = this.querySelector('span');
			if (icon) {
				icon.classList.add('fa-spinner');
				icon.classList.add('fa-pulse');
			}
			if (text) {
				text.innerHTML = 'processando..';
			}
	    });
	}

	$scope.complete = function() {
		var element = document.getElementById($scope.id);
		if (element) {
			element.disabled = false;
			if (element.querySelector('i')) {
				element.querySelector('i').classList.remove("fa-spinner");
				element.querySelector('i').classList.remove("fa-pulse");
			}
			if (element.querySelector('span')) {
				element.querySelector('span').innerHTML = $scope.text;
			}
		}
	}
		
	$scope.exibirMensagens = function(logs) {
		if (logs && logs.length > 0) {
			var log = logs[0];
			if (log.tipo === 'sucesso') {
				iziToast.success({
				    transitionIn: 'bounceInLeft',
					title: 'sucesso',
					message: log.texto,
					position: 'bottomRight'
				});
			} else if (log.tipo === 'falha') {
				iziToast.error({
				    transitionIn: 'bounceInLeft',
					title: 'falha',
					message: log.texto,
					position: 'bottomRight'
				});			
			}
		}
		$scope.complete();
	}
	
	$scope.convidado = {login:'qwe',senha:'qwe'};
	
	/* inicio */
	$scope.entrar = function() {
		$http.post($scope.prefixo + '/usuarios/entrar', $scope.convidado)
			.then(function(response) {
				if (response.data.logado === undefined) {
					$location.path("/inicio");
				} else {
					$rootScope.logado = response.data.logado;
					if ($rootScope.logado.perfil === 'Cliente') {
						$location.path("/usuario");
					} else if ($rootScope.logado.perfil === 'Administrador') {
						$location.path("/administrador");
					}
				}
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
	};
	
	$scope.sair = function() {
		if ($rootScope.logado) {			
			$http.post($scope.prefixo + '/usuarios/sair', $rootScope.logado)
			.then(function(response) {
				$scope.exibirMensagens(response.data.logs);
				delete $rootScope.logado;
				$location.path("/inicio");
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
		} else {
			$location.path("/inicio");
		}
	};
	
	$scope.cadastrar = function() {
		$http.post($scope.prefixo + '/usuarios', $scope.novo)
			.then(function(response) {
				delete $scope.novo;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				delete $scope.novo;
				$scope.exibirMensagens(response.data.logs);
			});
	};
	
	$scope.atualizar = function() {
		$http.put($scope.prefixo + '/usuarios', $scope.atual)
			.then(function(response) {
				$rootScope.logado = $scope.atual;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.atual = $rootScope.logado;
				$scope.exibirMensagens(response.data.logs);
			});
	};

	$scope.obterUsuarioAtual = function() {
		$scope.atual = $rootScope.logado;
	};
	
	$scope.deletar = function() {
		$http.delete($scope.prefixo + '/usuarios/' + $rootScope.logado.idUsuario)
			.then(function(response) {
				$location.path("/inicio");
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
	};
	
	/* loja */
	$scope.exibir = function() {
		$http.get($scope.prefixo + '/filmes', {headers:{'login':$rootScope.logado.login}})
			.then(function(response) {
				$scope.lista = response.data.lista;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
	};

	$scope.carrinho = [];
	
	$scope.adicionar = function(filme) {
		$scope.carrinho.push(filme);
		/*
		$http.post($scope.prefixo + '/compras/'+id, {headers:{'login':$rootScope.logado.login}})
			.then(function(response) {
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
		*/
	};
	
	$scope.calcular = function() {
		$http({
			method : 'POST',
			url : 'ControleCarrinho',
			params : {
				acao : ''
			}
		}).then(function(response) {
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
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
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
		delete $scope.texto;
	};
	
} ]);
