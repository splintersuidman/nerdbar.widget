command: "osascript -e 'output volume of (get volume settings)'"

refreshFrequency: 500 # ms

render: (output) ->
  """
  <div class="volume"></div>
  """

update: (output) ->
  $(".volume").text "vol: #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #D0D0D0
  right: 320px
  top: 6px
  font-size: 10px
  font-family: 'Fira Mono'
"""
