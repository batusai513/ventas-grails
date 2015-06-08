
<%@ page import="ventas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="create  waves-effect waves-light btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="list-factura" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table>
				<thead>
						<tr>

							<th><g:message code="factura.cliente.label" default="Cliente" /></th>

							<g:sortableColumn property="dateCreated" title="${message(code: 'factura.dateCreated.label', default: 'Fecha de Creacion')}" />

							<th><g:message code="factura.vendedor.label" default="Vendedor" /></th>

							<th>Total: </th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${facturaInstance.id}">${fieldValue(bean: facturaInstance, field: "cliente")}</g:link></td>

							<td><g:formatDate format="dd-MM-yyyy HH:mm" date="${facturaInstance.dateCreated}" /></td>

							<td>${facturaInstance.vendedor?.nombre} ${facturaInstance.vendedor?.apellido}</td>

							<td>${facturaInstance.total()}</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${facturaInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
