project = tst_buttons
device = devices/atmega168.spf
compiler = ../../spf4
avrdude_programmer = usbasp
avrdude_device = m168

$(project).spf.hex: $(project).spf
	$(compiler) S\" $^\" S\" $(device)\" avrforth.spf BYE

flash: $(project).spf.hex
	avrdude -c $(avrdude_programmer) -p $(avrdude_device) -U flash:w:$^

clean:
	rm $(project).spf.*
