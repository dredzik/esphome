all: compile-all

compile-all: compile-meater compile-temperature compile-proxy

meater: compile-meater upload-meater
temperature: compile-temperature upload-temperature
proxy: compile-proxy upload-proxy

compile-meater:
	docker run --rm --privileged -v "${PWD}":/config -it ghcr.io/esphome/esphome compile meater.yaml

compile-temperature:
	docker run --rm --privileged -v "${PWD}":/config -it ghcr.io/esphome/esphome compile temperature.yaml

compile-proxy:
	docker run --rm --privileged -v "${PWD}":/config -it ghcr.io/esphome/esphome compile proxy.yaml

upload-meater:
	esptool.py --port /dev/tty.usbmodem* write_flash 0x0 .esphome/build/meater/.pioenvs/meater/firmware.factory.bin

upload-temperature:
	esptool.py --port /dev/tty.usbmodem* write_flash 0x0 .esphome/build/temperature/.pioenvs/temperature/firmware.factory.bin

upload-proxy:
	esptool.py --port /dev/tty.usbmodem* write_flash 0x0 .esphome/build/proxy/.pioenvs/proxy/firmware.factory.bin

