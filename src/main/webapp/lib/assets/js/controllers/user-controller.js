var app = angular.module('MyApp', []);
app.controller('UserController', function ($scope, $http, $window, $location) {
$scope.AddUser = function(user) {
	if(!user.$valid) {
		return;
	}
	console.log("controller");

    var dataObj = {
		name : user.name,
		email : user.email,
		password : user.password,
		affiliation : user.affiliation,
		favorite_subject : user.favorite_subject,
		type : $scope.type
	};
	var res = $http.post('AddUserServlet', dataObj);
		res.success(function(data, status, headers, config) {	
		console.log(status);
		console.log(data);
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});
 }
$scope.SignIn = function(user, $window) {
	$scope.signInStatus = "";
	$scope.signInMessage = "";
	if(!user.$valid) {
		return;
	}
	var user = {
		email : user.email,
		password : user.password,
	};
	var res = $http.post('SignInUserServlet', user);
		res.success(function(data, status, headers, config) {
			$scope.data = data;
			console.log($scope.data);
			
			$scope.signInStatus = status;
			if ( $scope.data == "false") {
				$scope.signInMessage = "Invalid Credentials";
			} else if ($scope.data == "basic") {
				window.location = "portal-basic.jsp";
			} else if ($scope.data == "admin") {
				window.location = "portal-admin.jsp";
			}
			 
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});
}
});


	