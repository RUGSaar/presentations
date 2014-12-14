require 'littlewire'

# Silkscreen  usbtinyisp  Hard PWM  Soft PWM  ADC   I2C   SPI   Onewire WS2812  CDC-232
# -------------------------------------------------------------------------------------
# pin1        MISO        CH_B      CH_2      -     -     DO    -       DATA    TX
# pin2        SCK         -         CH_3      CH_1  SCL   SCK   DATA    DATA    RX
# pin3        RESET       -         -         CH_0  -     CS    -       DATA    -
# pin4        MOSI        CH_A      CH_1      -     SDA   DI    -       DATA    -

wire = LittleWire.connect # connects to the first Little Wire on your computer
pin = :sck

wire.pin_mode pin, :out
  
loop do
  wire.digital_write pin, :vcc # connect pin3 to 5v
  sleep 1
  wire.digital_write pin, :gnd # connect pin3 to ground
  sleep 1
end
