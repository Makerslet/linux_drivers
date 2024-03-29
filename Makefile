obj-m += chrdev.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean

load: 
	sudo insmod chrdev.ko
	sudo dmesg -c

unload:
	sudo rmmod chrdev.ko
	sudo dmesg -c
