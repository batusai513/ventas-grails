<%@ page import="ventas.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="30" required="" value="${productoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="producto.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" type="number" value="${fieldValue(bean: productoInstance, field: 'precio')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'stock', 'error')} required">
	<label for="stock">
		<g:message code="producto.stock.label" default="Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stock" type="number" min="0" value="${productoInstance.stock}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'detalleFacturas', 'error')} ">
	<label for="detalleFacturas">
		<g:message code="producto.detalleFacturas.label" default="Detalle Facturas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productoInstance?.detalleFacturas?}" var="d">
    <li><g:link controller="detalleFactura" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFactura" action="create" params="['producto.id': productoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura')])}</g:link>
</li>
</ul>


</div>

