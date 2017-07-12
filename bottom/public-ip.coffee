command: "curl -4fNs ipinfo.io/ip"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="public-ip"></div>
  """

update: (output) ->
  if output
    $(".public-ip").text output
  else
    $(".public-ip").text "not connected"


style: """
  -webkit-font-smoothing: antialiased
  text-align: right
  color: #BF616A
  height: 16px
  right: 110px
  bottom: 2px
  font-size: 10px
  font-family: 'Fira Mono'
"""
