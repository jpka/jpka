define ["angular", "packery/js/packery", "draggabilly/draggabilly"], (angular, Packery, Draggabilly) ->
  appended = []
  angular.module("ngPackery", [])
    .directive "packeryItem", ($timeout) ->
      {
        restrict: "ACE"
        link:
          post: (scope, element, attrs) ->
            appended.push element[0]
            return unless scope.$last

            $timeout ->
              scope.packery.appended appended
              scope.packery.bindDraggabillyEvents(new Draggabilly el) for el in appended
              appended = []
      }
    .directive "packery", ->
      {
        restrict: "AE"
        link: 
          post: (scope, element, attrs) ->
            options = angular.extend scope.$eval(attrs.packeryOptions) or {},
              itemSelector: attrs.itemSelector or ".packery-item"

            scope.packery = new Packery element[0], options
            scope.draggable = attrs.draggable
      }