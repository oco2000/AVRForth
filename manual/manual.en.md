# AVRForth

## 1. AVRForth - what is it?

AVRForth is a cross-compiler of the Forth language for ATMEL 8-bit microcontrollers. It does not have the ability to add new words directly in the microcontroller.

It is written in [SP-Forth](https://github.com/rufig/spf).

* Harvard model - code and data are separated

* Subroutine threaded code

* Data stack is in internal RAM, return stack is hardware (in internal RAM).

* Internal RAM utilization:

 - General purpose register bank area.

 - Variables, vectors, arrays area - between the top address of the register area and the data stack.

 - The data stack is 16-bit. The bottom is placed at the end of the return stack. The stack grows in the direction of decreasing addresses. The top cell of the data stack is xh:xl. The pointer to the second cell of the stack is yh:yl.

 - Return Stack. It has a size of 80 bytes and configurable. The bottom of the return stack is located at the end of the RAM and grows towards decreasing addresses. The pointer of the top of the return stack is SP register.

## 2. How to compile your programs

To get the .hex firmware file you need to compile your program. **In Linux** you do it like this:

```bash
  ./spf4 S\" program.spf\" S\" deivces/atmega8.spf\" avrforth.spf BYE
```

**In Windows** similarly:

```bash
spf4.exe UNIX-LINES S" %1" S" devices/atmega8.spf" AVRFORTH.spf BYE
```

As a result you will get:

* a firmware file `program.spf.hex` that you can flash the controller with
* firmware file in binary format `program.spf.bin`
* EEPROM content file `program.spf.eep.hex`
* EEPROM content file in binary format `program.spf.eep.bin`
* listing file `program.spf.lst`

The example directories contain `Makefile` files to help you compile to Linux with a single `make` command, flash with `make flash` and `make eeprom` commands, and delete unnecessary files with `make clean`.

To configure the project, specify at the beginning of the Makefile:

- project file without extension

```
project = tst_buttons
```

- file with controller definition

```
device = devices/atmega168.spf
```

- SP-Forth location

```
compiler = ../../spf4
```

- type of programmer for avrdude tool

```
avrdude_programmer = usbasp
```

- controller type for avrdude

```
avrdude_device = m168
```

There is a common Makefile for all examples in the examples directory that allows you to quickly recompile all examples:

```bash
make clean && make
```

For compilation in Windows, each example directory has a ``compile.bat`` file.


## 3. How to write

### Requiring the right words

All the required forth words are automatically included. However, this only applies to colon definitions. If you are writing defining words or macros, the required definitions will need to be included manually using `TREQUIRE`, e.g.

```forth
  TREQUIRE DUP
```

AVRForth will include the necessary file itself. The list of words with their corresponding file names can be found in `src/require.cfg`.

#### List of available words

  During development I tried to follow the standard, so the available words corresponding to the standard will be without comments.

| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| Stack operations:|
| DUP |   |   | inline.spf |
| DROP |   |   | inline.spf |
| NIP |   |   | inline.spf |
| OVER |   |   | kernel/over.spf |
| SWAP |   |   | kernel/swap.spf |
| PICK |   |   | kernel/pick.spf |
| ?DUP |   |   | kernel/if_dup.spf |
| 2DUP |   |   | kernel/2dup.spf |
| 2DROP |   |   | kernel/2drop.spf |
| 2OVER |   |   | kernel/2over.spf |
| 2SWAP |   |   | kernel/2swap.spf |
| ROT |   |   | kernel/rot.spf |
| -ROT |   |   | kernel/minus_rot.spf |
| TUCK |   |   | kernel/tuck.spf |
| SP@ |   |   | kernel/sp_fetch.spf |
| DEPTH |   |   | kernel/depth.spf |

#### Math:
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| 0   |   |   | kernel/zero.spf |
| 1   |   |   | kernel/one.spf |
| 2   |   |   | kernel/two.spf |
| -1   |   |   | kernel/minus_one.spf |
| 1- |   |   | inline.spf |
| 1+ |   |   | inline.spf |
| 2- |   |   | inline.spf |
| 2+ |   |   | inline.spf |
| CELL- |   |   | inline.spf |
| CELL+ |   |   | inline.spf |
| CELLS |   |   | inline.spf |
| CHAR+ |   |   | inline.spf |
| CHARS |   |   | inline.spf |
| + |   |   | kernel/plus.spf |
| - |   |   | kernel/minus.spf |
| LSHIFT | ( x1 u -- x2 ) | Performs a logical left shift of x1 by u bits and returns x2. Places zeros in the lowest bits freed by the shift. | kernel/lshift.spf |
| RSHIFT | ( x1 u -- x2 ) | Performs a logical right shift of x1 by u bits, returns x2. Places zeros in the highest bits freed by the shift. | kernel/rshift.spf |
| EXP2 | ( n -- ) | 2 to the power of n | kernel/exp2.spf |
| INVERT | | | inline.spf |
| HI | ( n -- high ) | Returns the high byte of a number | inline.spf |
| LO | ( n -- low ) | Returns the low byte of the number | inline.spf |
| NIBBLE-SPLIT | ( n -- low high ) | Splits the low byte of a number into two tetrads | kernel/nibble-split.spf |
| NIBBLE-SWAP | ( c1 - c2 ) | Swaps the low byte nibbles of a number | kernel/nibble-swap.spf |
| NIBBLE-JOIN | ( low high -- c ) | | Combines two tetrads into a byte | kernel/nibble-join.spf |
| BYTE-SPLIT | ( n -- low high ) | Splits a number into a low and a high byte | kernel/byte-split.spf |
| BYTE-JOIN | ( low high -- c ) | Combines bytes into a number | kernel/byte-join.spf | | kernel/byte-join.spf |
| NEGATE | | | kernel/negate.spf |
| ?NEGATE | ( n1 n2 -- n3 ) | Changes the sign of n1 if n2<0 | kernel/if_negate.spf |
| ABS | | | kernel/abs.spf |
| MAX | | | kernel/max.spf |
| MIN | | | kernel/min.spf |
| 0MAX | ( n1 -- n2 ) | Equivalent to 0 MAX | kernel/0max.spf |
| C>S | ( c -- n ) | Extend byte to signed word | kernel/c\_to\_s.spf |
| U2/ | ( u1 -- u2 ) | Unsigned division by 2 | inline.spf |
| 2/ | | | inline.spf |
| \* | | | kernel/star.spf |
| 2\* | | | inline.spf |
| \*/MOD | | | kernel/star\_slash\_mod.spf |
| \*/ | | | kernel/star_slash.spf |
| /MOD | | | kernel/slash_mod.spf |
| MOD | | | kernel/mod.spf |
| / | | | kernel/slash.spf |
| UM+ | ( u1 u2 -- ud ) | Unsigned addition, result is unsigned double | kernel/um_plus.spf |
| D+ | | | kernel/d_plus.spf |
| D- | | | kernel/d_minus.spf |
| DNEGATE | | | kernel/dnegate.spf |
| DABS | | | kernel/d_abs.spf |
| S>D | | | kernel/s\_to\_d.spf |
| UD2/ | ( ud1 -- ud2 ) | Unsigned division of a double-length number by 2 | kernel/ud2_div.spf |
| D2/ | | | kernel/d2_div.spf |
| D2\* | | | kernel/d2_star.spf |
| UM\* | | | kernel/um_star.spf |
| UM/MOD | | | kernel/um\_slash\_mod.spf |
| MU/MOD | ( ud1 u1 -- ud2 u2 ) | Divides ud1 by u1, returns the quotient ud2 and the remainder u2. All values are unsigned. | kernel/mu\_slash\_mod.spf |
| UD\* | ( ud1 u -- ud2 ) | Unsigned multiplication of a double-length number by a single-length number, the result is double | kernel/ud_star.spf |
| M\* |   |   | kernel/m_star.spf |
| FM/MOD |   |   | kernel/m\_slash_mod.spf |

#### Return stack
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| R@ |   |   | kernel/rfetch.spf |
| >R |   |   | kernel/to_r.spf |
| DUP>R | ( n -- n ) | DUP >R | kernel/dup\_to_r.spf |
| R> |   |   | kernel/from_r.spf |
| RDROP | ( -- ) | R> DROP | kernel/rdrop.spf |

#### Memory
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| C! |   |   | kernel/c_store.spf |
| C@ |   |   | kernel/c_fetch.spf |
| C@P | ( c-addr -- char ) | Fetches a byte from program memory | kernel/c_fetchp.spf |
| CS@P | ( c-addr -- n ) | Fetches a byte from program memory and sign-extends it | kernel/cs_fetchp.spf |
| ! | | | kernel/store.spf |
| +! | | | kernel/plus_store.spf |
| @ | | | kernel/fetch.spf |
| @P | ( addr -- n ) | Fetch a number from program memory | kernel/fetchp.spf |
| INCR | ( addr -- ) | Increases the value at address by 1 | kernel/incr.spf |
| DECR | ( addr -- ) | Decreases the value at address by 1 | kernel/decr.spf |
| ON | ( addr -- ) | writes -1 to | kernel/on.spf |
| OFF | ( addr -- ) | Writes 0 to | kernel/off.spf |
| 2@ | | | kernel/2_fetch.spf |
| 2! | | | kernel/2_store.spf |
| FILL | | | kernel/fill.spf |
| ERASE | | | kernel/erase.spf |
| CMOVE | | | kernel/cmove.spf |
| CMOVEP | ( c-addr-rom c-addr-ram u -- ) | Copy from ROM to RAM u bytes | kernel/cmovep.spf |
| C@E | ( c-addr -- char ) | Fetch byte from EEPROM | kernel/c_fetch_e.spf |
| @E | ( addr -- n ) | Fetches a number from EEPROM | kernel/fetch_e.spf |
| C!E | ( c c-addr -- ) | Writes a byte to EEPROM | kernel/c_store_e.spf |
| !E | ( n addr -- ) | Writes a number to EEPROM | kernel/store_e.spf | |

#### Logic and bitwise operations:
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| AND |   |   | kernel/and.spf |
| OR |   |   | kernel/or.spf |
| XOR |   |   | kernel/xor.spf |
| > |   |   | kernel/more.spf |
| >= |   |   | kernel/more\_or_equal.spf |
| < |   |   | kernel/less.spf |
| U< |   |   | kernel/u_less.spf |
| 0< |   |   | kernel/zero_less.spf |
| 0= |   |   | kernel/zero_eq.spf |
| = |   |   | kernel/equal.spf |
| <> |   |   | kernel/not_equal.spf |
| WITHIN |   |   | kernel/within.spf |
| D0<> |   |   | kernel/d\_zero\_not\_eq.spf |
| D< |   |   | kernel/d_less.spf |
| D0< |   |   | kernel/d\_zero\_less.spf |

#### Strings
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| C" | Compile: ("ccc<quote>" -- )<br>Execution-time: ( -- c-addr ) | gets ccc bounded by " (double-quote), and appends the execution-time semantics below to the current definition. Returns c-addr a counted string consisting of ccc characters. The string is in program memory. | xfbase.f |
| COUNT | | | kernel/count.spf |
| COUNTP | | Same as COUNT for a string in program memory | kernel/countp.spf |
| SP" | | Same as S" in normal forth, but gives an address in program memory | kernel/sp_quote.spf |
| ." | | | kernel/dot_quote.spf |
| EMIT | | The vector to override, does not point to any word by default | kernel/emit.spf |
| TYPE | | | kernel/type.spf |
| TYPEP | | Same as TYPE for a string in program memory | kernel/typep.spf |
| SPACE |   |   | kernel/space.spf |
| SPACES |   |   | kernel/spaces.spf |
| CR |   |   | kernel/cr.spf |

#### Number formatting
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| >DIGIT | ( n -- char ) | Convert number to char | kernel/digit.spf |
| BASE |   |   | kernel/num_conv.spf |
| HLD |   | Current place in conversion buffer | kernel/num_conv.spf |
| PAD-SIZE |   | Conversion buffer size | kernel/num_conv.spf |
| PAD |   | Conversion buffer | kernel/num_conv.spf |
| NUMPAD |   | Conversion buffer end | kernel/num_conv.spf |
| DECIMAL |   |   | kernel/num_conv.spf |
| HEX |   |   | kernel/num_conv.spf |
| <# |   |   | kernel/num_conv.spf |
| HOLD |   |   | kernel/num_conv.spf |
| # |   |   | kernel/num_conv.spf |
| #S |   |   | kernel/num_conv.spf |
| SIGN |   |   | kernel/num_conv.spf |
| #> |   |   | kernel/num_conv.spf |
| (UD.) | ( ud — addr len ) | Convert unsigned double | kernel/u\_d_dot.spf |
| (U.) | ( u — addr len ) | Convert unsigned | kernel/\_u_dot.spf |
| U. |   |   | kernel/u_dot.spf |
| (D.) | ( d — addr len ) | Convert double | kernel/\_d_dot.spf |
| (.) | ( n — addr len ) | Convert a number | kernel/_dot.spf |
| . |   |   | kernel/dot.spf |
| (0.R) | ( n width -- addr len ) | Convert a number, right justify in a field of width, fill with zeros | kernel/\_zero\_dot_r.spf |
| (.R) | ( n width -- addr len ) | Convert a number, right justify in a field of width, fill with spaces | kernel/\_dot_r.spf |
| (U.R) | ( u width -- addr len ) | Convert unsigned, right justify in a field of width, fill with spaces | kernel/\_u\_dot_r.spf |
| .S |   | Print the stack  | kernel/dot_s.spf |
| .SN | ( n -- ) | Print n top elements of the stack | kernel/dot_sn.spf |

#### IO ports (Low-level)
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| C@ | ( addr -- с ) | Fetch a byte from aport<br>Usage: `DDRC C@` |   |
| C! | ( c addr -- ) | Write a byte to a port: <br>`0x7 DDRC C!` |   |
| SET | ( mask addr -- ) | Read a byte from a port, «or» it with the mask and write back to the port. The mask and the port should be literals. <br>Usage: `7 BIT  DDRC SET` | inline.spf |
| MASK | ( mask addr -- ) | Read a byte from a port, «and» it with the mask and write back to the port. The mask and the port should be literals. <br>Usage: `7 BIT  DDRC MASK` | inline.spf |
| TOGGLE | ( mask addr -- ) | Read a byte from a port, «xor» it with the mask and write back to the port. The mask and the port should be literals. <br>Usage: `7 BIT  PORTB TOGGLE` | inline.spf |
| CLEAR | ( mask addr -- ) | Read a byte from a port, «and» it with the **inverted** mask and write back to the port. The mask and the port should be literals. <br>Usage: `7 BIT  PORTB CLEAR` | inline.spf |
| BITS{ | ( -- -1 ) | Start the mask definition | Macro, xfbase.f |
| }BITS | ( -1 b1 b2 … bx -- n ) | Get the mask from the numbers of bits. Compile as a literal if in target compilation mode, otherwise leave the mask on the data stack<br>Usage: `BITS{ WGM01 WGM00 COM0A1 }BITS` | Macro, xfbase.f |
| BIT | ( n -- mask ) | Get the mask from the bit number. Compile as a literal if in target compilation mode, otherwise leave the mask on the data stack<br>Usage: `WGM01 BIT` | Macro, xfbase.f |

#### Other
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| EXECUTE |   |   | kernel/execute.spf |
| \['\] |   |   | Macro, xfbase.f |
| ' |   |   | Macro, xfbase.f |
| LITERAL |   |   | inline.spf |
| 2LITERAL |   |   | inline.spf |
| REBOOT | ( -- ) | | inline.spf |
| EXIT | ( -- ) | | inline.spf |
| \ | ( – ) | Comment until the end of the line | xfbase.spf |
| \\ | ( – ) | Comment until the end of the line, copied to the listing | avrdis.f |

#### Control flow
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| IF |   |   | inline.spf |
| ELSE |   |   | inline.spf |
| THEN |   |   | inline.spf |
| BEGIN |   |   | inline.spf |
| AGAIN |   |   | inline.spf |
| REPEAT |   |   | inline.spf |
| WHILE |   |   | inline.spf |
| UNTIL |   |   | inline.spf |
| \[UNTIL<>0\] | ( flag — flag ) | Equivalent to '0 <> UNTIL', but does not drop the flag. | inline.spf |
| DO |   |   | inline.spf |
| ?DO |   |   | inline.spf |
| LOOP |   |   | inline.spf |
| +LOOP |   |   | inline.spf |
| I |   |   | inline.spf |
| J |   |   | kernel/j.spf |
| LEAVE |   |   | inline.spf |
| UNLOOP |   |   | inline.spf |

#### Compilation
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| ALLOT | ( n -- ) | Reserve n bytes in RAM | xfbase.f |
| TALLOT | ( n -- ) | Reserve n bytes in ROM | xfbase.f |
| EALLOT | ( n -- ) | Reserve n bytes in EEPROM | xfbase.f |
| \[ | ( -- ) | Turn off target compilation mode | xfbase.f |
| ] | ( -- ) | Turn on target compilation mode | xfbase.f |
| \[\[ |   | '[' word from FORTH | xfbase.f |
| ]] |   | ']' word from FORTH | xfbase.f |
| \[T] |   | ALSO TARGET | xfbase.f |
| \[P] |   | PREVIOUS | xfbase.f |
| \[F] |   | ALSO FORTH | xfbase.f |
| T, | ( n -- ) | Compile a number to ROM | flash.spf |
| TC, | ( с -- ) | Compile a byte to ROM | flash.spf |
| THERE | ( -- а ) | Current compilation address in ROM | flash.spf |
| TALIGN | ( -- ) | Align the compilation pointer in ROM | flash.spf |
| E, | ( n -- ) | Compile a number to EEPROM | flash.spf |
| EC, | ( с -- ) | Compile a byte to EEPROM  | flash.spf |
| EHERE | ( -- а ) | Current compilation address in EEPROM | flash.spf |

#### Defining words
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| : |   |   | xfbase.f |
| CALL-ONLY: |   | Start a colon definition, but exclude tail recursion optimization (used mostly for words that manipulate the return stack) | xfbase.f |
| ; |   |   | xfbase.f |
| MACRO: |   | Start a macro | xfbase.f |
| ;MACRO |   | End a macro | xfbase.f |
| INT: |   | Start an interrupt handler | isr.f |
| ;INT |   | End an interrupt handler | isr.f |
| ASMINT: |   | Start an assembly interrupt handler | isr.f |
| ;ASMINT |   | Start an assembly interrupt handler | isr.f |
| CREATE |   | See later the usage of defining words | xfbase.f |
| TCREATE |   | See later the usage of defining words | xfbase.f |
| PCREATE |   | See later the usage of defining words | xfbase.f |
| RCREATE |   | See later the usage of defining words | xfbase.f |
| ECREATE |   | See later the usage of defining words | xfbase.f |
| VARIABLE |   | Variable in RAM | xfbase.f |
| CVARIABLE |   | Byte variable in RAM | xfbase.f |
| 2VARIABLE |   | Double variable in RAM | xfbase.f |
| EVARIABLE |   | Variable in EEPROM | xfbase.f |
| CEVARIABLE |   | Byte variable in EEPROM | xfbase.f |
| 2EVARIABLE |   | Double variable in EEPROM | xfbase.f |
| CONSTANT или == |   | Constant, compiles as a literal | xfbase.f |
| 2CONSTANT или 2== |   | Double constant, compiles as a double literal | xfbase.f |
| FCONST |   | Forth constant, does not compile anything | xfbase.f |
| PDOES> |   | See later the usage of defining words | xfbase.f |
| DOES> |   | See later the usage of defining words | xfbase.f |
| \[VECT\] |   | A static vector in ROM | xfbase.f |
| \[->\] |   | Assign a value to a static vector. For interpretation only. Usage: `' WORD [->] VECTOR` | xfbase.f |
| ->INT |   | Set an interrupt handler. For interpretation only. Usage: `' HANDLER ->INT VECTOR` | isr.f |
| VECT |   | A vector | kernel/dovect.spf |
| IS |   | Assign a value to a vector. For compilation only. Usage: `['] WORD IS VECTOR` | kernel/dovect.spf |

#### Variable, constants
| Word | Stack comment | Description | Where defined |
| --- | --- | --- | --- |
| mega8515, mega168, mega8, mega48, etc.. |   | Constants for devices | devices/devices.spf |
| DEVICE |   | Current device | devices/хххххх.spf |
| ROM-SIZE |   | VALUE, ROM size | devices/хххххх.spf |
| RAM-BOTTOM |   | VALUE, RAM start address | devices/хххххх.spf |
| RAM-SIZE |   | VALUE, RAM Size | devices/хххххх.spf |
| RAM-TOP |   | VALUE, RAM end | devices/хххххх.spf |
| RSTACK-SIZE |   | VALUE, Return stack size | devices/хххххх.spf |
| SPTR0 |   | VALUE, Data stack botton | devices/хххххх.spf |
| VECTOR-SIZE |   | VALUE, interrupt vector size in bytes | devices/хххххх.spf |
| HAS_MUL? |   | VALUE, True is the device has mul instruction | devices/хххххх.spf |
| FALSE | ( -- 0 ) |  | xfbase.f |
| TRUE | ( -- -1 ) |  | xfbase.f |
| BL | ( -- 0x20 ) |  | xfbase.f |

### Program skeleton
It is mandatory to have the word `MAIN` in the program. In the simplest case, your program should look like this:

```forth
: MAIN

;
```

### Using defining words

Since AVR microcontrollers have as many as three address spaces (ROM, RAM, EEPROM), we had to create three sets of defining words for them.

#### Flash

`PCREATE, PDOES>` - equivalents for `CREATE, DOES>` that are used to make defining words in ROM. Example:

```forth
\ constant in ROM

:: ===
 PCREATE T,
 PDOES> @P ;
;;

0х1 === ONE

: TEST
  ONE +
;
```

Note: you need to use `::` , `;` and `;;`! After `PDOES>` use ROM reading words: `@P` or `C@P`.

Use TCREATE to make simle arrays in ROM:

```forth
TCREATE ROM

0x1 T, 0x2 T, 0x3 T, 0x4 T,

: TEST
  ROM 1 CELLS + P@
;
```

#### RAM

Use `CREATE`, `DOES>`, `ALLOT` as usual, for example:

```forth
:: VECTOR
  CREATE [F] 2* [P] ALLOT \ we need to use FORTH words for CREATE part
  DOES> SWAP CELLS + ; \ these are words from TARGET
;;

10 VECTOR X

: TEST
  1 3 VECTOR !
  3 VECTOR @
;
```

For an array in RAM use `RCREATE`:

```forth
RCREATE RAM5 0x5 ALLOT

: TEST
  RAM5 0x2 CHARS + C@
;
```

#### EEPROM

Use `ECREATE`, `EALLOT`. You can initialize EEPROM with `EC,`, `E,`,  `!E`, `C!E`:

```forth
ECREATE eeVAR   10 EALLOT
10 eeVAR !E

: TEST
  eeVAR 1+ C@E
;
```

All initialized values will go to `<project>.eep.hex` and `<project>.eep.bin` files

### Constants and variables

For constants use `==`, `2==`:

```forth
32 == BL
```

These constants will be compiled as literals and could be optimized. For creating a Forth constant use `FCONST`.

For variables in RAM and EEPROM use `VARIABLE`, `2VARIABLE`, `CVARIABLE` and `EVARIABLE`, `2EVARIABLE`, `CEVARIABLE`:

```forth
EVARIABLE eeVAR

СVARIABLE VAR

: TEST
  eeVAR E@ VAR C!
;
```

### Macros

Macros allow to include the code directly into the word:

```forth
: x2
  DUP *
;

MACRO: mx2
  DUP *
;MACRO

: TEST1
  x2 mx2
;

: TEST2
  x2 DUP *
;

\ TEST1 and TEST2 will be identical in the listing
```

Instead `[` и `]` in macros you should use `T[` and `]T`.

### IO ports

You can use three methods for this:

#### 1. Low level

There are constants for `PORTX`, `PINX`, `DDRX` in device files for each available IO port.

To read and write to these registers use `C@` and `C!`.

Also, there are words `SET`, `MASK`, `CLEAR` and `TOGGLE` which read a register, do some operation with the mask and write it back to the register, e.g.:

```forth
PORTB == BTN_PORT \ these are constants
DDRB  == BTN_DDR
PINB  == BTN_PIN

0x1 == BUTTON  \ PB1 - button is wired here

PORTD == LED_PORT
DDRD  == LED_DDR

0x4 == LED   \ PD4 - here is a LED

: MAIN
  BITS{ CS01 CS00 }BITS TCCR0 C!  \ set CS01 and CS00 in TCCR0 register, clear the rest
  LED BIT     LED_DDR SET        \ set PD4 for output (read from DDRD, set bit 4, write back)
  BUTTON BIT  BTN_DDR CLEAR      \ PB1 for input
  BUTTON BIT  BTN_PIN SET        \ pull-up

  BEGIN
    PINB C@ \ read a byte from PINB
    PORTD C! \ write in to PORTD
  AGAIN
;
```

#### 2. Middle level

There is a library `lib/ports.spf` with some abstractions for IO.

It defines words `{PORTX}`, which put these structures onto the data stack:

```forth
\ port structure

0x0
  CELL -- port
  CELL -- ddr
  CELL -- pin
DROP
```

Also, there are aliased for every port line `PXX`, like `PB0`, `PD7` etc... They put their mask and port structure onto the data stack.

Word `WIRE` can rename a port bit, and `GROUP{`, `}GROUP` can group these wires in a group. Only wires of **one port** can be grouped. A group also pushes its mask and port structure onto the stack.

```forth
PD7 WIRE POWER_LED         \ LED
PB0 WIRE BTN_POWER         \ buttons
PB1 WIRE BTN_UP
PB2 WIRE BTN_DOWN
PB3 WIRE BTN_OK
PB4 WIRE BTN_CANCEL

GROUP{ BTN_POWER BTN_UP BTN_DOWN BTN_OK BTN_CANCEL }GROUP BUTTONS
```

You can manipulate wires and groups with `{GET}`, `{SET}`, `{TOGGLE}`, `{CLEAR}`, `{OUTPUT}`, `{INPUT}`, `{PULL_UP}`, for example

```forth
  BUTTONS {INPUT}     \\ set BUTTONS group for input
  BUTTONS {PULL_UP}   \\ turn on pull-up resistors for BUTTONS

  POWER_LED {OUTPUT}  \\ set LED wire for output

  LED {TOGGLE}    \\ toggle the LED
  PD7 {TOGGLE}    \\ you can also do this
  LED {SET}       \\ set '1' for LED wire
  LED {CLEAR}     \\ set '0' for LED wire
  BTN_UP {GET}    \\ get the value from PINB and mask all the bits except the 1st
```

Words `{READ}` and `{WRITE}` read a byte from PIN and write a byte to PORT of a wire or group.

`PORT.READ` and `PORT.WRITE` read and write specified ports:

```forth
  {PINB} PORT.READ \ read PINB
  BUTTONS {READ}  \ or in this way
```

Here is the table of these words:

| Word | Stack comment (h: - host data stack) | Description |
| --- | --- | --- |
| {PORTA} .. {PORTF} | ( h: -- port_addr )<br>( -- ) | IO ports. Push the port structure address onto the data stack |
| PXX | ( h: -- mask port_addr )<br>( -- ) | Bits of IO ports. Push the mask and the port structure address onto the data stack |
| GROUP{ | ( h: -- -1 ) | Start the group definition |
| }GROUP name | ( h: -1 mask0 port0 mask1 port1 .. maskx portx -- )<br>execution ( h: -- mask port ) | End the group definition |
| +GROUP | ( h: mask0 port0 mask1 port1 -- mask port ) | Join two groups into one |
| -GROUP | ( h: mask0 port0 mask1 port1 -- mask port ) | Exclude bits of the second group from the firs group |
| WIRE name | ( h: mask port -- )<br>execution ( h: -- mask port ) | Define an alias for a bit of a port |
| {GROUP.PORT} | ( h: mask port -- port )<br>( -- port_reg ) | Compile the register of the group as a literal |
| {GROUP.MASK} | ( h: mask port -- port )<br>( -- mask ) | Compile the mask of the group as a literal |
| {GET} | ( h: mask port -- )<br>( – c ) | Read the PIN register and mask the bits |
| {SET} | ( h: mask port -- )<br>( -- ) | Set the group bits to '1' |
| {TOGGLE} | ( h: mask port -- )<br>( -- ) | Toggle the group bits |
| {CLEAR} | ( h: mask port -- )<br>( -- ) | Set the group bits to '0' |
| {OUTPUT} | ( h: mask port -- )<br>( -- ) | Set the group bits for output |
| {INPUT} | ( h: mask port -- )<br>( -- ) | Set the group bits for input |
| {PULL_UP} | ( h: mask port -- )<br>( -- ) | Turn on the pull-up resistors for the group bits |
| {READ} | ( h: mask port -- )<br>( – c ) | Read the PIN register of the group (not masked) |
| {WRITE} | ( h: mask port -- )<br>( c -- ) | Write the value to the PORT register of the group |
| PORT.READ | ( h: port -- )<br>( -- c ) | Read the PIN register of the port |
| PORT.WRITE | ( h: port -- )<br>( c -- ) | Write the value to the PORT register of the port

#### 3. High level

With the `lib/bus.spf` library.

The Middle level has its limitations:

- only bits from one physical port can be in a group.
- if you need to read/write data, you need to shift it manually. Let's say, you need to write a 2-bit value to `PD4,PD3`. In this case you will need to shift it before writing 3 bits left and after reading 3 bits right.

We will operate with a 'bus' as a group of wires of any IO ports in any order. Maximum bus width is 16 bit. You don't need to shift the data, it will happen automatically.

Buses do not take space of RAM or ROM.

Buses are extremely convenient. If you need to reattach the same 2-bit bus from 'PD4, PD3' to 'PB3, PC1', you just need to redefine the bus, the logic remains the same, because you don't need to shift the data manually anymore.

You can include same wires into different buses.

Buses are defined similar to groups:

```forth
\ bit 15  14  13  12  11  10   9   8   7   6   5   4   3   2   1   0

BUS{                         PC3 PD7 PD6 PD5 PD4 PD3 PC4 PB3 PB1 PB0 }BUS DATA1
BUS{                         PC3 PD7 PD6 PD5 PD4 PD3 PD2 PD1 PD0 PB2 }BUS CONTROL
BUS{     PB3 PB2 PB1 PB0 PB7 PB6 PB5 PB4 PC7 PC6 PC5 PC4 PC3 PC2 PC1 }BUS DATA2
BUS{                                 PC0 PC1 PC2 PC3 PC4 PC5 PC6 PC7 }BUS DATA3
BUS{                                                             PD7 }BUS DATA4
BUS{ PB7 PB6 PB5 PB4 PB3 PB2 PB1 PB0 PC7 PC6 PC5 PC4 PC3 PC2 PC1 PC0 }BUS DATA5
BUS{                                 PC7 PC6 PC5 PC4 PC3 PC2 PC1 PC0 }BUS DATA6
BUS{                         PD2 PC1 PC0 PB6 PB7 PD1 PD0 PB5 PB4 PB2 }BUS BUTTONS
```

When you write some value to the bus, its bits will be routed to their corresponding wires, e.g for the `CONTROL` bus bit 0 will go to `PB2`, bit 1 to `PD0` etc... The same conversion will take place after the reading the but. The compiler will try to generate optimal code, but it can be large if you mess up with the wires. Because of this you should place the write/read code into separate words to reuse it. If you write a constant to a bus, the code will be significantly smaller.

Examples:

```forth
DATA1 BUS.OUTPUT  \\ set the bus for output
BUTTONS BUS.INPUT  \\ set the bus for input
BUTTONS BUS.PULL_UP \\ pull-up resistors

0x00 DATA1 BUS.WRITE \\ write a constant

DATA6 BUS.READ DATA3 BUS.WRITE \\ read a bus and write the value to another bus
```

| Word | Stack comment (h: - host data stack) | Description |
| --- | --- | --- |
| BUS{ | ( h: -- -1 ) | Start the bus definition |
| }BUS name | ( h: -1 mask0 port0 mask1 port1 .. maskx portx -- )<br>execution ( h: --  ) | End the bus definition |
| BUS.WRITE | ( h: -- )<br>( w -- ) | Write the value to the bus (PORT register) |
| BUS.DDR.WRITE | ( h: -- )<br>( w -- ) | Write the value to the bus (DDR register) |
| BUS.INPUT | ( h: -- )<br>( -- ) | Set the bus wires for input |
| BUS.OUTPUT | ( h: -- )<br>( -- ) | Set the bus wires for output |
| BUS.PULL_UP | ( h: -- )<br>( -- ) | Turn on pull-up registers |
| BUS.SET | ( h: -- )<br>( -- ) | Output '1' to all the wires |
| BUS.CLEAR | ( h: -- )<br>( -- ) | Output '0' to all the wires |
| BUS.READ | ( h: -- )<br>( -- w ) | Read the value from the bus |

### AVR assembly

In all forth words you can use inline assembly. It is postfix, all the constants should be inside '[' and ']'. The order is:

```
src dst instruction
```

There are aliases for some important registers:

```forth
wl CONSTANT cntl
wh CONSTANT cnth
\ wh:wl - DO loop counter

r4 CONSTANT cbl
r5 CONSTANT cbh
\ r4:r5 - DO loop limit

r0 CONSTANT tmpl
r1 CONSTANT tmph
\ r0:r1 - temporary registers

xl CONSTANT tosl
xh CONSTANT tosh
\ xh:xl - value on top of the data stack
```

Other used registers:

```forth
\ yh:yl - pointer to the second topmost value on the data stack
\ zh:zl - temporary registers
\ sph:spl - return stack pointer
\ r16:r17 - temporary registers
\ r18:r19 - temporary registers
```

You can use all of the temporary registers.

There are also some useful macros:

| Macro | Description | Example |
| --- | --- | --- |
| (CALL) | Call a word, doesn't matter if it is a long or short call | `' OVER (CALL)` |
| (JMP) | Jump to an address, doesn't matter if it is a long or short jump | `' OVER (JMP)` |
| pushd | Push the register pair onto the 2nd element of the data stack, the TOS remains unchanged | `tmpl pushd` |
| popd | Pop the register pair from the 2nd element of the data stack, the TOS remains unchanged | `tmpl popd` |
| pushtmp | Push the temp register onto the 2nd element of the data stack, the TOS remains unchanged | `pushtmp` |
| poptmp | Pop the temp register from the 2nd element of the data stack, the TOS remains unchanged | `poptmp` |
| pusht | Push the TOS onto the 2nd element of the data stack, equivalent to DUP | `pusht` |
| popt | Pop the TOS from the the 2nd element of the data stack, equivalent to DROP | `popt` |
| pushw | Push the register pair onto the return stack | `r16 pushw` |
| popw | Pop the register pair ftom the return stack | `r16 popw` |
| _in | Read the port, depending on the port `in` or `lds` instructions are used | `PIND r16 _in` |
| _out | Read the port, depending on the port `out` or `sts` instructions are used | `r16 DDRD _out` |

Also there are some control flow commands in the assembly:

| Word | Description|
| --- | --- |
| if\_z<br>if\_<<br>if\_u<<br>if\_>=<br>if\_<0<br>if\_<>0<br>if\_c<br>then<br>else | Controller flags are used, TOS does not change<br>You can combine them with ELSE and THEN of Forth language |
| begin<br>again<br>while\_<>0<br>repeat<br>until\_<>0<br>until\_=0 | Controller flags are used, TOS does not change |
| for<br>\[register\] next | Register loop. Set the register value at the beginning, at the end it will be decremented and compared with 0, e.g.<br>`0x4 r16 ldi`<br>`clc`<br>`for`<br>`  -[x] tmpl ld`<br>`  -[z] tmph ld`<br>`  tmph tmpl adc`<br>`  tmpl [z] str`<br>`r16 next  \ 4 times`  |

### Interrupt handling

First create a handler with `INT:` or `ASMINT:`

`INT:` creates a Forth handler, all the used registers and SREG are saved, e.g.:

```forth
INT: TIMER
  SHOW_DIGIT
  RTOS_TIMER_SERVICE
;INT
```

`ASMINT:` creates a handler in assembly, only TOS and SREG are saved:

```forth
ASMINT: TIMER
  [ r18 inc ]
;ASMINT
```

Then you should assign the handler to the interrupt with `->INT` during compilation.

```forth
' TIMER ->INT TIMER0_OVF     \ set the timer0 overflow handler
```

### Optimization

The compiler optimizes the tail recursion.

If input values for some words are literals, it will also generate more compact code:

- `C@` - if the address is a literal, optimized code is generated
- `C!` - value or address are literals. 'out' instruction is used if possible.
- `AND`, `OR`, `XOR` - one literal.
- `+`, `-` - one literal, `adiw`, `sbiw` are used.
- `SET`, `CLEAR`, `TOGGLE`, `MASK` - two literals, `sbi`, `cbi` are used if possible.
- `BIT` - one literal.
- `DROP` + a litetal.
- `DO`, `?DO` - one or two literals.
- `+LOOP` - one literal.
- Words from `lib/ports.spf`, `lib/bus.spf` are also optimized.

### Debug messages

So-called debugging levels are introduced to facilitate debugging during compilation and program execution:

- level 0: debugging messages are disabled
- level 1: debugging messages of level 1 are enabled
- level 2: debugging messages of levels 1 and 2 are enabled
- level 3: debug messages of levels 1, 2 and 3 are enabled.

Level 3 outputs optimizer messages (there can be many of them).

Debugging levels are specified by the words `-DEBUG`, `+DEBUG` (equivalent to `+DEBUG1`), `+DEBUG1`, `+DEBUG2`, `+DEBUG3`, which disable debugging or enable the corresponding debug message output levels.


#### Using debug conditions

Use `[IFDEBUG] | [IFDEBUG1] | [IFDEBUG2] | [IFDEBUG3] … [ELSE] … [THEN]`.

```forth
: TST
  [IFDEBUG]
    1200 BAUD USART_INIT
  [THEN]
  …
;
```

Here if debugging is on, USART is initialized, otherwise the initialization code will not be compiled.

#### Using in macros

Macros are FORTH words, so you need to use them like this: `[IFDEBUG] | [IFDEBUG1] | [IFDEBUG2] | [IFDEBUG3]  … ELSE … [THEN]`. Take a look at `ELSE` instead of `[ELSE]`.

`[IFDEBUG]` is compiled as `IF`, so the debugging level will be checked every time the macro is executed.

Words `DEBUG"`, `DEBUG1"`, `DEBUG2"`, `DEBUG3"` print messages if debugging level fits:

```forth
: CELLS HAS CELLS  ( x1 -- x2 )           \   ( multiply by cell size)
[F]
  QLIT1? IF
    DEBUG3" CELLS" \ print the message if the level is 3
    2\* (LIT)
  ELSE
    tosl lsl
    tosh rol
    EOPT
  THEN
[P]
;
```

### Notes

1. Since AVRForth is a cross-translator, inside all your definitions (high-level and assembly) there is no compilation mode used, only interpretation, i.e. `STATE` is always 0. At the same time, the `T-STATE` variable indicates whether words will be compiled into target memory. Some words depend on the state of `T-STATE`. Using target  definitions in interpretation mode results in an error.
2. You can require -1, 0, 1, 2, which save ROM because they are not formatted as literals but as individual words. Because of that, you cannot use these words not in the target compilation mode: `: TEST 0 1 + ;` will work, but `DEVICE 0 = [IF] ... [THEN]` will not, since `0` will generate an error. To eliminate this effect, use `0x0` or `00` instead of `0`. You can also use `00` if you know that the next word is optimized to use literals.
3. Numbers are compiled as literals (in target compilation mode), so in inline assembly, frame the numbers (or the entire code) with square brackets: `[ 0x1 ] tosl adiw` or `[ 0x1 tosl adiw ]`.
4. A useful word \\\\ allows you to include comments in the listing.
5. Only the TARGET dictionary is available at compile time. To use words from the `FORTH` dictionary, do this: `[F] bla bla [P]`. <br>The words `[F]` and `[P]` are immediate.

Some words from the Forth dictionary are overridden in TARGET:
 - `[[` (instead of `[`),
 - `]]` (instead of `]`),
 - `::` (instead of `:`),
 - `;;` (instead of `;`),
 - `INCLUDED`, `REQUIRE`, `\EOF`, `CHAR`, `FCONST` (вместо `CONSTANT`),
 - `.S`, `ORDER`, `\`, `(`, `TO`, `S"`, `[IF]`, `[ELSE]`, `[THEN]`

## 4. Libraries

You can include libraries with `REQUIRE`:

```forth
REQUIRE MS lib/delay.spf
```

### lib/delay.spf

Delays

Before inclusion set the CPU frequency:

```forth
8000000 ( Hz ) == F_CPU

REQUIRE MS lib/delay.spf
```

Usage:

| Word | Comment | Description |
| --- | --- | --- |
| MS | ( n -- ) | Delay for n ms |
| US | ( us -- ) | Delay for us microseconds, us is a literal |

### lib/i2c.spf

Реализация аппаратного интерфейса I2C/TWI

Подключение:

```forth
REQUIRE I2C_START lib/i2c.spf
```

Использование:

| Слово | Стековый комментарий | Описание|
| --- | --- | --- |
| I2C_INIT | ( -- ) | Инициализация интерфейса |
| I2C_START | ( address -- err ) | Послать стартовую посылку устройству с выбранным адресом. Возвращает 0 — все ок, -1 — ошибка |
| I2C_STOP | ( -- ) | Послать стоповую посылку |
| I2C_WRITE | ( data -- err ) | Послать байт. Возвращает 0 — все ок, 1 — ошибка |
| I2C\_READ_ACK | ( -- byte ) | Прочитать байт, запросить следующую порцию данных. |
| I2C\_READ_NAK | ( -- byte ) | Прочитать байт, окончить передачу. |

### ds1307.spf

Общение с контроллером ds1307 по аппаратному I2C

Подключение:

```forth
REQUIRE DS1307      lib/ds1307.spf
```

Использование:

| Слово | Стековый комментарий | Описание|
| --- | --- | --- |
| DS1307_INIT | ( -- 0 / -1 ) | Проверка наличия подключенной микросхемы, инициализация. Возвращает 0 — есть, -1 - нет |
| DS1307_GET | ( reg -- value ) | Получить значение регистра, например `DS1307_Weekday DS1307_GET` |
| DS1307_SET | ( value reg -- ) | Установить значение регистра |
| DS1307\_GET_TIME | ( -- s m h ) | Прочитать время |
| DS1307\_SET_TIME | ( h m s -- ) | Записать время |
| DS1307\_GET_DATE | ( -- d m y ) | Прочитать дату |
| DS1307\_SET_DATE | ( y m d -- ) | Записать дату |

### eertos.spf

Простой диспетчер задач. Основан на диспетчере DiHALTa (easyelectronics.ru)

Суть в том, чтобы иметь возможность запускать задания по таймеру через некоторое количество тиков. В качестве задания может выступать любое двоеточечное определение форта. По умолчанию один тик равен 1 мс. В прерывании таймера уменьшаются счетчики каждой задачи. В основном цикле менеджер задач проверяет, есть ли задачи, у которых счетчик достиг 0 и запускает их.

Подключение (обязательно задайте частоту контроллера):

```forth
8000000 ( Hz ) == F_CPU

REQUIRE RTOS_INIT   lib/eertos.spf
```

Использование:

| Слово | Стековый комментарий | Описание|
| --- | --- | --- |
| RTOS_INIT | ( -- ) | Инициализация диспетчера |
| RTOS_RUN | ( -- ) | Запуск диспетчера |
| RTOS\_SET\_TIMER_TASK | ( task time -- ) | Поставить задачу в очередь на выполнение через time тиков. Пример: `['] GET_TIME 250 RTOS_SET_TIMER_TASK \ через 250 мс` |
| RTOS\_SET_TASK | ( task -- ) | Поставить задачу в очередь на выполнение немедленно |
| RTOS\_REMOVE_TASK | ( task -- ) | Удалить задачу из очереди |
| RTOS\_TASK_MANAGER | ( -- ) | Менеджер задач. Необходимо вызывать в цикле главной процедуры. Именно из него задачи вызываются на выполнение. |
| RTOS\_TIMER_SERVICE | ( -- ) | Служба таймеров диспетчера. Вызывается из прерывания по таймеру. |
| RTOS_INT | ( -- ) | Обработчик прерывания по таймеру. |

Пример использования:

```forth
8000000 ( Hz ) == F_CPU

\ определения портов

PORTD == LEDS_PORT
  07  == LED
DDRD  == LEDS_DDR

REQUIRE RTOS_INIT   lib/eertos.spf

: LED_ON
LED BIT  LEDS_PORT CLEAR
;

: LED_OFF
  LED BIT  LEDS_PORT SET
;

: BLINK         \ мигнуть светодиодом на 100 мс
  LED_ON
  ['] LED_OFF 100 RTOS_SET_TIMER_TASK \ выключить светодиод через 100 мс
  ['] BLINK   200 RTOS_SET_TIMER_TASK \ включить через 200 мс и повторить
;

: INIT
  LED BIT  LEDS_DDR SET
  RTOS_INIT
  ['] BLINK RTOS_SET_TASK \ поставить задачу в очередь на выполнение
  RTOS_RUN \ поехали!
;

: MAIN
  INIT
  BEGIN
    RTOS_TASK_MANAGER \ здесь и будут выполнятся задания
  AGAIN
;
```

### buttons.spf

Опрос кнопок, подключенных к одному порту, с подавлением дребезга и автоповтором

Подключение:

```forth
REQUIRE DEBOUNCE    lib/buttons.spf
```

Использование:

1. Перед подключением нужно определить группу BUTTONS:

```forth
PB0 WIRE BTN_SET              \  кнопки
PB1 WIRE BTN_+
PB2 WIRE BTN_-

GROUP{ BTN_SET BTN_+ BTN_- }GROUP BUTTONS
```

2. Затем определить слова, которые будут выполняться при нажатии каждой кнопки:

```forth
: BTN0_TASK … ;
: BTN1_TASK … ;
: BTN2_TASK … ;
```

3. Выделить область в памяти для адресов этих задач. Первая задача — для кнопки, подключенной к 0-й линии порта, вторая — к 1-й и т.д.

```forth
TCREATE BTN_TASKS           \ задачи для кнопок

' BTN0_TASK T,   ' BTN1_TASK T,   ' BTN2_TASK T,
```

4. В инициализирующем коде нужно включить нужные кнопки:

```forth
BUTTONS {GROUP.MASK} BUTTONS_ENABLED C!                      \ все кнопки вкл
```

5. задать кнопки с автоповтором:

```forth
[BUTTONS BTN_SET -GROUP {GROUP.MASK}] LITERAL \ эта кнопка не повторяет нажатия
  BUTTONS_REPEATABLE C!
```

6. установить задачи, выполняющиеся при нажатии кнопок:

```forth
BTN_TASKS BUTTONS_TASKS !                       \ задачи для кнопок
```

7. инициализировать порт, к которому подключены кнопки

```forth
BUTTONS_INIT                                    \ инициализация порта
```

8. и поставить на выполнение задачу-обработчик нажатий:

```forth
['] BUTTONS_TASK RTOS_SET_TASK                  \ обработчик кнопок
```

См.код примера tst_buttons.spf

### lcd.spf

Подключение LCD-дисплея с контроллером HD44780 по 4-битному интерфейсу.

Подключение:

Перед подключением библиотеки нужно указать заранее, как подключается дисплей физически:

```forth
PD3 WIRE D3
PD2 WIRE D2
PD1 WIRE D1
PD0 WIRE D0
BUS{ D3 D2 D1 D0 }BUS DATA
PD4 WIRE RS           \ RS WIRE
PD5 WIRE RW           \ RW WIRE
PD6 WIRE E            \ E WIRE
```

```forth
REQUIRE LCD_CLRSCR      lib/lcd/lcd.spf          \ библиотеки LCD
REQUIRE LCD_CHAR        lib/lcd/definechar.spf   \ определение пользовательских символов

:: !BIG_LETTERS ;;
REQUIRE BIG_SETUP       lib/lcd/big.spf          \ большие символы
```

Использование:

После подключения библиотеки дисплей нужно инициализировать словом LCD_INIT, после чего весь вывод через EMIT и TYPE, AT, PAGE будет идти на дисплей.

Если вы хотите использовать большие символы, подключите lib/lcd/big.spf, если перед этим было определено слово !BIG_LETTERS, то в код кроме цифр включаются еще и большие английские литеры.

Необходимые слова вынесены в таблицу.

| Слово | Стековый комментарий | Описание|
| --- | --- | --- |
| LCD_INIT | ( dispAttr -- ) | Инициализация дисплея dispAttr може быть таким:<br>- LCD\_DISP\_OFF — дисплей выключен<br>- LCD\_DISP\_ON — дисплей включен, курсор выключен<br>- LCD\_DISP\_ON\_CURSOR — дисплей включен, курсор включен<br>- LCD\_DISP\_CURSOR\_BLINK — дисплей включен, курсор включен и мигает |
| LCD_COMMAND | ( с -- ) | Послать команду |
| LCD_DATA | ( с -- ) | Послать данные (вывести символ с кодом с) |
| LCD_GOTOXY | ( х у -- ) | Установить позицию курсора |
| LCD_GETXY | ( -- addr ) | Получить текущий адрес |
| LCD_CHAR name | ( b0 .. b7 -- )<br>исполнение:( с -- ) | Определить символ с кодом с<br>Пример использования:<br>`0x00 0x10 0x08 0x04 0x02 0x01 0x00 0x00  LCD_CHAR  BACKSLASH`<br>после `LCD_INIT`<br>`0x1 BACKSLASH \ определить символ с кодом 1`<br>`0x1 EMIT      \ вывод символа` |
| BIG_SETUP | ( -- ) | Инициализировать символы для больших цифр/букв |
| BIG_LETTERS | ( -- ) | Переключиться на вывод больших символов |
| NORMAL_LETTERS | ( -- ) | Переключиться на вывод обычных символов |

Также см. код примеров tst_lcd.spf и big_test.spf

### wdt.spf, не закончена

TODO:

полное описание

### usart.spf

Простой вывод данных в USART без использования прерываний.

Подключение:

```forth
S" lib/usart.spf" INCLUDED
```

Использование:

| Слово | Стековый комментарий | Описание|
| --- | --- | --- |
| USART_INIT | ( ubrr -- ) | Инициализировать передатчик, установить `EMIT` на вывод в USART. Скорость задается при помощи слова `BAUD` |
| BAUD | ( speed -- ubrr ) | Преобразовать скорость в константу, только для компиляции. См. пример |
| USART_SEND | ( с -- ) | Передает символ |
| USART1_INIT | ( ubrr -- ) | Инициализирует второй USART (если есть), установить `EMIT` на вывод в USART |
| USART1_SEND | ( с -- ) | Передает символ во второй USART (если есть) |

Перед подключением обязательно задайте частоту контроллера `F_CPU`. По умолчанию при подключении библиотеки вектор `EMIT` настраивается на `USART_SEND`.

Пример:

```forth
1000000 ( Hz ) == F_CPU

S" lib/usart.spf" INCLUDED

: MAIN
  1200 BAUD USART_INIT
  ." Test" CR
;
```

### encoder.spf

Не закончена TODO

### lcd_menu

Не закончена TODO


## 5. Описание каталогов и файлов

| Файл | Описание |
| --- | --- |
| devices/devices.spf | Файл с константами типов микроконтроллеров |
| devices/\*.spf | Файлы с определениями микроконтроллеров |
| kernel/\*.spf | Ядро |
| lib/\*.spf | Библиотеки для AVR |
| avrforth.spf | Собственно форт |
| src/lib/\*.spf | Библиотеки форта |
| src/avrasm.spf | Ассемблер |
| src/avrdisasm.spf | Дизассемблер |
| src/avrlist.spf | Генерация листинга |
| src/flash.spf | Целевая компиляция |
| src/hex.spf | Запись образа в hex-формате |
| src/init.spf | Инициализация контроллера |
| src/inline.spf | Управляющие структуры и макросы |
| src/isr.spf | Прерывания |
| src/require.cfg | Файл конфигурации для подключения нужных слов |
| src/require.spf | Подключение нужных слов |
| src/xfbase.f | Определяющие слова |
| src/util.spf | Разные слова |
| examples/* | Program examples that use different libraries and more |

## 6. Файлы определений микроконтроллеров

См. любой из файлов device/\*.spf - там есть комментарии.
