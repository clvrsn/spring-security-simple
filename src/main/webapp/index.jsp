<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<sec:authorize access="authenticated" var="authenticated" />
	<c:choose>
		<c:when test="${authenticated}">
			<li id="greeting">
				<div>
					Bem-vindo
					<sec:authentication property="name" />
				</div>
			</li>
			<li><c:url var="logoutUrl" value="/logout" /> <form:form
					action="${logoutUrl}" method="post">
					<input type="submit" value="Log out" />
				</form:form>
		</c:when>
		<c:otherwise>
			<li><a id="navLoginLink" href="/login.jsp">Login</a></li>
		</c:otherwise>
	</c:choose>


	Bem vindo.

</body>
</html>