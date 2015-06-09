<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="materialize.css"/>
  		<asset:stylesheet src="app.css"/>
		<g:layoutHead/>
	</head>
	<body>
    <header>
        <nav>
            <div class="container">
              <h1 class="h5 left">
                <a class="home" href="${createLink(uri: '/')}">
                Ventas
                </a>
              </h1>
              <div class="right">
                <sec:ifLoggedIn>
                  <g:form name="logoutForm" controller="logout" action="index">
                    <button class="btn waves-effect waves-light blue accent-3" type="submit" name="signOut">Salir</button>
                  </g:form>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                  <g:link class="btn waves-effect waves-light blue accent-3" controller='login' action='form'>Login</g:link>
                </sec:ifNotLoggedIn>
              </div>
              <ul class="right hide-on-med-and-down">
                <li class="${controllerName.equals('producto') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'producto']">Productos</g:link>
                </li>
                <sec:ifLoggedIn>
                <li class="${controllerName.equals('cliente') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'cliente']">Clientes</g:link>
                </li>
                <li class="${controllerName.equals('vendedor') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'vendedor']">Vendedor</g:link>
                </li>
                <li class="${controllerName.equals('factura') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'factura']">Facturas</g:link>
                </li>
                </sec:ifLoggedIn>

              </ul>
              <ul id="slide-out" class="side-nav">
                <li class="${controllerName.equals('producto') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'producto']">Productos</g:link>
                </li>
                <sec:ifLoggedIn>
                <li class="${controllerName.equals('cliente') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'cliente']">Clientes</g:link>
                </li>
                <li class="${controllerName.equals('factura') ? 'active' : ''}">
                    <g:link url="[action: 'index', controller: 'factura']">Facturas</g:link>
                </li>
                </sec:ifLoggedIn>
              </ul>
              <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
            </div>
        </nav>
    </header>
    <div class="section">
        <g:layoutBody/>
    </div>
    <asset:javascript src="application.js"/>
	</body>
</html>
