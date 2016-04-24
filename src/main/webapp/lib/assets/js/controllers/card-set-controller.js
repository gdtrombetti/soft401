var card = angular.module("MyApp", []).
	controller('CardSetController', function ($scope, $http, $window, $location) {
	$scope.modes = 'frontfirst';
	$scope.q_links = [];
	$scope.no_q_links = "";
	$scope.flash_cards = {};
	$scope.userChoice = {};
	$scope.potential_answers = [];
	$scope.correct_answers = 0;
	
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
$scope.directToQuiz = function (title, id) {
	$scope.card_set_id = id;
	window.location = "quizPage.jsp?set=" + title + "&id=" + id;
}
$scope.directToShare = function(title, card_set_id, user_id){
	window.location = "sharePage.jsp?set=" + title + "&id=" + card_set_id + "&user=" +user_id;
}
$scope.shareCardSet = function() {
	
	$scope.title = getURLParameter('set');
	$scope.card_set_id = getURLParameter('id');
	$scope.user_id = getURLParameter('user');
	dataObj = {
			title:$scope.title,
			card_set_id: $scope.card_set_id,
			user_id:$scope.user_id,
			email:$scope.search_email
	}
	var res = $http.post('ShareFlashCardServlet', dataObj);
	res.success(function(data, status, headers, config) {	
		$scope.flash_card_status = data;
		$scope.front = "";
		$scope.back = "";	
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});
	
}
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
			console.log(data);
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
	
	$scope.getQuizFlashCards = function() {
		$scope.flash_length = 0;	
		$scope.curPage = 0;
		$scope.pageSize = 1;
		$scope.title = getURLParameter('set');
		//console.log($scope.current);
		var dataObj = {	
				user_id : $scope.userId,
				title : $scope.title		
			};
			var res = $http.post('GetFlashCardServlet', dataObj);
			res.success(function(data, status, headers, config) {					
				$scope.flash_cards = data;
				
				$scope.potential_answers_pool = data;
				$scope.flash_length = $scope.flash_cards.length;	
				$scope.getFlashCardPotentialAnswers($scope.potential_answers_pool, 0);
			});
			res.error(function(data, status, headers, config) {
				alert( "failure message: " + JSON.stringify({data: data}));
			});
		};
		
		$scope.getFlashCardPotentialAnswers = function(potential, index) {
			$scope.potential_answers_pool = potential;
			$scope.potential_answers.length = 0;
			for (i = $scope.potential_answers_pool.length; i; i -= 1) {
				//$scope.potential_answers.correct = $scope.potential_answers_pool[i];
				j = Math.floor(Math.random() * i);
				x = $scope.potential_answers_pool[i - 1];
				$scope.potential_answers_pool[i - 1] = $scope.potential_answers_pool[j];
				$scope.potential_answers_pool[j] = x;	
			}
			for (x = 0; x < 4; x++ ) {
				if ($scope.potential_answers_pool[x].back != $scope.flash_cards[index].back) {
					$scope.potential_answers.push($scope.potential_answers_pool[x].back);
				}
				
			}
			if ($scope.potential_answers.length > 3 ) {
				$scope.potential_answers.pop();
			}
			$scope.potential_answers.push($scope.flash_cards[index].back);
			
			for (i = $scope.potential_answers.length; i; i -= 1) {
				j = Math.floor(Math.random() * i);
				x = $scope.potential_answers[i - 1];
				$scope.potential_answers[i - 1] = $scope.potential_answers[j];
				$scope.potential_answers[j] = x;	
			}
			console.log($scope.correct_answers);
		};
		
		$scope.correctAnswers = function() {
			$scope.correct_answers = $scope.correct_answers + 1;
		}
		$scope.resultPageRedirect = function(user_id) {
			$scope.title = getURLParameter('set');
			window.location = "quizResults.jsp?set=" + $scope.title +"&user=" + user_id + "&c=" + $scope.correct_answers + "&t=" + $scope.flash_cards.length
		}
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
$scope.addToQuicklink = function(user_id, title) {

	$scope.set = getURLParameter('set');
	$scope.link = getUrl();
	$scope.title = title + "-" + $scope.set;
	var dataObj = {	
			user_id : user_id,
			link : $scope.link,
			title : $scope.title
		};
	var res = $http.post("AddQuickLinkServlet", dataObj);
	res.success(function(data, status, headers, config) {	
		$scope.q_link_status = data;
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});	
};

$scope.getQuickLinks = function(user_id) {
	var dataObj = {	
		user_id : user_id,
	};
	var res = $http.post("GetQuickLinkServlet", dataObj);
	res.success(function(data, status, headers, config) {	
		$scope.q_links = data;
		$scope.link_length = $scope.q_links.length
		if ($scope.link_length == 0) {
			$scope.no_q_links = "No Quick Links";
		}
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});	
};

$scope.getQuizResults = function() {
	$scope.correct = getURLParameter('c');
	$scope.total = getURLParameter('t');
	$scope.percent_correct = ($scope.correct/$scope.total) * 100;
	
}

$scope.removeQuickLink = function (index, user_id, link) {
	var dataObj = {	
			user_id : user_id,
			link : link,
		};
	var res = $http.post("RemoveQuickLinkServlet", dataObj);
	res.success(function(data, status, headers, config) {	
		$scope.remove_link_status = data;
		console.log($scope.remove_link_status);
		if ($scope.remove_link_status == "Success") {
			$scope.q_links.splice(index, 1);
			
		}
	});
	res.error(function(data, status, headers, config) {
		alert( "failure message: " + JSON.stringify({data: data}));
	});	

	}
});


angular.module('MyApp').filter('pagination', function(){
	return function(input, start) {
		  start =+ start;
		  return input.slice(start);
	};
});
		 