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
	}).state('cliente.usuario', {
		url : "/usuario",
		templateUrl : "cliente/usuario.jsp",
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
	}).state('administrador.usuarios', {
		url : "/usuarios",
		templateUrl : "administrador/usuarios.jsp",
		controller : "controleAdministrador"
	}).state('administrador.filmes', {
		url : "/filmes",
		templateUrl : "administrador/filmes.jsp",
		controller : "controleAdministrador"
	}).state('administrador.registros', {
		url : "/registros",
		templateUrl : "administrador/registros.jsp",
		controller : "controleAdministrador"
	}).state('administrador.mensagens', {
		url : "/mensagens",
		templateUrl : "administrador/mensagens.jsp",
		controller : "controleAdministrador"
	}).state('administrador.compras', {
		url : "/compras",
		templateUrl : "administrador/compras.jsp",
		controller : "controleAdministrador"
	}).state('administrador.operacoes', {
		url : "/operacoes",
		templateUrl : "administrador/operacoes.jsp",
		controller : "controleAdministrador"
	}).state('administrador.suporte', {
		url : "/suporte",
		templateUrl : "cliente/suporte.jsp",
		controller : "controleCliente"
	});
});
