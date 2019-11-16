DIRS = buttons clock lcd lcd_big menu_test pwm_demo spi preamp tester tst tst_bus tst_min usart encoder rc5 i2c_detect

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
