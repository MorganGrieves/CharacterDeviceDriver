# Makefile - makefile of our first driver

$(info kernel is ${KERNELRELEASE})
ifneq (${KERNELRELEASE}, )
    obj-m := ofd.o
else
    KERNEL_SOURCE := /usr/src/linux-headers-5.10.0-8-amd64 
    PWD := $(shell pwd)
default:
	${MAKE} -C ${KERNEL_SOURCE} M=${PWD} modules

clean:
	${MAKE} -C ${KERNEL_SOURCE} M=${PWD} clean
test:
	sudo dmesg -C
	sudo insmod ofd.ko
	sudo rmmod ofd.ko
	dmesg
endif
