
<%@ page import="ventas.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="create  waves-effect waves-light btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="list-cliente" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
					<div class="row">
						<g:each in="${clienteInstanceList}" status="i" var="cliente">
	              <div class="col s12 m6 l4">
	                <article class="card small">
	                  <div class="card-content">
	                    <h1 class="card-title black-text">${cliente.nombre} ${cliente.apellido}</h1>
	                    <div class="divider"></div>
	                    <ul>
	                      <li><i class="mdi-maps-directions" aria-label="direccion"></i> ${cliente.direccion}</li>
	                      <li><i class="mdi-communication-phone" aria-label="telefono"></i> ${cliente.telefono}</li>
	                      <li><i class="mdi-communication-email" aria-label="email"></i> <a href="mailto:${cliente.email}">${cliente.email}</a></li>
	                    </ul>
	                  </div>
	                  <div class="card-action">
	                    <g:form resource="${cliente}" method="DELETE">
	                      <g:link action="edit" id="${cliente.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                      <button class="btn waves-effect waves-light red accent-4" type="submit" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
	                    </g:form>
	                  </div>
	                </article>
	              </div>
						</g:each>
					</div>
				<div class="pagination">
					<g:paginate total="${clienteInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
