var cal = angular.module('CalendarControllers', []);
cal.controller('CalendarController', function ($scope, $http, $window) {
	$scope.day = "";
	$scope.month = "";
	$scope.year = "";
	$scope.event_name = "";
	$scope.event_time = "";
	$scope.event_destcription = "";
	$scope.addEvent = function(event) {
		$scope.event_name = event.name;
		$scope.event_time = event.time;
		$scope.event_description = event.message
		$scope.sendEventData($scope.event_name, $scope.event_time, $scope.event_description );
	}
	$scope.getDateData = function(day, month, year) {
		$scope.day = day;
		$scope.setDay(day);
		$scope.setMonth(month);
		$scope.setYear(year);
	}
	$scope.setDay = function (day) {
		$scope.day = day;
	}
	$scope.setMonth = function(month) {
		$scope.month = month;
	}
	$scope.setYear = function (year) {
		$scope.year = year;
	}
	$scope.getDay = function (){
		return $scope.day;	
	}
	$scope.getMonth = function (){
		return $scope.month;	
	}
	$scope.getYear = function (){
		return $scope.year;	
	}
	
	$scope.sendEventData = function (event_name, event_time, event_description) {
		var eventObj = {
			event_name : event_name,
			event_time : event_time,
			event_description : event_description,
			event_day : $scope.getDay(),
			event_month : $scope.getMonth(),
			event_year : $scope.getYear(),
			user_id : $scope.userId
		}
		var res = $http.post('AddEventServlet', eventObj);
		res.success(function(data, status, headers, config) {	
			console.log(status);
			console.log(data);
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	}
	$scope.getEvents = function (user_id) {
		$scope.user_id = user_id;
		var userObj = {
			user_id : $scope.user_id
		}
		var res =
			$http({
			    url: 'GetEventServlet', 
			    method: "GET",
			    params: {user_id: user_id}
			 });
			
		res.success(function(data, status, headers, config) {	
			$scope.eventList = data;
			
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	}
});