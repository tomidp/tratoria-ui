var app = angular.module('tratoriaApp', []);
app.controller( 'tratoriaCtrl', function($scope, $http) {
	$scope.firstName = "Dwi";
	$scope.lastName = "Priyohutomo";
	
	$scope.changeName = function () {
		$scope.firstName = "Kalila";
		$scope.lastName = "Avani";		
	}
	
	$scope.getData = function () {
		$http.get("http://localhost:8080/api/tratoria/findAll").then(
					function(response) {
						$scope.informations = response.data;
					} 
				);
	}
});