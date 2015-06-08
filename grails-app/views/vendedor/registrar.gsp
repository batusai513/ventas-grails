<html>
<head>
    <title>Registrar vendedor</title>
    <meta name="layout" content="main">
</head>
<body>

  <div class="card login-card">
    <g:form action="registrar" method="POST">
      <div class="card-content">
        <h1 class="card-title black-text">Registrar como vendedor</h1>
        <hr class="divider"></hr>

          <div class="fieldcontain required">
              <label for="username">Nombre de usuario</label>
              <g:textField name="username" value="${username}"/>
          </div>
          <div class="fieldcontain required">
              <label for="password">Contrasena</label>
              <g:passwordField name="password"/>
          </div>
          <div class="fieldcontain required">
              <label for="nombre">Nombre</label>
              <g:textField name="nombre" value="${nombre}"/>
          </div>
          <div class="fieldcontain required">
              <label for="apellido">Apellidos</label>
              <g:textField name="apellido" value="${apellido}"/>
          </div>
          <div class="fieldcontain required">
              <label for="email">Email</label>
              <g:textField name="email" value="${email}"/>
          </div>
          <div class="fieldcontain required">
              <label for="telefono">Telefono</label>
              <g:textField name="telefono" value="${telefono}"/>
          </div>


      </div>
      <div class="card-action">
        <button class="btn waves-effect waves-light large" type="submit" name="registrar">Sign in</button>
      </div>
    </g:form>
  </div>

</body>
</html>