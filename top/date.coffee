command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  """
  <div class="date"></div>
  """

update: (output) ->
  $(".date").text output

style: """
  -webkit-font-smoothing: antialiased
  color: #B48EAD
  right: 50px
  top: 6px
  font-size: 10px
  font-family: 'Fira Mono'
"""
