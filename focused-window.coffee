#
# ──────────────────────────────────────────────────────────────────── III ─────
#   :::::: F O C U S E D   W I N D O W : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    owner: "/usr/local/bin/chunkc tiling::query --window owner"
    name:  "/usr/local/bin/chunkc tiling::query --window name"

  #
  # ─── GLOBALS ────────────────────────────────────────────────────────────────
  #

  globals =
    owner: ""
    name:  ""

  #
  # ─── COLORS ─────────────────────────────────────────────────────────────────
  #

  colors =
    black:   "#1d2021"
    grey:    "#a89984"
    red:     "#fb4924"
    green:   "#b8bb26"
    yellow:  "#fabd2f"
    blue:    "#458588"
    magenta: "#b16286"
    cyan:    "#689d6a"
    white:   "#ebdbb2"

  #
  # ─── COMMAND ────────────────────────────────────────────────────────────────
  #

  command: "echo " +
           "$(#{ commands.owner }):::" +
           "$(#{ commands.name })"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 1000

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    """
    <link rel="stylesheet" href="./font-awesome/font-awesome.min.css" />

    <div class="info-item window">
      <div class="icon"><i class="fa fa-window-maximize"></i></div>
      <span class="window-output"></span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  update: ( output ) ->
    output = output.split( /:::/g )

    owner = output[ 0 ]
    name  = output[ 1 ]

    if owner.replace( /([ \t\n])/g, "" ).length > 0
      globals.owner = owner

    if name.replace( /([ \t\n])/g, "" ).length > 0
      globals.name = name

    $( ".window-output" ).text( "#{ globals.owner } - #{ globals.name }" )

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .window .icon
      background-color: #{ colors.blue }
    .info-item
      display: flex
      padding: 0px 5px 0 0
      background-color: #{ colors.white }
      margin-left: 15px
      .icon
        padding: 1px 5px
        margin-right: 5px

    top: 3.5px
    left: 0px
    font-family: 'Fira Code'
    font-size: 13px
    font-smoothing: antialiasing
    z-index: 0
  """

# ──────────────────────────────────────────────────────────────────────────────
