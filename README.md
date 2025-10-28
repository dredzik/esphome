# esphome

My esphome configuration. This repository serves as a backup for all the
config files I have made or copied and adjusted for my home assistant +
esphome setup.

## Installation

Instructions are macOS based, since I am macOS based. Firstly install the
pyenv for python versions environment management, or you're going to have
a bad time. Then install esphome and you're all set. I used python 3.13
as at the time of writing this readme, python 3.14 was breaking esphome
run due to incompatibility.

```
$ brew install pyenv
$ pyenv install 3.13
$ cd ~/Projects/esphome # replace this with where you downloaded this repo
$ pip install esphome
```

## Build

Use make to compile and upload the firmware to your device. Remember to
pass DEVICE variable to make, so it knows what you want:

```
$ DEVICE=temperature make
$ DEVICE=temperature make install
```

Or a shorthand:

```
$ DEVICE=temperature make build install
```

### Warning

This Makefile is written so it will try to write firmware over usb to
the `/dev/tty.usbmodem*` device. That obviously means that if you have
multiple devices matching that wildcard, the results will be...
interesting. Make sure you know what you're doing.
