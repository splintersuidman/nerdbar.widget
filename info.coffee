#
# ──────────────────────────────────────────────── II ──────
#   :::::: I N F O : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    battery:  "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
              "| cut -f1 -d';'"
    time:     "date +\"%H:%M\""
    wifi:     "/System/Library/PrivateFrameworks/Apple80211.framework/" +
              "Versions/Current/Resources/airport -I | " +
              "sed -e \"s/^ *SSID: //p\" -e d"
    volume:   "osascript -e 'output volume of (get volume settings)'"
    charging: "pmset -g batt"

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
           "$(#{ commands.battery }):::" +
           "$(#{ commands.time }):::" +
           "$(#{ commands.wifi }):::" +
           "$(#{ commands.volume }):::" +
           "$(#{ commands.charging }):::"

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

    <div class="info-item volume">
      <div class="icon"><span class="volume-icon"></span></div>
      <span class="volume-output"></span>
    </div>
    <div class="info-item wifi">
      <div class="icon"><i class="fa fa-wifi"></i></div>
      <span class="wifi-output"></span>
    </div>
    <div class="info-item battery">
      <div class="icon"><span class="battery-icon"></span></div>
      <span class="battery-output"></span>
    </div>
    <div class="info-item time">
      <div class="icon"><i class="fa fa-clock-o"></i></div>
      <span class="time-output"></span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  update: ( output ) ->
    output = output.split( /:::/g )

    battery  = output[ 0 ]
    time     = output[ 1 ]
    wifi     = output[ 2 ]
    volume   = output[ 3 ]
    charging = output[ 4 ]

    $( ".battery-output" ) .text( "#{ battery }" )
    $( ".time-output" )    .text( "#{ time }" )
    $( ".wifi-output" )    .text( "#{ wifi }" )
    $( ".volume-output" )  .text( "#{ volume }%" )

    @handleBattery(
      Number( battery.replace( /%/g, "" ) ),
      !charging.indexOf( "discharging" ) >= 0
    )
    @handleVolume( Number( volume ) )

  #
  # ─── HANDLE BATTERY ─────────────────────────────────────────────────────────
  #

  handleBattery: ( percentage, charging ) ->
    batteryIcon = switch
      when charging          then "fa-bolt"
      when percentage <=  12 then "fa-battery-0"
      when percentage <=  25 then "fa-battery-1"
      when percentage <=  50 then "fa-battery-2"
      when percentage <=  75 then "fa-battery-3"
      when percentage <= 100 then "fa-battery-4"
    $( ".battery-icon" ).html( "<i class=\"fa #{ batteryIcon }\"></i>" )

    color = if percentage < 25 then colors.red else colors.green
    $( ".battery .icon" ).css( "background-color", color )

  #
  # ─── HANDLE VOLUME ──────────────────────────────────────────────────────────
  #

  handleVolume: ( volume ) ->
    volumeIcon = switch
      when volume ==   0 then "fa-volume-off"
      when volume <=  50 then "fa-volume-down"
      when volume <= 100 then "fa-volume-up"
    $( ".volume-icon" ).html( "<i class=\"fa #{ volumeIcon }\"></i>" )

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .battery .icon
      background-color: #{ colors.green }
    .time .icon
      background-color: #{ colors.magenta }
    .wifi .icon
      background-color: #{ colors.grey }
    .volume .icon
      background-color: #{ colors.cyan }

    .info-item
      display: flex
      padding: 0 5px 0 0
      background-color: #{ colors.white }
      margin-right: 15px
      .icon
        padding: 1px 5px
        margin-right: 5px

    display: flex

    top: 3.5px
    right: 0px
    font-family: 'Fira Code'
    font-size: 13px
    font-smoothing: antialiasing
    z-index: 0
  """

# ──────────────────────────────────────────────────────────────────────────────
