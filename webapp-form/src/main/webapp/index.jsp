<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
List<String> errores = (List<String>)request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
<h3>Formulario de usuarios</h3>
<%if(errores!=null && errores.size()>0){%>
<ul class="alert alert-danger mx-5">
<%for(String error:errores){%>
<li><%=error%></li>
<%}%>
</ul>

<%}%>
<div class="px-5">
<form action="/webapp-form/registro" method="post">
    <div class="row mb-3">
        <label for="Username" class="col-form-label col-sm-2">Usuario</label>
        <div class="col-sm-4">
            <input type="text" name="username" id="username" class="form-control" value="${param.username}">
        </div>
    </div>
    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Password</label>
        <div class="col-sm-4">
            <input type="password" name="password" id="password" class="form-control" value="${param.password}">
        </div>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Email</label>
        <div class="col-sm-4">
            <input type="text" name="email" id="email" class="form-control" value="${param.email}">
        </div>
    </div>
    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">Pais</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
                <option value="">-- seleccionar --</option>
                <option value="ES" ${param.pais.equals("ES")? "selected": ""}>España</option>
                <option value="MX" ${param.pais.equals("MX")? "selected": ""}>Mexico</option>
                <option value="CL" ${param.pais.equals("CL")? "selected": ""}>Chile</option>
                <option value="AR" ${param.pais.equals("AR")? "selected": ""}>Argentina</option>
                <option value="PE" ${param.pais.equals("PE")? "selected": ""}>Peru</option>
                <option value="CO" ${param.pais.equals("CO")? "selected": ""}>Colombia</option>
                <option value="VE" ${param.pais.equals("VE")? "selected": ""}>Venezuela</option>
            </select>
        </div>
    </div>
    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de programación</label>
        <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"selected":""}>Java</option>
                <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("jakartaee")).get()?"selected":""}>Jakarta EE9</option>
                <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"selected":""}>Spring Boot</option>
                <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"selected":""}>JavaScript</option>
                <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("angular")).get()?"selected":""}>Angular</option>
                <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"selected":""}>React</option>
            </select>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Roles</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_ADMIN" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE-ADMIN")).get()?"checked":""} class="form-check-input">
            <label class="form-check-label">Administrador</label>
        </div>
        <div class="form-check col-sm-2"">
            <input type="checkbox" name="roles" value="ROLE_USER" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""} class="form-check-input">
            <label class="form-check-label">Usuario</label>
        </div>
        <div class="form-check col-sm-2"">
            <input type="checkbox" name="roles" value="ROLE_MODERATOR" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE-MODERATOR")).get()?"checked":""} class="form-check-input">
            <label class="form-check-label">Moderador</label>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Idioma</label>
        <div class="form-check col-sm-2"">
            <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")? "checked": ""}>
            <label class="form-check-label">Español</label>
        </div>
        <div class="form-check col-sm-2"">
            <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")? "checked": ""}>
            <label class="form-check-label">Ingles</label>
        </div>
        <div class="form-check col-sm-2"">
            <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")? "checked": ""}>
            <label class="form-check-label">Frances</label>
        </div>
        <div class="form-check col-sm-2"">
            <input type="radio" name="idioma" value="ch" class="form-check-input" ${param.idioma.equals("ch")? "checked": ""}>
            <label class="form-check-label">Chino</label>
        </div>
    </div>
    <div class="row mb-3">
        <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
        <div class="form-check col-sm-2"">
            <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
        </div>
    </div>
    <div class="row mb-3">
        <div>
            <input type="submit" value="Enviar" class="btn btn-primary">
        </div>
    </div>
    <input type="hidden" name="secreto" value="12345">
</form>
</div>

</body>
</html>