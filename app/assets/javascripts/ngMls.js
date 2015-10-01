angular.module('ngMls', ['ngAnimate'])
.controller('ngPitiCtrl', ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {

  $scope.fetch_default = function() {
    $http({ method: 'GET', url: '/pitis/default.json' }).
    then(function(response) {
      $scope.default = response.data.default;
      $scope.tax = response.data.tax;
      $scope.interest = response.data.interest;
      $scope.maturity = response.data.maturity;
      $scope.insurance = response.data.insurance;
    }, function(response) {
      // Request failed
    });
  };

  $scope.fetch_listing = function() {
    $scope.pitis = {};
    $http({ method: 'GET', url: '/pitis.json' }).
    then(function(response) {
      // $scope.pitis = response.data;

      angular.forEach(response.data, function(entry) {
        if(!$scope.pitis[entry.listing_id]) {
          $scope.pitis[entry.listing_id] = [];
        }

        $scope.pitis[entry.listing_id].push(entry);
      })
    }, function(response) {
      // Request failed
    });
  };

  $scope.calculatedPayment = function(entry) {
    P = entry.price - entry.down;
    i = (entry.interest || $scope.interest) / 12 / 100;
    n = (entry.maturity || $scope.maturity);

    M = P * ( i * Math.pow(1 + i, n) ) / (Math.pow(1+i, n) - 1);
    tax = entry.price * (entry.tax || $scope.tax) / 100 / 12;
    ins = (entry.insurance || $scope.tax) / 12;
    return M + tax + ins;
  };

  $scope.update = function(piti) {
    var req;
    if(piti.id) {
      req = $http({ method: 'PUT', url: '/pitis/'+piti.id+'.json', data: {'piti': piti} });
    } else {
      console.log("doing post");
      req = $http({ method: 'POST', url: '/pitis.json', data: {'piti': piti} });
    }

    req.then(function(response) {
      // Simulate 2 seconds loading delay
      piti.saved = true;
      $timeout(function() {

        // Loadind done here - Show message for 3 more seconds.
        $timeout(function() {
          piti.saved = false;
        }, 3000);

      }, 2000);
    }, function(response) {
      // Request failed
    });
  };

  $scope.addPiti = function(id) {
    if(!$scope.pitis[id]) {
      $scope.pitis[id] = [];
    }

    var piti = angular.copy($scope.default)
    piti.listing_id = id;
    $scope.pitis[id].push(piti);
  };

  $scope.fetch_default();
  $scope.fetch_listing();
}]);
