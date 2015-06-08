
<%@ page import="ventas.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="create waves-effect waves-light btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="list-producto" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
					<div class="row">
						<g:each in="${productoInstanceList}" status="i" var="producto">
	              <div class="col s12 m6 l4">
	                <article class="card small">
	                  <div class="card-content">
	                    <h1 class="card-title black-text">${producto.nombre}</h1>
	                    <div class="divider"></div>
	                    <ul>
	                      <li><b>Precio: </b> $<g:formatNumber number="${producto.precio}" type="currency" currencyCode="COP" /> </li>
	                      <li><b>Stock: </b> ${producto.stock}</li>
	                    </ul>
	                  </div>
	                  <div class="card-action">
	                    <g:form resource="${producto}" method="DELETE">
	                      <g:link action="edit" id="${producto.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                      <button class="btn waves-effect waves-light red accent-4" type="submit" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
	                    </g:form>
	                  </div>
	                </article>
	              </div>
						</g:each>
					</div>
				<div class="pagination">
					<g:paginate total="${productoInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
