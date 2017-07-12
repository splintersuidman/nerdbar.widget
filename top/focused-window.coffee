command: "echo $(/usr/local/bin/kwmc query space active tag)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="focused-window"></div>
  """

update: (output) ->
  $(".focused-window").text output

style: """
  -webkit-font-smoothing: antialiased
  color: #D0D0D0
  height: 16px
  left: 10px
  overflow: hidden
  text-overflow: ellipsis
  whitespace: nowrap
  top: 6px
  width: auto
  max-width: 400px
  font-size: 10px
  font-family: 'Fira Mono'
"""
