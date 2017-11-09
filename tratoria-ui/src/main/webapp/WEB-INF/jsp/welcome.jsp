<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="<c:url value="resources/bootstrap337/css/bootstrap.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js"></script>


<%--	<script src="<c:url value="resources/bootstrap337/js/bootstrap.min.js" />"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
</head>

<body ng-app="tratoriaApp" ng-controller="tratoriaCtrl">
	<div class="container" style="margin-top:15px">

	  	<div class="jumbotron">
	    	<h1>Lorem Ipsum</h1>
	    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vitae tortor sit amet nisl blandit rhoncus. Donec et leo a justo blandit pretium.</p>
	  	</div>

		<div class="row">
			<div class="col-md-3">
				<button type="button" class="btn btn-primary" ng-click="getData()">Get All Data</button>
				<a type="button" class="btn btn-primary" ng-click="insert()">Insert</a>
			</div>
		</div>

		<script type="text/ng-template" id="createUserModal">
			 <div class="modal-header">
			   <button type="button" class="close" data-dismiss="modal">&times;</button>
			   <h4 class="modal-title">Modal Header</h4>
			 </div>
			 <div class="modal-body">
			   <p>Some text in the modal.</p>
				 <div class="form-group">
					 <label for="firstName">First Name:</label>
					 <input type="text" class="form-control" id="firstName" ng-model="firstName">
				 </div>
				 <div class="form-group">
					 <label for="lastName">Last Name:</label>
					 <input type="text" class="form-control" id="lastName" ng-model="lastName">
				 </div>
			 </div>
			 <div class="modal-footer">
				 <button type="button" class="btn btn-primary" ng-click="submit()">Create New User</button>
				 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			 </div>
		</script>

		<table class="table table-striped">
		   <thead>
		     <tr>
		       <th>Firstname</th>
		       <th>Lastname</th>
		       <th>Email</th>
		     </tr>
		   </thead>
		   <tbody>
		     <tr ng-repeat="information in informations">
		       <td>{{information.firstName}}</td>
		       <td>{{information.lastName}}</td>
		       <td>...</td>
		     </tr>		    
		   </tbody>
		 </table>
	</div>

	<script src="<c:url value="resources/bootstrap337/js/tratoria_controller.js" />"></script>
</body>

</html>
