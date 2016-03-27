var card = angular.module("CardSetControllers", []);
card.controller('CardSetController', function ($scope, $http, $window) {
	$scope.AddSet = function(user) {
		console.log(user);
		if(!user.$valid) {
			return;
		}
		console.log('her');
	};
});