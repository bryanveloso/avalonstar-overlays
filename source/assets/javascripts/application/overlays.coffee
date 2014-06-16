$ ->
  # General adaptiveBackground execution.
  # For coloring the backgrounds of any bumpers, etc.
  $.adaptiveBackground.run
    parent: ".bumper-background"

  # Specific adaptiveBackground execution.
  $(".prologue-image").on "ab-color-found", (ev, payload) ->
    $(".prologue-message").css('border-top-color', payload.color)
    $(".todays-episode").css('color', payload.color)


# Follower notification.
follower_notification = ->
  # Set our timestamp to $.now() unless we have a variable from
  # the brower's localStorage.
  key = "followerLastCheck"
  timestamp = $.now() unless JSON.parse(localStorage.getItem(key))

  url = "https://api.twitch.tv/kraken/channels/avalonstar/follows/?callback=?"
  $.getJSON url, (response) ->
    # `new_follows` will contain all of the users that have
    # followed since the initial execution of the script.
    new_follows = $.grep(response.follows, (follower) ->
      # Convert the ISO-ish date to epoch so we can compare it.
      followed_at = new Date(follower.created_at).getTime()
      followed_at < timestamp )

    # Store the new time in localStorage.
    localStorage.setItem(key, $.now())

# Poll the Twitch API to check for followers every 5 seconds.
# setInterval ->
$ ->
  follower_notification()
# , 5000
