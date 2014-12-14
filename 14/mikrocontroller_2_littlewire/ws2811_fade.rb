require 'littlewire'

# Silkscreen  usbtinyisp  Hard PWM  Soft PWM  ADC   I2C   SPI   Onewire WS2812  CDC-232
# -------------------------------------------------------------------------------------
# pin1        MISO        CH_B      CH_2      -     -     DO    -       DATA    TX
# pin2        SCK         -         CH_3      CH_1  SCL   SCK   DATA    DATA    RX
# pin3        RESET       -         -         CH_0  -     CS    -       DATA    -
# pin4        MOSI        CH_A      CH_1      -     SDA   DI    -       DATA    -

wire = LittleWire.connect
pin = :mosi
speed_in_seconds = 0.025
num_leds = 5

hue = 0.0

loop do
  red = 1.0 + (Math.sin(hue) * 127)
  green = 1.0 + (Math.sin(hue + ((Math::PI*2.0) / 3)) * 127)
  blue = 1.0 + (Math.sin(hue - ((Math::PI*2.0) / 3)) * 127)

  puts "[ #{red.to_i.to_s.rjust(3," ")} #{green.to_i.to_s.rjust(3," ")} #{blue.to_i.to_s.rjust(3," ")} ] "
  
  wire.ws2811(pin).send([Colorist::Color.from_rgb(red, green, blue)] * num_leds)
  
  hue += 0.01
  sleep speed_in_seconds
end
