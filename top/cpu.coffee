command: "ESC=`printf \"\e\"`; ps -A -o %cpu" +
         " | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <div class="cpu"></div>
  """

update: (output) ->
  $(".cpu").text "cpu: #{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #A3BE8C
  font: 10px Input
  right: 155px
  top: 6px
  font-family: 'Fira Mono'
"""
