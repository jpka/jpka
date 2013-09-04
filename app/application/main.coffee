require.config
  baseUrl: "../bower_components"
  paths:
    app: "../application"
    views: "../views"
    components: "../components"
    angular: ["//ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min", "angular/angular.min"]
    propertyParser: "requirejs-plugins/src/propertyParser"
    font: "requirejs-plugins/src/font"
    jquery: ["//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min", "jquery/jquery.min"]
    isotope: ["//cdnjs.cloudflare.com/ajax/libs/jquery.isotope/1.5.25/jquery.isotope.min", "isotope/jquery.isotope.min"]
  shim:
    angular:
      deps: ["jquery"]
      exports: "angular"
    isotope:
      deps: ["jquery"]


require ["angular", "app/app"], (angular, app) ->
  angular.bootstrap document.body, ["jpka"]
