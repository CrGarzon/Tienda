<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Bienvenidos al mundo de JSP y Servlet</h1>
	<h1>esto es una prueba 2</h1>
	<form action="./Clase_servlet" method="get">
		Teclee su nombre:&nbsp; <input type="text" name="nombre" size="20"
			maxlength="50" /> <br /> Teclee su clave:&nbsp; <input
			type="password" name="clave" size="10" maxlength="25" /> <br />
		Opine sobre mi p&aacute;gina: <br />
		<textarea name="opinion" id="opinion" cols="50" rows="5">
</textarea>
		<br /> <input type="submit" id="botonAceptar" name="botonAceptar"
			value="Aceptar" /> &nbsp;&nbsp; <input type="reset" id="botonBorrar"
			value="Borrar" />
	</form>
</body>
</html>