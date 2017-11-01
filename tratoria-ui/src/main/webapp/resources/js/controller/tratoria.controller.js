var app = angular.module('tratoriaApp', []);

app.controller( 'tratoriaCtrl', function($scope, $http) {
	$scope.firstName = "Dwi";
	$scope.lastName = "Priyohutomo";
	
	$scope.changeName = function () {
		$scope.firstName = "Kalila";
		$scope.lastName = "Avani";		
	}
	
	$scope.getData = function () {
		$http.get("/findAll").then(
					function(response) {
						$scope.informations = response.data;
					} 
				);
	}
});