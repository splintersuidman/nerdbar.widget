command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  """
  <div class="mem"></div>
  """

update: (output) ->
  $(".mem").text "mem: #{output}"

style: """
    -webkit-font-smoothing: antialiased
    color: #88C0D0
    font: 10px Input
    right: 225px
    top: 6px
    font-family: 'Fira Mono'
  """
