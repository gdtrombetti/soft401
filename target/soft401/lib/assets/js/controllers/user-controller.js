 var app = angular.module('MyApp', [])
    app.controller('UserController', function ($scope, $http) {
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
         console.log(dataObj);
    	var res = $http.post('AddUserServlet', dataObj);
			res.success(function(data, status, headers, config) {		
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	 }
        });

	