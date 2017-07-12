command: "ifconfig | sed -En 's/127.0.0.1//;s/.*inet" +
         " (addr:)?(([0-9]*\\.){3}[0-9]*).*/\\2/p'"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="local-ip"></div>
  """

update: (output) ->
  if output
    $(".local-ip").text output
  else
    $(".local-ip").text "not connected"


style: """
  -webkit-font-smoothing: antialiased
  text-align: right
  color: #81A1C1
  height: 16px
  right: 10px
  bottom: 2px
  font-size: 10px
  font-family: 'Fira Mono'
"""
