<%@ page import="ventas.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="list btn waves-effect waves-light" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
				<g:link class="create btn waves-effect waves-light" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="edit-producto" class="content scaffold-edit" role="main">
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${productoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${productoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form url="[resource:productoInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${productoInstance?.version}" />
						<g:render template="form"/>
					<div class="section">
					<button class="btn waves-effect waves-light" type="submit" action="update">${message(code: 'default.button.update.label', default: 'Update')}</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
