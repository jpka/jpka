define ["angular"], (angular) ->
  angular.module("utils", [])
    .directive "ngIf", ->
      {
        link: (scope, element, attrs) ->
          element.replaceWith(if scope.$eval(attrs.ngIf) then element.contents() else " ")
      }
    .directive "ngIfSwitch", ->
      {
        link: (scope, element, attrs) ->
          element.replaceWith element.find("[ng-if-#{if scope.$eval(attrs.ngIfSwitch) then 'true' else 'false'}]")
      }
    .directive "ngWrapIf", ->
      {
        link: (scope, element, attrs) ->
          element.replaceWith element.contents() unless scope.$eval(attrs.ngWrapIf)
      }

