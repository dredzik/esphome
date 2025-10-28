ifndef DEVICE
  $(error DEVICE is undefined)
endif

all: build

build:
	esphome compile ${DEVICE}.yaml

install:
	esptool --port /dev/tty.usbmodem* write_flash 0x0 .esphome/build/${DEVICE}/.pioenvs/${DEVICE}/firmware.factory.bin
