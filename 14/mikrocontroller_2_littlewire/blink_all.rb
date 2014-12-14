require 'littlewire'

# Silkscreen  usbtinyisp  Hard PWM  Soft PWM  ADC   I2C   SPI   Onewire WS2812  CDC-232
# -------------------------------------------------------------------------------------
# pin1        MISO        CH_B      CH_2      -     -     DO    -       DATA    TX
# pin2        SCK         -         CH_3      CH_1  SCL   SCK   DATA    DATA    RX
# pin3        RESET       -         -         CH_0  -     CS    -       DATA    -
# pin4        MOSI        CH_A      CH_1      -     SDA   DI    -       DATA    -

wire = LittleWire.connect # connects to the first Little Wire on your computer

begin
  pins = [ :pin1, :pin2, :pin3, :pin4 ]
  pins = [ :reset, :mosi, :miso, :sck ]
  
  pins.each do |pin|
    wire.pin_mode pin, :out
  end
  
  loop do
    pins.each do |pin|
      puts "Blink pin #{pin}"
      wire.digital_write pin, :vcc # connect pin3 to 5v
      sleep 1
      wire.digital_write pin, :gnd # connect pin3 to ground
    end
  end
rescue SystemExit, Interrupt
end

puts "Cleanup"
wire.finished
wire = LittleWire.connect
wire.finished
