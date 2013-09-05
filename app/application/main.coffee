require.config
  baseUrl: "../bower_components"
  paths:
    app: "../application"
    views: "../views"
    components: "../components"
    angular: ["//ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min", "angular/angular.min"]
    propertyParser: "requirejs-plugins/src/propertyParser"
    font: "requirejs-plugins/src/font"
    json: "requirejs-plugins/src/json"
    text: "requirejs-text/text"
    jquery: ["//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min", "jquery/jquery.min"]
    isotope: ["//cdnjs.cloudflare.com/ajax/libs/jquery.isotope/1.5.25/jquery.isotope.min", "isotope/jquery.isotope.min"]
    templates: "../templates"
    data: "../data.json"
  shim:
    angular:
      deps: ["jquery"]
      exports: "angular"
    isotope:
      deps: ["jquery"]

require ["angular", "app/app", "templates"], (angular, app, templates) ->
  app.run templates
  angular.bootstrap document.body, [app.name]
