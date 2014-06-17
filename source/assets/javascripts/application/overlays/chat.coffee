socket = new WebSocket('ws://162.209.75.8:8000/')

socket.onmessage = (msg) ->
  console.log msg.data
  return
