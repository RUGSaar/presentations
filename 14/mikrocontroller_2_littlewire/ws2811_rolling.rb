require 'littlewire'

# Silkscreen  usbtinyisp  Hard PWM  Soft PWM  ADC   I2C   SPI   Onewire WS2812  CDC-232
# -------------------------------------------------------------------------------------
# pin1        MISO        CH_B      CH_2      -     -     DO    -       DATA    TX
# pin2        SCK         -         CH_3      CH_1  SCL   SCK   DATA    DATA    RX
# pin3        RESET       -         -         CH_0  -     CS    -       DATA    -
# pin4        MOSI        CH_A      CH_1      -     SDA   DI    -       DATA    -

wire = LittleWire.connect

pin = :mosi

speed_in_seconds = 1

class Array
  def mycycle
    a = self.shift
    self << a
  end
end

colors = [ 'red', 'green', 'blue', 'red', 'green', 'blue' ]


wire.pin_mode pin, :out

loop do
  wire.ws2811(pin).send(colors.mycycle)
  sleep speed_in_seconds
end
