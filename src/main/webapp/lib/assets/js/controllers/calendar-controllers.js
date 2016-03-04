var cal = angular.module('CalendarControllers', []);
cal.controller('CalendarController', function ($scope, $http) {
	$scope.addEvent = function(event) {
		console.log("Heyyyy");
	    console.log(event);
		var dataObj = {
			name : event.name,
			email : event.time,
			password : event.message,
		};
		var res = $http.post('AddEventServlet', dataObj);
			res.success(function(data, status, headers, config) {	
			console.log(status);
			console.log(data);
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	}
});