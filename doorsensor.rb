#!/usr/bin/ruby

require 'wiringpi'
require "faraday"

# HUE Color code
# https://developers.meethue.com/documentation/core-concepts

# to check wPi_num and GPIO, execute 'gpio readall'
GPIO26 = 25

# init
bridge = 1
id = 1

# for API
bridge_ip = ["192.168.11.3", "192.168.11.2", "192.168.11.4"]
api_key   = ["0XKpToZs32abteyjeo7VGED-8kilfZ5xASozaZ9-", "FHUpTcDacBmSNXrHCTSwSKPJ2DY2tV22cWcLuelY", "QaiyESlyKVQjjpsCikFie6lZw41d0RLOMEiHpTOi"]

def api_put(bridge_ip, api_key, id, key, value)
  res = Faraday.put "http://" + bridge_ip + "/api/" + api_key + "/lights/" + id + "/state", "{\"hue\": #{value}}"

  p "http://" + bridge_ip + "/api/" + api_key + "/lights/" + id + "/state"
  p key
  p value
  p '==='
  p res
end


io = WiringPi::GPIO.new
io.pin_mode(GPIO26, WiringPi::INPUT )

loop do
  state = io.digital_read(GPIO26)
  p state

  if state == 0
    api_put(bridge_ip[bridge - 1], api_key[bridge - 1], id, "hue", 25500) # Green
  elsif stet == 1
    api_put(bridge_ip[bridge - 1], api_key[bridge - 1], id, "hue", 46920) # Blue
  else
    api_put(bridge_ip[bridge - 1], api_key[bridge - 1], id, "hue", 65280) # Red
  end
  
  sleep(1)
end

