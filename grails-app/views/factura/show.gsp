
<%@ page import="ventas.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="list waves-effect waves-light btn" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create waves-effect waves-light btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="show-factura" class="content scaffold-show" role="main">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="card-panel">
					<div class="row">
						<div class="col sm12 m6">
							<b>Factura Nro:</b> ${facturaInstance.id}
						</div>
						<div class="col sm12 m6">
							<g:if test="${facturaInstance?.dateCreated}">
								<b id="dateCreated-label" class="property-label"><g:message code="factura.dateCreated.label" default="Fecha de Creacion" /></b>
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate format="dd-MM-yyyy HH:mm" date="${facturaInstance?.dateCreated}" /></span>
							</g:if>
						</div>
						<div class="col sm12 m6"></div>
					</div>
					<div class="row">
						<div class="col sm12 m6">
							<g:if test="${facturaInstance?.cliente}">
								<p>
									<span id="cliente-label" class="property-label"><g:message code="factura.cliente.label" default="Cliente" />: </span>

									<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${facturaInstance?.cliente?.id}">${facturaInstance?.cliente?.encodeAsHTML()}</g:link></span>
								</p>
							</g:if>
						</div>
						<div class="col sm12 m6">
							<g:if test="${facturaInstance?.vendedor}">
								<p>
									<span id="vendedor-label" class="property-label"><g:message code="factura.vendedor.label" default="Vendedor" /></span>

									<span class="property-value" aria-labelledby="vendedor-label"><g:link controller="vendedor" action="show" id="${facturaInstance?.vendedor?.id}">${facturaInstance?.vendedor?.encodeAsHTML()}</g:link></span>
								</p>
							</g:if>
						</div>
					</div>
					<div class="divider"></div>
					<table class="responsive-table striped">
						<thead>
							<tr>
								<th>Producto</th>
								<th>Cantidad</th>
								<th>Precio</th>
								<th>Subtotal</th>
							</tr>
						</thead>
						<g:if test="${facturaInstance?.detalleFacturas}">
							<tbody>
								<g:each in="${facturaInstance?.detalleFacturas}" var="detalle">
									<tr>
										<td>${detalle?.producto?.nombre}</td>
										<td>${detalle?.cantidad}</td>
										<td>${detalle?.precio}</td>
										<td>${detalle?.cantidad * detalle?.precio}</td>
									</tr>
								</g:each>
								<tfoot>
									<tr>
										<td colspan="3" style="text-align: right;"><b>Total:</b></td>
										<td>${facturaInstance.total()}</td>
									</tr>
								</tfoot>
							</tbody>
						</g:if>
					</table>
				</div>

				<g:form url="[resource:facturaInstance, action:'delete']" method="DELETE">
					<div class="card-panel">
						<g:link class="edit waves-effect waves-teal btn-flat" action="edit" resource="${facturaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<button class="btn waves-effect waves-light red accent-4" type="submit" action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</button>
					</div>
				</g:form>

			</div>
		</div>
	</body>
</html>
