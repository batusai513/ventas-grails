
<%@ page import="ventas.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="list waves-effect waves-light btn" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create waves-effect waves-light btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<div id="show-cliente" class="card-panel" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list cliente">

					<g:if test="${clienteInstance?.nombre}">
					<li class="fieldcontain">
						<b id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></b>

							<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${clienteInstance}" field="nombre"/></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.apellido}">
					<li class="fieldcontain">
						<b id="apellido-label" class="property-label"><g:message code="cliente.apellido.label" default="Apellido" /></b>

							<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${clienteInstance}" field="apellido"/></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.telefono}">
					<li class="fieldcontain">
						<b id="telefono-label" class="property-label"><g:message code="cliente.telefono.label" default="Telefono" /></b>

							<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${clienteInstance}" field="telefono"/></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.direccion}">
					<li class="fieldcontain">
						<b id="direccion-label" class="property-label"><g:message code="cliente.direccion.label" default="Direccion" /></b>

							<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${clienteInstance}" field="direccion"/></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.email}">
					<li class="fieldcontain">
						<b id="email-label" class="property-label"><g:message code="cliente.email.label" default="Email" /></b>

							<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clienteInstance}" field="email"/></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.dateCreated}">
					<li class="fieldcontain">
						<b id="dateCreated-label" class="property-label"><g:message code="cliente.dateCreated.label" default="Date Created" /></b>

							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy HH:mm" date="${clienteInstance?.dateCreated}" /></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.lastUpdated}">
					<li class="fieldcontain">
						<b id="lastUpdated-label" class="property-label"><g:message code="cliente.lastUpdated.label" default="Last Updated" /></b>

							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate format="dd-MM-yyyy HH:mm" date="${clienteInstance?.lastUpdated}" /></span>

					</li>
					</g:if>

					<g:if test="${clienteInstance?.facturas}">
					<li class="fieldcontain">
						<span id="facturas-label" class="property-label"><g:message code="cliente.facturas.label" default="Facturas" /></span>

							<g:each in="${clienteInstance.facturas}" var="f">
							<span class="property-value" aria-labelledby="facturas-label"><g:link controller="factura" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
							</g:each>

					</li>
					</g:if>

				</ol>
				<g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
					<div class="buttons">
						<g:link class="edit waves-effect waves-teal btn-flat" action="edit" resource="${clienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<button class="btn waves-effect waves-light red accent-4" type="submit" action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
