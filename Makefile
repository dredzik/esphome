ifndef DEVICE
  $(error DEVICE is undefined)
endif

all: build

build:
	docker run --rm --privileged -v "${PWD}":/config -it ghcr.io/esphome/esphome compile ${DEVICE}.yaml

install:
	esptool.py --port /dev/tty.usbmodem* write_flash 0x0 .esphome/build/${DEVICE}/.pioenvs/${DEVICE}/firmware.factory.bin
