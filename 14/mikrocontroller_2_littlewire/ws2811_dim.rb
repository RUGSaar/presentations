require 'littlewire'
wire = LittleWire.connect
pin = :mosi
num_leds = 5

hue = 0.0

wire.pin_mode pin, :out

loop do
  ['red', 'green', 'blue'].each do |color|
    1000.downto(0).each do |i|
      wire.ws2811(pin).send([color] * num_leds)
      sleep 0.000001

      wire.ws2811(pin).send(['black'] * num_leds)
      sleep 0.005
    end
  end
end
