var app = angular.module('tratoriaApp', ['ui.bootstrap']);
app.controller( 'tratoriaCtrl', function($scope, $modal, $http) {

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

	$scope.insert = function () {
		var modal = $modal.open({
			templateUrl : "createUserModal",
			controller : "createUserController"
		});
	}

});

app.controller("createUserController", function ($scope, $modalInstance, $http) {
    $scope.firstName = "";
    $scope.lastName = "";

	$scope.cancel = function () {
        $modalInstance.close();
    }

    $scope.submit = function () {
        var customerRequest = {};
        customerRequest.firstName = $scope.firstName;
        customerRequest.lastName = $scope.lastName;

        $http.post("/submit", customerRequest).then(
            function(data, status) {
            	$modalInstance.close();
            }
        );
    }
});