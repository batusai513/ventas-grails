<html>
<head>
    <title>Entra a Ventas</title>
    <meta name="layout" content="main">
</head>
<body>

  <div class="card login-card">
    <g:form uri="/j_spring_security_check" method="POST">
      <div class="card-content">
        <h1 class="card-title black-text">Sign in</h1>
        <hr class="divider"></hr>

          <div class="fieldcontain required">
              <label for="j_username">Username</label>
              <g:textField name="j_username" value="${username}"/>
          </div>
          <div class="fieldcontain required">
              <label for="j_password">Contrasena</label>
              <g:passwordField name="j_password"/>
          </div>
          <div class="fieldcontain required">
              <g:checkBox name="_spring_security_remember_me"/>
              <label for="_spring_security_remember_me">Remember me</label>
          </div>

      </div>
      <div class="card-action">
        <button class="btn waves-effect waves-light large" type="submit" name="signIn">Sign in</button>
      </div>
    </g:form>
  </div>

</body>
</html>