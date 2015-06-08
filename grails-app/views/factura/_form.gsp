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
		</div>
	</div>
</div>


<g:each in="${facturaInstance?.detalleFacturas?}" var="item" status="i">
	<g:hiddenField name='expandableDetalleList[${i}].id' value='${item?.id}'/>
	<div class="row">
		<div class="col sm12 m3">
			<label for="expandableDetalleList[${i}].producto">producto</label>
			<g:select class="browser-default" from="${ventas.Producto.list()}" name="expandableDetalleList[${i}].producto" optionKey="id" optionValue="${{ it.nombre }}" value="${item?.producto?.id}" />
		</div>
		<div class="col sm12 m3">
			<label for="expandableDetalleList[${i}].cantidad">Cantidad</label>
			<g:field name="expandableDetalleList[${i}].cantidad" type="number" min="0" value="${item.cantidad}" required=""/>
		</div>
		<div class="col sm12 m3">
			<label for="expandableDetalleList[${i}].precio">Precio</label>
			<g:field name="expandableDetalleList[${i}].precio" type="number" min="0" value="${item.precio}" required=""/>
		</div>
		<div class="col sm12 m3">
			<label for="expandableDetalleList[${i}].total">Total</label>
			<g:field name="expandableDetalleList[${i}].total" type="number" min="0" value="${item.total}" required=""/>
		</div>
	</div>
</g:each>