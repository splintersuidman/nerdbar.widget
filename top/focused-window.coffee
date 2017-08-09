command: "echo $(/usr/local/bin/kwmc query space active name):" +
         "$(/usr/local/bin/kwmc query space active tag)"
# chunkwm update
# command: "echo $(/usr/local/bin/chunkc tiling::query --desktop mode):" +
#          "$(/usr/local/bin/chunkc tiling::query --window tag)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div>
    <span class="tag"></span><span class="focused-window"></span>
  </div>
  """

update: (output) ->
  # Split output at first colon
  output = output.split(/:(.+)/)
  $(".tag").text "{#{output[0]}} "
  $(".focused-window").text output[1]

style: """
  -webkit-font-smoothing: antialiased
  color: #D0D0D0
  height: 16px
  .focused-window
    overflow: hidden
    text-overflow: ellipsis
    whitespace: nowrap
    width: calc(50vw - 20px)
  left: 10px
  top: 6px
  font-size: 10px
  font-family: 'Fira Mono'
"""
