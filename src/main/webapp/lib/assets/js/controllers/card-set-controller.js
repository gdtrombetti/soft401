var card = angular.module("CardSetControllers", []);
card.controller('CardSetController', function ($scope, $http, $window, $location) {
	$scope.modes = 'frontfirst';
	$scope.AddSet = function() {
		 var dataObj = {
				title : $scope.title,
				subject : $scope.subject,
				description : $scope.description,
				user_id : $scope.userId
			};
		var res = $http.post('AddCardSetServlet', dataObj);
		res.success(function(data, status, headers, config) {			
			$scope.title = "";
			$scope.description = "";
			$scope.subject = "";
					
		});
		res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
			});
		};
		
	$scope.getSets = function(user_id) {
		$scope.count = 0;
		var res =
			$http({
			    url: 'GetCardSetServlet', 
			    method: "GET",
			    params: {user_id: user_id}
			 });
			
		res.success(function(data, status, headers, config) {				
			$scope.title ="";
			for (var key in data) {
				   var obj = data[key];
				   for (var prop in obj) {
				     if (prop == "title"){
					   $scope.title = obj[prop];
					   $scope.count = getFlashCardCount(user_id, $scope.title);
					   obj["count"] = $scope.count;
				     }
				   }
				}
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
	$scope.removeFlashCardSet = function(title, user_id) {
		var dataObj = {	
			user_id : user_id,
			title : title		
		};
		var r = confirm("Do you really want to remove this set?");
		if (r == true) {
			var res = $http.post('RemoveFlashCardSetServlet', dataObj);
			res.success(function(data, status, headers, config) {			
				console.log(data);
			});
			res.error(function(data, status, headers, config) {
			alert( "failure message: " + JSON.stringify({data: data}));
			});
		} else {
		    txt = "Canceled";
		}
		
	};
	
	$scope.getFlashCards = function() {
		$scope.flash_length = 0;	
		$scope.curPage = 0;
		$scope.pageSize = 1;
		$scope.title = getURLParameter('set');
			var dataObj = {	
				user_id : $scope.userId,
				title : $scope.title		
			};
			var res = $http.post('GetFlashCardServlet', dataObj);
			res.success(function(data, status, headers, config) {	
				
				$scope.flash_cards = data;
				
				$scope.flash_length = $scope.flash_cards.length;
			});
			res.error(function(data, status, headers, config) {
				alert( "failure message: " + JSON.stringify({data: data}));
			});
		};
		$scope.getRandomCards = function() {
			$scope.flash_length = 0;	
			$scope.curPage = 0;
			$scope.pageSize = 1;
			$scope.title = getURLParameter('set');
				var dataObj = {	
					user_id : $scope.userId,
					title : $scope.title		
				};
				var res = $http.post('GetFlashCardServlet', dataObj);
				res.success(function(data, status, headers, config) {	
	
					$scope.random_flash_cards = data;
					for (i = $scope.random_flash_cards.length; i; i -= 1) {
				        j = Math.floor(Math.random() * i);
				        x = $scope.random_flash_cards[i - 1];
				        $scope.random_flash_cards[i - 1] = $scope.random_flash_cards[j];
				        $scope.random_flash_cards[j] = x;
				    }
				});
				res.error(function(data, status, headers, config) {
					alert( "failure message: " + JSON.stringify({data: data}));
				});
			};
	$scope.directToStudyCard = function(title, subject) {
			window.location = "studyCard.jsp?set=" + title;
		};

});

angular.module('CardSetControllers').filter('pagination', function(){
	return function(input, start) {
		  start = +start;
		  return input.slice(start);
	};
});
		 