# [[ESP32-S3]]

```decl
hw esp32s3: esp32 {
	board   = 'ESP32-S3'
	vendor  = 'Espressif'
	variant = 'ESP32-S3-DevKitC-1-N8R8'
	
	usb = [
		serial_jtag: {
			vid  = 0x303A   // Espressif vendor ID
            pid  = 0x1001   // ESP32-S3 USB Serial/JTAG
		},
		usb_otg: {
			vid  = 0x303A   // Espressif vendor ID  
            pid  = 0x4001   // ESP32-S3 USB-OTG CDC
		}
	]
	
	pin = {
        led      = gpio[48]   // RGB LED on DevKitC
        uart0_tx = gpio[43]   // \ USB serial
        uart0_rx = gpio[44]   // /
        usb_dm   = gpio[19]   // USB-OTG D-
        usb_dp   = gpio[20]   // USB-OTG D+
        boot     = gpio[0]    // BOOT button
        reset    = gpio[38]   // Reset pin
    }
}
```
