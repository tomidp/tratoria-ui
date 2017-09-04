<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<c:url value="resources/bootstrap337/css/bootstrap.min.css" />"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script
	src="<c:url value="resources/bootstrap337/js/tratoria_controller.js" />"></script>
</head>

<body ng-app="tratoriaApp" ng-controller="tratoriaCtrl">
	<div class="container">
		<c:url value="/resources/text.txt" var="url" />
		<spring:url value="/resources/text.txt" htmlEscape="true"
			var="springUrl" />
		<div class="row">
			<div class="col-md-12">Spring URL: ${springUrl} at ${time}></div>
		</div>
		<div class="row">
			<div class="col-md-3">JSTL URL: ${url}</div>
		</div>
		<div class="row">
			<div class="col-md-3">Message: ${message}</div>
		</div>
		<div class="row">
			<div class="col-md-3">Angular</div>
			<div class="col-md-3">{{firstName}}</div>
			<div class="col-md-3">{{lastName}}</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<input ng-click="getData()" type="submit" value="Submit">
			</div>
		</div>
	</div>
	<div class="container" >
		<div class="row" ng-repeat="information in informations">
			<div class="col-md-3">
				<div class="col-md-3">{{information.firstName}}</div>
				<div class="col-md-3">{{information.lastName}}</div>
			</div>
		</div>
	</div>
</body>

</html>
