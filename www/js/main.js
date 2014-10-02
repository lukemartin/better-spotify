(function() {
  var app;

  app = angular.module('betterSpotify', ['ngRoute']);

  app.config([
    '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
      $locationProvider.html5Mode(true);
      return $routeProvider.when('/meow', {
        templateUrl: '/partials/meow.html'
      }).otherwise({
        templateUrl: '/partials/main.html'
      });
    }
  ]);

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm1haW4uY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FBQUEsTUFBQSxHQUFBOztBQUFBLEVBQUEsR0FBQSxHQUFNLE9BQU8sQ0FBQyxNQUFSLENBQWUsZUFBZixFQUFnQyxDQUFDLFNBQUQsQ0FBaEMsQ0FBTixDQUFBOztBQUFBLEVBRUEsR0FBRyxDQUFDLE1BQUosQ0FBVztJQUFDLGdCQUFELEVBQW1CLG1CQUFuQixFQUF3QyxTQUFDLGNBQUQsRUFBaUIsaUJBQWpCLEdBQUE7QUFDakQsTUFBQSxpQkFBaUIsQ0FBQyxTQUFsQixDQUE0QixJQUE1QixDQUFBLENBQUE7YUFDQSxjQUNFLENBQUMsSUFESCxDQUNRLE9BRFIsRUFFSTtBQUFBLFFBQUEsV0FBQSxFQUFhLHFCQUFiO09BRkosQ0FJRSxDQUFDLFNBSkgsQ0FLSTtBQUFBLFFBQUEsV0FBQSxFQUFhLHFCQUFiO09BTEosRUFGaUQ7SUFBQSxDQUF4QztHQUFYLENBRkEsQ0FBQTtBQUFBIiwiZmlsZSI6Im1haW4uanMiLCJzb3VyY2VSb290IjoiL3NvdXJjZS8iLCJzb3VyY2VzQ29udGVudCI6WyJhcHAgPSBhbmd1bGFyLm1vZHVsZSgnYmV0dGVyU3BvdGlmeScsIFsnbmdSb3V0ZSddKVxuXG5hcHAuY29uZmlnKFsnJHJvdXRlUHJvdmlkZXInLCAnJGxvY2F0aW9uUHJvdmlkZXInLCAoJHJvdXRlUHJvdmlkZXIsICRsb2NhdGlvblByb3ZpZGVyKSAtPlxuICAkbG9jYXRpb25Qcm92aWRlci5odG1sNU1vZGUodHJ1ZSlcbiAgJHJvdXRlUHJvdmlkZXJcbiAgICAud2hlbignL21lb3cnLFxuICAgICAgdGVtcGxhdGVVcmw6ICcvcGFydGlhbHMvbWVvdy5odG1sJ1xuICAgIClcbiAgICAub3RoZXJ3aXNlKFxuICAgICAgdGVtcGxhdGVVcmw6ICcvcGFydGlhbHMvbWFpbi5odG1sJ1xuICAgIClcbl0pXG5cbiJdfQ==