# [[ESP-IDF]]

```decl
@build
sw espidf:sdk {
	version = 5.4.4
	github  = https://github.com/espressif/esp-idf.git
	path    = ~/esp/idf
	targets = [esp32;esp32s3]
}
```
```sh
mkdir ~/esp
git clone --depth 1 -b v5.4.4 --recursive https://github.com/espressif/esp-idf.git ~/esp/idf
cd ~/esp/idf ; ./install.sh esp32,esp32s3
```

setup SDK in every project:

```sh
. ~/esp/idf/export.sh
```
