<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title></title>
<link href="<c:url value="/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />

<style>
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
}
</style>
</head>

<c:set var="lb_email">
	<fmt:message key="lb_email" />
</c:set>
<c:set var="lb_password">
	<fmt:message key="lb_password" />
</c:set>


<body>

	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${msg_type}" role="alert">${msg}</div>
		</c:if>
		<form:form action="create" modelAttribute="user" method="post" class="form-signin">

			<spring:bind path="name">
				<div class="form-group ">
					<label class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<form:input path="name" type="text" class="form-control" id="name" placeholder="Name" />
						<form:errors path="name" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="email">
				<div class="form-group ">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<form:input path="email" class="form-control" id="email" placeholder="Email" />
						<form:errors path="email" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<form:password path="password" class="form-control" id="password" placeholder="password" />
						<form:errors path="password" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn-lg btn-primary pull-right">Salvar</button>
				</div>
			</div>
		</form:form>

	</div>
	<!-- /container -->
</body>
</html>