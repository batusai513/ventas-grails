
<%@ page import="ventas.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="list btn waves-effect waves-light" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create btn waves-effect waves-light" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<h1 class="card-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<div id="show-producto" class="card-panel" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list producto">

					<g:if test="${productoInstance?.nombre}">
					<li class="fieldcontain">
						<b id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></b>

							<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productoInstance}" field="nombre"/></span>

					</li>
					</g:if>

					<g:if test="${productoInstance?.precio}">
					<li class="fieldcontain">
						<b id="precio-label" class="property-label"><g:message code="producto.precio.label" default="Precio" /></b>

							<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productoInstance}" field="precio"/></span>

					</li>
					</g:if>

					<g:if test="${productoInstance?.stock}">
					<li class="fieldcontain">
						<b id="stock-label" class="property-label"><g:message code="producto.stock.label" default="Stock" /></b>
							<span class="property-value" aria-labelledby="stock-label"><g:fieldValue bean="${productoInstance}" field="stock"/></span>

					</li>
					</g:if>

					<g:if test="${productoInstance?.dateCreated}">
					<li class="fieldcontain">
						<b id="dateCreated-label" class="property-label"><g:message code="producto.dateCreated.label" default="Date Created" /></b>

							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productoInstance?.dateCreated}" /></span>

					</li>
					</g:if>

					<g:if test="${productoInstance?.detalleFacturas}">
					<li class="fieldcontain">
						<b id="detalleFacturas-label" class="property-label"><g:message code="producto.detalleFacturas.label" default="Detalle Facturas" /></b>

							<g:each in="${productoInstance.detalleFacturas}" var="d">
							<span class="property-value" aria-labelledby="detalleFacturas-label"><g:link controller="detalleFactura" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
							</g:each>

					</li>
					</g:if>

					<g:if test="${productoInstance?.lastUpdated}">
					<li class="fieldcontain">
						<b id="lastUpdated-label" class="property-label"><g:message code="producto.lastUpdated.label" default="Last Updated" /></b>

							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productoInstance?.lastUpdated}" /></span>

					</li>
					</g:if>

				</ol>
				<g:form url="[resource:productoInstance, action:'delete']" method="DELETE">
					<div class="buttons">
						<g:link class="edit waves-effect waves-light btn" action="edit" resource="${productoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<button class="btn waves-effect waves-light red accent-4" type="submit" action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
