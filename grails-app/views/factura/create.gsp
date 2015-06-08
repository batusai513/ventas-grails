<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="nav section" role="navigation">
				<g:link class="list waves-effect waves-light btn" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			</div>
			<div class="divider"></div>
			<div id="create-factura" class="content scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${facturaInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${facturaInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form url="[resource:facturaInstance, action:'save']" >
					<g:render template="form"/>
					<div class="section">
						<button class="waves-effect waves-light btn" type="submit">${message(code: 'default.button.create.label', default: 'Create')}</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
