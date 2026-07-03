# Module System

- module is a single .md file or set of .md files groupes in a directory
	- every module extends DSL with some extra features
- decl/[[decl/core/core|core]] contains `decl` core language specification and base functionality
	- other modules can be added into AI query/setup **optionally** in dependence of app and current work requirements
	- special sort of modules configures target translation language in which we need to generate code:
		- [[decl/js/js|js]]
		- [[decl/cpp/cpp|cpp]]
	- next set configures components of target platform we want to run code:
		- [[decl/linux/linux|embedded Linux]] 
		- [[decl/android/android|mobile devices & HMI]]
		- [[decl/mcu/mcu|generic MCU topics]]: peripherial, interfaces, sensors,..
			- [[decl/arm/cortex|Cortex-M]]
			- [[decl/esp/esp|ESP32 variants]]
			- [[decl/os/bare|bare-metal]] 
			- [[decl/os/rtos|FreeRTOS]] 
