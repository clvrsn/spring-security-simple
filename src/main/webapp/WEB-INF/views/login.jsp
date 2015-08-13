<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title></title>
<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/css/style.css" />" rel="stylesheet"
	type="text/css" />

</head>
<c:set var="lb_email">
	<fmt:message key="lb_email" />
</c:set>
<c:set var="lb_password">
	<fmt:message key="lb_password" />
</c:set>
<c:set var="email_login_invalid">
	<fmt:message key="lb_password" />
</c:set>

<c:set var="action">
	<c:url value='/cmd/login.do' />
</c:set>


<body>
	
	<div class="container">

		<c:if test="${not empty msg}">
			<div class="alert alert-${msg_type}" role="alert">${msg}</div>
		</c:if>
		<c:if test="${not empty param.error}">
			<div class="alert alert-warning" role="alert">
				<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			</div>
		</c:if>

		<form:form id="form" action="${action}" method="POST">

			Username:<br>
			<input type="text" name="username" value="" />
			<br>
			<br> Password:<br>
			<input type="password" name="password" value="" />
			<input value="Login" name="submit" type="submit" />
		</form:form>



	</div>
	<!-- /container -->
</body>
</html>