 var app = angular.module('MyApp', [])
app.controller('UserController', function ($scope, $http, $window, $location) {
$scope.AddUser = function(user) {
	if(!user.$valid) {
		return;
	}
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
			if( $scope.data == "false" ) {
				$scope.signInStatus = status;
				$scope.signInMessage = "Invalid Credentials";
			} else {
			console.log(data.type);
			
			if(data.type == 1) {
				$scope.users_full_name = data.full_name;
				window.location = "/soft401/portal-basic.jsp";
				}
			if (data.type == 2 ) {
				$location.path('/portal-admin.jsp');
			}
		}
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});
 }
});

	