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

<div class="factura-detalle">

<g:each in="${facturaInstance?.detalleFacturas?}" var="item" status="i">
	<div class="row js-row-clone">
		<div class="col sm12 m3">
			<label for="detalleFacturas[${i}].producto">producto</label>
			<g:select class="browser-default" from="${ventas.Producto.list()}" name="detalleFacturas[${i}].producto" optionKey="id" optionValue="${{ it.nombre }}" value="${item?.producto?.id}" />
		</div>
		<div class="col sm12 m3">
			<label for="detalleFacturas[${i}].cantidad">Cantidad</label>
			<g:field name="detalleFacturas[${i}].cantidad" type="number" min="0" value="${item?.cantidad}" required=""/>
		</div>
		<div class="col sm12 m3">
			<label for="detalleFacturas[${i}].precio">Precio</label>
			<g:field name="detalleFacturas[${i}].precio" type="number" min="0" value="${item?.precio}" readonly="readonly" />
		</div>
		<div class="col sm12 m3">
			<label for="detalleFacturas[${i}].total">Total</label>
			<g:field name="detalleFacturas[${i}].total" type="number" min="0" value="${item?.total}" readonly="readonly" />
		</div>
	</div>
</g:each>
</div>
<a href="#" class="js-new">Nuevo</a>