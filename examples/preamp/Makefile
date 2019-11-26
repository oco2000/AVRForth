project = preamp
device = devices/atmega8.spf
compiler = ../../spf4
avrdude_programmer = usbasp
avrdude_device = m8

$(project).spf.hex: $(project).spf tda7313.spf menu_config.spf
	$(compiler) S\" $(project).spf\" S\" $(device)\" avrforth.spf BYE

flash: $(project).spf.hex
	avrdude -c $(avrdude_programmer) -p $(avrdude_device) -U flash:w:$^

eeprom: $(project).spf.eep.hex
	avrdude -c $(avrdude_programmer) -p $(avrdude_device) -U eeprom:w:$^

clean:
	rm $(project).spf.*
