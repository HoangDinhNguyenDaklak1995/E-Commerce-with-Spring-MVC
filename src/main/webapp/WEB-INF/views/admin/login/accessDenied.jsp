<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<title>Access Denied</title>
</head>
<body>
	<h3>Hello ${pageContext.request.userPrincipal.name }</h3>

	<h3>Access denied to admin page</h3>
	${msg }
	<br>
	<a href="${pageContext.request.contextPath}/admin-panel">Back</a>
</body>
</html>