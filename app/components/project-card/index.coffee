define ["angular"], (angular) ->
  angular.module("project-card", [])
    .directive "projectCard", ->
      {
        restrict: "AEC"
        templateUrl: "components/project-card/template.html"
        link:
          pre: (scope, element) ->
            if scope.project.owner
              scope.project.type = "repository" 
              scope.project.link = scope.project.html_url
      }
