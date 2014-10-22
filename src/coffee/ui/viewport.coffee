class Viewport
  constructor: ($elem) ->
    @elem = $elem
    @binders()

  binders: ->
    $(window).resize => @setup()
    $(window).trigger 'resize'

  setup: ->
    @elem.css
      marginTop: $('.main-header').outerHeight()
      marginBottom: $('.main-footer').outerHeight()

$('.js-viewport').each -> new Viewport($(this))