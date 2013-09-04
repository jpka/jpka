#global define
define ["angular", "app/utils", "views/portfolio"], (angular) ->
  app = angular.module("jpka", ["utils", "portfolio"])
    
  app.config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "views/portfolio.html"
        controller: "portfolioCtrl"
      .otherwise
        redirectTo: "/"
  ]

  app