command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <div class="battery"></div>
  """

update: (output) ->
  $(".battery").text "bat: #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #EBCB8B
  top: 6px
  right: 125px
  font-size: 10px
  font-family: 'Fira Mono'
"""
