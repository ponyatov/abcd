# esp32

```decl
arch esp
arch xtensa:esp {}
arch riscv:esp {}
cpu lx106 { arch=xtensa }
cpu lx107 { arch=xtensa }
hw esp8266 { cpu=lx106 }              // depricated but require support in decl
hw esp32 {
	cpu = lx107 ; os = rtos; sdk = espidf
	apt = [
		git; wget;
		flex; bison;
		gperf; ccache;
		libffi-dev; libssl-dev;
		dfu-util; libusb-1.0-0;
		python3; python3-pip; python3-venv
	]
}
hw esp32s { arch=xtensa ; os=rtos }
hw esp32c { arch=riscv ; os=rtos }
hw esp32c3: esp32c {}
hw esp32c6: esp32c {}
```

- [[decl/core/host]]
- [[decl/esp/esp32wroom32]]
- [[decl/esp/udev-rules]]
- [[decl/esp/idf]]
- [[decl/esp/files]]
- [[decl/esp/hello]]
- [[decl/esp/cmake]]
