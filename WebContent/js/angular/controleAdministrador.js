compra.controller('controleAdministrador', [ '$scope', '$rootScope', '$state', '$http', '$location', 'ngDialog', function($scope, $rootScope, $state, $http, $location) {
	$scope.sair = function() {
		$http({
			method : 'POST',
			url : 'ControleConta',
			params : {
				acao : 'sair'
			}
		}).then(function(response) {
			$location.path("/acesso");
		}, function(response) {
		});
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
			$rootScope.logado = $scope.resposta.logado;
		}, function(response) {
		});
	};
	$scope.exibir = function(list) {
		$http({
			method : 'GET',
			url : 'http://localhost:8080/WebService_REST/controle/listas/' + list,
		}).then(function(response) {
			$rootScope.lista = response.data;
		}, function(response) {
		});
	};
	$scope.selecionar = function(item) {
		$scope.selecionado = item;
	}
	/* clientes */
	$scope.atualizar = function(id) {
		$http({
			method : 'POST',
			url : 'http://localhost:8080/WebService_REST/controle/cliente/atualizar/'
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
				url : 'http://localhost:8080/WebService_REST/controle/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data;
			}, function(response) {
			});
		}, function(response) {
		});
		delete $scope.selecionado;
	}
	$scope.tornar = function(id) {
		$http({
			method : 'PUT',
			url : 'http://localhost:8080/WebService_REST/controle/cliente/atualizar/' + id
		}).then(function(response) {
			$http({
				method : 'GET',
				url : 'http://localhost:8080/WebService_REST/controle/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data;
			}, function(response) {
			});
		}, function(response) {
		});
		delete $scope.selecionado;
	}
	$scope.deletar = function(id) {
		$http({
			method : 'DELETE',
			url : 'http://localhost:8080/WebService_REST/controle/cliente/deletar/' + id
		}).then(function(response) {
			$http({
				method : 'GET',
				url : 'http://localhost:8080/WebService_REST/controle/listas/clientes',
			}).then(function(response) {
				$rootScope.lista = response.data;
			}, function(response) {
			});
		}, function(response) {
		});
		delete $scope.selecionado;
	}
	/* filmes */
	$scope.cadastrar = function() {
		$http({
			method : 'POST',
			url : 'http://localhost:8080/WebService_REST/controle/filme/' + JSON.stringify($scope.novo)
		}).then(function(response) {
			$rootScope.lista = response.data;
		}, function(response) {
		});
		delete $scope.novo;
	};
	$scope.alterarEstoque = function(id) {
		$http({
			method : 'PUT',
			url : 'http://localhost:8080/WebService_REST/controle/filme/' + $scope.selecionado.estoque + '/' + id
		}).then(function(response) {
			$rootScope.lista = response.data;
		}, function(response) {
		});
		delete $scope.selecionado;
	};
	$scope.deletarFilme = function(id) {
		$http({
			method : 'DELETE',
			url : 'http://localhost:8080/WebService_REST/controle/filme/' + id
		}).then(function(response) {
			$rootScope.lista = response.data;
		}, function(response) {
		});
		delete $scope.selecionado;
	};
} ]);
