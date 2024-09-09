DIRS = blinky buttons clock encoder hall i2c_detect_lcd i2c_detect_uart lcd lcd_big lcd_i2c menu_test preamp pwm_demo rc5 rtc spi stepper tester tst tst_bus tst_min usart

.PHONY: subdirs $(CLEANDIRS)
.PHONY: subdirs $(SUBDIRS)

CLEANDIRS = $(DIRS:%=clean-%)
BUILDDIRS = $(DIRS:%=build-%)

all: $(BUILDDIRS)
$(DIRS): $(BUILDDIRS)
$(BUILDDIRS):
	$(MAKE) -C $(@:build-%=%)

clean: $(CLEANDIRS)
$(CLEANDIRS):
	$(MAKE) -C $(@:clean-%=%) clean

.PHONY: all clean
