require 'littlewire'

# Silkscreen  usbtinyisp  Hard PWM  Soft PWM  ADC   I2C SPI Onewire WS2812  CDC-232
# pin1        MISO        CH_B      CH_2      -     -   DO  -       DATA    TX
# pin2        SCK         -         CH_3      CH_1  SCL SCK DATA    DATA    RX
# pin3        RESET       -         -         CH_0  -   CS  -       DATA    -
# pin4        MOSI        CH_A      CH_1      -     SDA DI  -       DATA    -

wire = LittleWire.connect # connects to the first Little Wire on your computer

FPS = 60 # update 60 times per second
fader = 0.0 # our current position

loop do
  value = (Math.sin(fader) + 1.0) * 100 + 27

  wire.softpwm_c = value
  
  fader += 0.025
  sleep 1.0 / FPS
end
