var card = angular.module("CardSetControllers", []);
card.controller('CardSetController', function ($scope, $http, $window, $location) {
	$scope.AddSet = function(set) {
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
		var res =
			$http({
			    url: 'GetCardSetServlet', 
			    method: "GET",
			    params: {user_id: user_id}
			 });
			
		res.success(function(data, status, headers, config) {	
			$scope.sets = data;	

		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
		
	};

$scope.directToFlashCard = function(title, subject) {
	window.location = "add-flash-cards.jsp?set=" + title +"&subject=" + subject;
};

$scope.addFlashCard = function() {
	$scope.title = getURLParameter('set');
	$scope.subject = getURLParameter('subject');
	$scope.flash_card_status = "";
	var dataObj = {	
		subject : $scope.subject,
		title : $scope.title,
		front : $scope.front,
		back : $scope.back,
		user_id : $scope.userId
	};
			var res = $http.post('AddFlashCardServlet', dataObj);
				res.success(function(data, status, headers, config) {	
				$scope.flash_card_status = data;
				$scope.front = "";
				$scope.back = "";	
			});
			res.error(function(data, status, headers, config) {
				alert( "failure message: " + JSON.stringify({data: data}));
			});
	};
	$scope.getFlashCards = function() {
		$scope.title = getURLParameter('set');		
		console.log($scope.userId);
		var dataObj = {	
			user_id : $scope.userId,
			title : $scope.title		
		};
		var res = $http.post('GetFlashCardServlet', dataObj);
		res.success(function(data, status, headers, config) {	
			$scope.flash_cards = data;
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	};
	$scope.getFlashCardCount = function(user_id, title) {
		var dataObj = {	
			user_id : user_id,
			title : title		
		};
		var res = $http.post('GetFlashCardCount', dataObj);
		res.success(function(data, status, headers, config) {	
			return $scope.count = data;
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
		});
	}
});