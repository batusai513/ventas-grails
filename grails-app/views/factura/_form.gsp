<%@ page import="ventas.Factura" %>



<div class="row">
	<div class="col sm12 m6">
		<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'cliente', 'error')} required">
			<label for="cliente">
				<g:message code="factura.cliente.label" default="Cliente" />
				<span class="required-indicator">*</span>
			</label>
			<g:select id="cliente" name="cliente.id" from="${ventas.Cliente.list()}" optionKey="id" required="" value="${facturaInstance?.cliente?.id}" />

		</div>
	</div>
	<div class="col sm12 m6">
		<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'vendedor', 'error')} required">
			<label for="vendedor">
				<g:message code="factura.vendedor.label" default="Vendedor" />
				<span class="required-indicator">*</span>
			</label>
			<g:select id="vendedor" name="vendedor.id" from="${ventas.Vendedor.list()}" optionKey="id" required="" value="${facturaInstance?.vendedor?.id}" class="many-to-one"/>

			<g:select from="${ventas.Producto.list()}" name="detalleFacturas.producto" optionKey="id" optionValue="${{ it.nombre }}" value="facturaInstance?.detalleFacturas?.producto.nombre" />

		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'detalleFacturas', 'error')} ">
	<label for="detalleFacturas">
		<g:message code="factura.detalleFacturas.label" default="Detalle Facturas" />
	</label>
	
<ul class="one-to-many">
<g:each in="${facturaInstance?.detalleFacturas?}" var="d">
    <li><g:link controller="detalleFactura" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFactura" action="create" params="['factura.id': facturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura')])}</g:link>
</li>
</ul>


</div>

