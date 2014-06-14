# General adaptiveBackground execution.
# For coloring the backgrounds of any bumpers, etc.
$ ->
  $.adaptiveBackground.run
    parent: ".bumper-background"

  # Specific adaptiveBackground execution.
  $(".prologue-image").on "ab-color-found", (ev, payload) ->
    $(".prologue-message").css('border-top-color', payload.color)
