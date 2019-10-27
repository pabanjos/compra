compra.controller('controleAdministrador', [ '$scope', '$rootScope', '$http', 
	'$location', 'ngDialog', function($scope, $rootScope, $http, $location) {
	
	$scope.prefixo = 'http://localhost:8080/WebService_REST/api'
		
		$scope.exibirMensagens = function(logs) {
			if (logs && logs.length > 0) {			
				var log = logs[0];
				if (log.tipo === 'sucesso') {
					iziToast.success({
						title: 'sucesso',
						message: log.texto,
						position: 'bottomRight',
					});
				} else if (log.tipo === 'falha') {
					iziToast.error({
						title: 'falha',
						message: log.texto,
						position: 'bottomRight',
					});			
				}
			} else {
				iziToast.error({
					title: 'erro inesperado',
					position: 'bottomRight',
				});		
			}
		}

	$scope.sair = function() {
		delete $rootScope.logado;
		$scope.exibirMensagens([{tipo:'sucesso',texto:'logout efetuado'}]);
		$location.path("/acesso");
	};
	
	$scope.exibir = function(lista) {
		$http({
			method : 'GET',
			url : $scope.prefixo + '/' + lista,
		}).then(function(response) {
			$rootScope.lista = response.data.lista;
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
	};
	
	$scope.selecionar = function(item) {
		$scope.selecionado = item;
	}
	
	/* clientes */
	$scope.atualizar = function(id) {
		$http({
			method : 'POST',
			url : $scope.prefixo + '/cliente/atualizar/'
				+ $scope.selecionado.usuario + '/'
				+ $scope.selecionado.senha + '/'
				+ id + '/'
				+ $scope.selecionado.pessoa.nome + '/'
				+ $scope.selecionado.pessoa.email + '/'
				+ $scope.selecionado.pessoa.telefone + '/'
				+ $scope.selecionado.pessoa.cep
		}).then(function(response) {
			$http({
				method : 'GET',
				url : $scope.prefixo + '/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data.lista;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
		delete $scope.selecionado;
	}
	
	$scope.tornar = function(id) {
		$http({
			method : 'PUT',
			url : $scope.prefixo + '/cliente/atualizar/' + id
		}).then(function(response) {
			$http({
				method : 'GET',
				url : $scope.prefixo + '/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data.lista;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
		}, function(response) {
		});
		delete $scope.selecionado;
	}
	
	$scope.deletar = function(id) {
		$http({
			method : 'DELETE',
			url : $scope.prefixo + '/cliente/deletar/' + id
		}).then(function(response) {
			$http({
				method : 'GET',
				url : $scope.prefixo + '/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data.lista;
				$scope.exibirMensagens(response.data.logs);
			}, function(response) {
				$scope.exibirMensagens(response.data.logs);
			});
		}, function(response) {
		});
		delete $scope.selecionado;
	}
	
	
	/* filmes */
	$scope.cadastrar = function() {
		$http({
			method : 'POST',
			url : $scope.prefixo + '/filme/' + JSON.stringify($scope.novo)
		}).then(function(response) {
			$rootScope.lista = response.data.lista;
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
		delete $scope.novo;
	};
	
	$scope.alterarEstoque = function(id) {
		$http({
			method : 'PUT',
			url : $scope.prefixo + '/filme/' + $scope.selecionado.estoque + '/' + id
		}).then(function(response) {
			$rootScope.lista = response.data.lista;
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
		delete $scope.selecionado;
	};
	
	$scope.deletarFilme = function(id) {
		$http({
			method : 'DELETE',
			url : $scope.prefixo + '/filme/' + id
		}).then(function(response) {
			$rootScope.lista = response.data.lista;
			$scope.exibirMensagens(response.data.logs);
		}, function(response) {
			$scope.exibirMensagens(response.data.logs);
		});
		delete $scope.selecionado;
	};
	
} ]);
