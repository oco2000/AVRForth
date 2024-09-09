project = stepper
device = devices/atmega328p.spf
compiler = ../../spf4
avrdude_programmer = arduino
avrdude_device = m328p
avrdude_port = /dev/ttyUSB0

$(project).spf.hex: $(project).spf
	$(compiler) S\" $^\" S\" $(device)\" avrforth.spf BYE

flash: $(project).spf.hex
	avrdude -c $(avrdude_programmer) -p $(avrdude_device) -P $(avrdude_port) -U flash:w:$^

clean:
	rm $(project).spf.*
