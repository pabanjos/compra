var compra = angular.module("compra", [ "ui.router", 'ui.mask', 'ngAnimate', 'ngDialog' ]);
compra.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/acesso");
	$stateProvider.state('acesso', {
		url : "/acesso",
		templateUrl : "acesso.jsp",
		controller : "controleCliente"
	}).state('cliente', {
		url : "/cliente",
		templateUrl : "cliente/header.jsp",
		controller : "controleCliente"
	}).state('cliente.conta', {
		url : "/conta",
		templateUrl : "cliente/conta.jsp",
		controller : "controleCliente"
	}).state('cliente.banco', {
		url : "/banco",
		templateUrl : "cliente/banco.jsp",
		controller : "controleCliente"
	}).state('cliente.carrinho', {
		url : "/carrinho",
		templateUrl : "cliente/carrinho.jsp",
		controller : "controleCliente"
	}).state('cliente.loja', {
		url : "/loja",
		templateUrl : "cliente/loja.jsp",
		controller : "controleCliente"
	}).state('cliente.suporte', {
		url : "/suporte",
		templateUrl : "cliente/suporte.jsp",
		controller : "controleCliente"
	}).state('administrador', {
		url : "/administrador",
		templateUrl : "administrador/aside.jsp",
		controller : "controleAdministrador"
	}).state('administrador.contas', {
		url : "/contas",
		templateUrl : "administrador/contas.jsp",
		controller : "controleAdministrador"
	}).state('administrador.filmes', {
		url : "/filmes",
		templateUrl : "administrador/filmes.jsp",
		controller : "controleAdministrador"
	}).state('administrador.acessos', {
		url : "/acessos",
		templateUrl : "administrador/acessos.jsp",
		controller : "controleAdministrador"
	}).state('administrador.mensagens', {
		url : "/mensagens",
		templateUrl : "administrador/mensagens.jsp",
		controller : "controleAdministrador"
	}).state('administrador.compras', {
		url : "/compras",
		templateUrl : "administrador/compras.jsp",
		controller : "controleAdministrador"
	}).state('administrador.transacoes', {
		url : "/transacoes",
		templateUrl : "administrador/transacoes.jsp",
		controller : "controleAdministrador"
	}).state('administrador.suporte', {
		url : "/suporte",
		templateUrl : "cliente/suporte.jsp",
		controller : "controleCliente"
	});
});
