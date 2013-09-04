define ["angular", "isotope"], (angular) ->
  $.Isotope::_getMasonryGutterColumns = ->
    gutter = @options.masonry.gutterWidth or 0
    containerWidth = @element.parent().width()
    @masonry.columnWidth = @options and @options.masonry.columnWidth or @$filteredAtoms.outerWidth(true) or containerWidth
    @masonry.columnWidth += gutter
    @masonry.cols = Math.floor(containerWidth / @masonry.columnWidth)
    @masonry.cols = Math.max(@masonry.cols, 1)

  $.Isotope::_masonryReset = ->
    @masonry = {}
    @_getMasonryGutterColumns()
    i = @masonry.cols
    @masonry.colYs = []
    @masonry.colYs.push 0  while i--

  $.Isotope::_masonryResizeChanged = ->
    prevColCount = @masonry.cols
    @_getMasonryGutterColumns()
    @masonry.cols isnt prevColCount

  $.Isotope::_masonryGetContainerSize = ->
    gutter = @options.masonry.gutterWidth or 0
    unusedCols = 0
    i = @masonry.cols
    while --i
      break  if @masonry.colYs[i] isnt 0
      unusedCols++
    height: Math.max.apply(Math, @masonry.colYs)
    width: ((@masonry.cols - unusedCols) * @masonry.columnWidth) - gutter

  appended = $()
  zIndex = 9

  angular.module("ngIsotope", [])
    .directive("isotopeItem", ["$timeout", ($timeout) ->
      {
        restrict: "ACE"
        link:
          post: (scope, element, attrs) ->
            appended = appended.add element
            return unless scope.$last

            $timeout ->
              appended.css "z-index", zIndex
              scope.isotope.isotope "appended", appended
              appended = $()
              zIndex--
      }
    ])
    .directive "isotope", ->
      {
        restrict: "AE"
        link: 
          post: (scope, element, attrs) ->
            options = angular.extend scope.$eval(attrs.isotopeOptions) or {},
              itemSelector: attrs.itemSelector or ".isotope-item"

            options.masonry.columnWidth = Math.min $(window).width(), 460
            element.isotope options
            scope.isotope = element
      }