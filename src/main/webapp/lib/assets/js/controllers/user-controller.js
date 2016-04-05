angular.module('MyApp', []).
	controller('UserController', function ($scope, $http, $window, $location) {
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
$scope.editUser = function() {
	console.log("HEY");
	var edit_information = {};
	if (typeof $scope.name != 'undefined') {
		 edit_information.name = $scope.name;
	}
	if (typeof $scope.email != 'undefined') {
		 edit_information.email = $scope.email;
	}
	if (typeof $scope.password != 'undefined') {
		 edit_information.password = $scope.email;
	}
	if (typeof $scope.affiliaton != 'undefined') {
		 edit_information.affiliation = $scope.affiliation;
	}
	if (typeof $scope.email != 'undefined') {
		 edit_information.favorite_subject = $scope.favorite_subject;
	}
	if (typeof $scope.type != 'undefined') {
		 edit_information.type = $scope.type;
	}
	console.log(edit_information + "YOOO");
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


	