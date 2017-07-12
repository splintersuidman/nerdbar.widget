command: "echo $(/usr/local/bin/kwmc query space list | wc -l):" +
         "$(/usr/local/bin/kwmc query space active id)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="spaces"></div>
  """

update: (output) ->
  # Remove space characters
  output       = output.replace /\s/, ""
  # Split at `:`
  output       = output.split(":")
  spacesCount  = Number output[0]
  currentSpace = output[1]
  # Clear .spaces
  $(".spaces").empty()

  for i in [1 ... spacesCount + 1]
    $(".spaces").append """
    <div class="space" id="space-#{i}">
      <span class="space-number">#{i}<span>
    </div>
    """
  $("#space-#{currentSpace}").addClass "active"


style: """
  .spaces
    display: flex
    width: 100vw
    cursor: pointer
  .space
    width: 25px
    height: 25px
    text-align: center
    cursor: pointer
    background-color: rgba(0, 0, 0, 0.2)
    display: table
  .active
    background-color: rgba(0, 0, 0, 0)
  .space-number
    display: table-cell
    vertical-align: middle
    margin: auto

  -webkit-font-smoothing: antialiased
  text-align: left
  color: #D8DEE9
  height: 25px
  overflow: hidden
  text-overflow: ellipsis
  left: 0px
  bottom: 0px
  font-size: 10px
  font-family: 'Fira Mono'
"""
