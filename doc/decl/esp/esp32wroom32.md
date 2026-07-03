# [[decl/esp/esp32|esp32]]wroom32

```decl
hw esp32wroom32: esp32 {

	// board identification
	board   = 'ESP32-WROOM-32'
	vendor  = 'Espressif'
    variant = 'ESP32-D0WDQ6'

    // memory
    ram        = 520<Kb>        // SRAM total
    flash      = 4<Mb>          // onboard SPI flash
    psram      = 0<Kb>          // no PSRAM on WROOM-32
    
    usb = {
	    cp210x : { vid:0x10C4 pid:0xEA60 }
	    ch340  : { vid:0x1A86 pid:0x7523 }
    }
	
    // features
    features   = [
        wifi                     // 802.11 b/g/n
        bluetooth                // BT 4.2 + BLE
        gpio                     // 34x GPIO pins
        uart                     // 3x UART
        spi                      // 4x SPI
        i2c                      // 2x I2C
        i2s                      // 2x I2S
        adc                      // 2x 12-bit SAR ADC (18ch)
        dac                      // 2x 8-bit DAC
        touch                    // 10x touch sensors
        hall                     // hall effect sensor
        ethernet                 // MAC interface
        sdio                     // SDIO 2.0 slave
        pwm                      // LEDC (16ch)
        motor_pwm                // MCPWM
        rmt                      // remote control
        pulse_counter            // PCNT
        timer                    // 4x 64-bit
        watchdog                 // 2x
        temp_sensor              // internal
    ]
	
    // power
    vcc        = 2.3..3.6<V>    // operating voltage
    current    = 80..500<mA>    // active current range

    // clocks
    xtal       = 40<MHz>        // crystal oscillator
    cpu_freq   = 240<MHz>       // max frequency

    // pin mapping (critical pins)
    pin = {
        led         = gpio[2]   // GPIO2 = blue LED
        uart0_tx    = gpio[1]   // \ USB serial
        uart0_rx    = gpio[3]   // /
        boot        = gpio[0]   // boot mode select
    }
    
    usb_serial = [ch340;cp210x]       // on-board USB serial variants
    
	// ADC characteristics
    adc1 {
        resolution  = 12<bit>
        channels    = gpio[32..39]    // ADC1 (GPIO32-39)
        max_voltage = 3.3<V>
        atten       = 11<dB>          // default attenuation
    }    
}
```
