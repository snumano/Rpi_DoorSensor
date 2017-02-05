#!/usr/bin/ruby

require 'wiringpi'

# to check wPi_num and GPIO, execute 'gpio readall'

GPIO26 = 25

io = WiringPi::GPIO.new
io.pin_mode(GPIO26, WiringPi::INPUT )

loop do
  status = io.digital_read(GPIO26)
  p status
  sleep(1)
end

