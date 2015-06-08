
<%@ page import="ventas.Vendedor" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vendedor.label', default: 'Vendedor')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="container">
      <div class="nav section" role="navigation">
        <g:link class="registrar  waves-effect waves-light btn" action="registrar"><g:message code="default.new.label" args="[entityName]" /></g:link>
      </div>
      <div class="divider"></div>
      <div id="list-vendedor" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
        <thead>
            <tr>

              <th><g:message code="vendedor.nombre.label" default="Nombre" /></th>

              <g:sortableColumn property="apellido" title="${message(code: 'vendedor.apellido.label', default: 'Apellido')}" />

              <th><g:message code="vendedor.username.label" default="Nombre de usuario" /></th>

              <th><g:message code="vendedor.email.label" default="Email" /></th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${vendedorInstanceList}" status="i" var="vendedorInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

              <td><g:link action="show" id="${vendedorInstance.id}">${fieldValue(bean: vendedorInstance, field: "nombre")}</g:link></td>

              <td>${vendedorInstance.apellido}</td>

              <td>${vendedorInstance.username}</td>

              <td>${vendedorInstance.email}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
        <div class="pagination">
          <g:paginate total="${vendedorInstanceCount ?: 0}" />
        </div>
      </div>
    </div>
  </body>
</html>