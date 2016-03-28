var card = angular.module("CardSetControllers", []);
card.controller('CardSetController', function ($scope, $http, $window) {
	$scope.AddSet = function(set) {
		console.log(set);
		if(!set.$valid) {
			return;
		}
		 var dataObj = {
					title : set.title,
					subject : set.subject,
					description : set.description,
					user_id : $scope.userId
				};
				var res = $http.post('AddCardSetServlet', dataObj);
					res.success(function(data, status, headers, config) {	
					console.log(status);
					console.log(data);
				});
				res.error(function(data, status, headers, config) {
					alert( "failure message: " + JSON.stringify({data: data}));
				});
		};
	$scope.getSets = function(user_id) {
		console.log(user_id);
		var res =
			$http({
			    url: 'GetCardSetServlet', 
			    method: "GET",
			    params: {user_id: user_id}
			 });
			
		res.success(function(data, status, headers, config) {	
			console.log(data);
			$scope.setList = data;
			
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
		
	};	
});