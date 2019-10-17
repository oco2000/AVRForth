project = menu_test
device = devices/atmega8.spf
compiler = ../../spf4
avrdude_programmer = usbasp
avrdude_device = m8

$(project).spf.hex: $(project).spf menu_config.spf
	$(compiler) S\" $(project).spf\" S\" $(device)\" avrforth.spf BYE

flash: $(project).spf.hex
	avrdude -c $(avrdude_programmer) -p $(avrdude_device) -U flash:w:$^

clean:
	rm $(project).spf.*
