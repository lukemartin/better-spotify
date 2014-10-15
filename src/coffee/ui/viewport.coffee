class Viewport
  constructor: ($elem) ->
    @elem = $elem
    @binders()

  binders: ->
    $(window).resize =>
      @setup()
    $(window).trigger 'resize'

  setup: ->
    height = $(window).outerHeight() - $('.main-header').outerHeight() - $('.main-footer').outerHeight()
    @elem.css
      height: height

$('.js-viewport').each -> new Viewport($(this))