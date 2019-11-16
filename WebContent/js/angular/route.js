var compra = angular.module("compra", [ "ui.router", 'ui.mask', 'ngAnimate', 'ngDialog' ]);
compra.config(function($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise("/inicio");
	$stateProvider.state('inicio', {
		url : "/inicio",
		templateUrl : "inicio.jsp",
		controller : "controleUsuario"
	}).state('usuario', {
		url : "/usuario",
		templateUrl : "usuario/header.jsp",
		controller : "controleUsuario"
	}).state('usuario.usuario', {
		url : "/usuario",
		templateUrl : "usuario/usuario.jsp",
		controller : "controleUsuario"
	}).state('usuario.banco', {
		url : "/banco",
		templateUrl : "usuario/banco.jsp",
		controller : "controleUsuario"
	}).state('usuario.carrinho', {
		url : "/carrinho",
		templateUrl : "usuario/carrinho.jsp",
		controller : "controleUsuario"
	}).state('usuario.loja', {
		url : "/loja",
		templateUrl : "usuario/loja.jsp",
		controller : "controleUsuario"
	}).state('usuario.suporte', {
		url : "/suporte",
		templateUrl : "usuario/suporte.jsp",
		controller : "controleUsuario"
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
		templateUrl : "usuario/suporte.jsp",
		controller : "controleUsuario"
	});
});
