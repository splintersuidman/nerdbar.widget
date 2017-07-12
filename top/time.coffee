command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <div class="time"></div>
  """

update: (output) ->
  $(".time").text(output)

style: """
  -webkit-font-smoothing: antialiased
  color: #81A1C1
  right: 10px
  top: 6px
  font-size: 10px
  font-family: 'Fira Mono'
"""
