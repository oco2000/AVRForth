EESchema Schematic File Version 4
LIBS:tembr-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega8A-PU U1
U 1 1 5A02BEA1
P 4550 3150
F 0 "U1" H 3800 4450 50  0000 L BNN
F 1 "ATMEGA8A-PU" H 5050 1700 50  0000 L BNN
F 2 "Package_DIP:DIP-28_W7.62mm_LongPads" H 4550 3150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Microchip%208bit%20mcu%20AVR%20ATmega8A%20data%20sheet%2040001974A.pdf" H 4550 3150 50  0001 C CNN
	1    4550 3150
	1    0    0    -1  
$EndComp
Entry Wire Line
	6100 2050 6200 2150
Entry Wire Line
	6100 2150 6200 2250
Entry Wire Line
	6100 3150 6200 3250
Entry Wire Line
	6100 3250 6200 3350
Entry Wire Line
	6100 2750 6200 2850
Entry Wire Line
	6100 2850 6200 2950
Text Label 5700 3650 0    60   ~ 0
IRint
Text Label 5700 2050 0    60   ~ 0
BTN0
Text Label 5700 2150 0    60   ~ 0
BTN1
Text Label 5700 3150 0    60   ~ 0
SDA
Text Label 5700 3250 0    60   ~ 0
SCL
Text Label 8550 2400 0    60   ~ 0
GND
$Comp
L power:GND #PWR01
U 1 1 5A02C982
P 4550 4850
F 0 "#PWR01" H 4550 4600 50  0001 C CNN
F 1 "GND" H 4550 4700 50  0000 C CNN
F 2 "" H 4550 4850 50  0001 C CNN
F 3 "" H 4550 4850 50  0001 C CNN
	1    4550 4850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5A02CA46
P 4550 1500
F 0 "#PWR02" H 4550 1350 50  0001 C CNN
F 1 "VCC" H 4550 1650 50  0000 C CNN
F 2 "" H 4550 1500 50  0001 C CNN
F 3 "" H 4550 1500 50  0001 C CNN
	1    4550 1500
	1    0    0    -1  
$EndComp
$Comp
L Timer_RTC:DS1307ZN+ U2
U 1 1 5A02D3C5
P 7350 3150
F 0 "U2" H 7620 3700 50  0000 C CNN
F 1 "DS1307+" H 7650 2600 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7350 3150 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1307.pdf" H 7350 3150 50  0001 C CNN
	1    7350 3150
	1    0    0    -1  
$EndComp
Entry Wire Line
	6200 3050 6300 2950
Entry Wire Line
	6200 3150 6300 3050
$Comp
L power:VCC #PWR04
U 1 1 5A02D6E5
P 7250 2600
F 0 "#PWR04" H 7250 2450 50  0001 C CNN
F 1 "VCC" H 7250 2750 50  0000 C CNN
F 2 "" H 7250 2600 50  0001 C CNN
F 3 "" H 7250 2600 50  0001 C CNN
	1    7250 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5A02D705
P 7350 3850
F 0 "#PWR05" H 7350 3600 50  0001 C CNN
F 1 "GND" H 7350 3700 50  0000 C CNN
F 2 "" H 7350 3850 50  0001 C CNN
F 3 "" H 7350 3850 50  0001 C CNN
	1    7350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5A02D75A
P 8050 2700
F 0 "#PWR06" H 8050 2450 50  0001 C CNN
F 1 "GND" H 8050 2550 50  0000 C CNN
F 2 "" H 8050 2700 50  0001 C CNN
F 3 "" H 8050 2700 50  0001 C CNN
	1    8050 2700
	1    0    0    -1  
$EndComp
Text Label 6550 2950 2    60   ~ 0
SCL
Text Label 6550 3050 2    60   ~ 0
SDA
Entry Wire Line
	7100 1900 7200 1800
Entry Wire Line
	7300 1900 7400 1800
$Comp
L Device:R R5
U 1 1 5A02D99E
P 7400 1500
F 0 "R5" V 7480 1500 50  0000 C CNN
F 1 "10k" V 7400 1500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7330 1500 50  0001 C CNN
F 3 "~" H 7400 1500 50  0001 C CNN
	1    7400 1500
	1    0    0    -1  
$EndComp
Text Label 7200 1800 1    60   ~ 0
SCL
Text Label 7400 1800 1    60   ~ 0
SDA
$Comp
L Regulator_Linear:L7809 U3
U 1 1 5A02E7DE
P 11650 4000
F 0 "U3" H 11450 4200 50  0000 C CNN
F 1 "LM7809CT" H 11650 4200 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 11650 4100 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 11650 4000 50  0001 C CNN
	1    11650 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C4
U 1 1 5A02E9EB
P 11200 4150
F 0 "C4" H 11210 4220 50  0000 L CNN
F 1 "100uF" H 11210 4070 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 11200 4150 50  0001 C CNN
F 3 "~" H 11200 4150 50  0001 C CNN
	1    11200 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 5A02EA20
P 12050 4150
F 0 "C5" H 12060 4220 50  0000 L CNN
F 1 "100uF" H 12060 4070 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12050 4150 50  0001 C CNN
F 3 "~" H 12050 4150 50  0001 C CNN
	1    12050 4150
	1    0    0    -1  
$EndComp
Text Label 12300 4000 2    60   ~ 0
+9V
$Comp
L tembr:TDA7313 U4
U 1 1 5A02EE35
P 12100 6350
F 0 "U4" H 11350 7650 50  0000 L BNN
F 1 "TDA7313" H 12600 4900 50  0000 L BNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 12100 6350 50  0001 C CIN
F 3 "" H 12100 6350 50  0001 C CNN
	1    12100 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR07
U 1 1 5A030CB4
P 11650 4450
F 0 "#PWR07" H 11650 4200 50  0001 C CNN
F 1 "GNDA" H 11650 4300 50  0000 C CNN
F 2 "" H 11650 4450 50  0001 C CNN
F 3 "" H 11650 4450 50  0001 C CNN
	1    11650 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5A03190C
P 11150 7450
F 0 "#PWR08" H 11150 7200 50  0001 C CNN
F 1 "GND" H 11150 7300 50  0000 C CNN
F 2 "" H 11150 7450 50  0001 C CNN
F 3 "" H 11150 7450 50  0001 C CNN
	1    11150 7450
	1    0    0    -1  
$EndComp
Text Label 10700 7150 0    60   ~ 0
SCL
Text Label 10700 7250 0    60   ~ 0
SDA
$Comp
L Device:CP_Small C7
U 1 1 5A032447
P 10700 5250
F 0 "C7" H 10710 5320 50  0000 L CNN
F 1 "2.2uF" H 10710 5170 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10700 5250 50  0001 C CNN
F 3 "~" H 10700 5250 50  0001 C CNN
	1    10700 5250
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C10
U 1 1 5A032556
P 10950 5650
F 0 "C10" H 10960 5720 50  0000 L CNN
F 1 "2.2uF" H 10960 5570 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10950 5650 50  0001 C CNN
F 3 "~" H 10950 5650 50  0001 C CNN
	1    10950 5650
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C8
U 1 1 5A03277C
P 10950 5350
F 0 "C8" H 10960 5420 50  0000 L CNN
F 1 "2.2uF" H 10960 5270 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10950 5350 50  0001 C CNN
F 3 "~" H 10950 5350 50  0001 C CNN
	1    10950 5350
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C9
U 1 1 5A0327D9
P 10700 5550
F 0 "C9" H 10710 5620 50  0000 L CNN
F 1 "2.2uF" H 10710 5470 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10700 5550 50  0001 C CNN
F 3 "~" H 10700 5550 50  0001 C CNN
	1    10700 5550
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C12
U 1 1 5A032883
P 11000 5950
F 0 "C12" H 11010 6020 50  0000 L CNN
F 1 "2.2uF" H 11010 5870 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 11000 5950 50  0001 C CNN
F 3 "~" H 11000 5950 50  0001 C CNN
	1    11000 5950
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C11
U 1 1 5A0328E6
P 10700 5850
F 0 "C11" H 10710 5920 50  0000 L CNN
F 1 "2.2uF" H 10710 5770 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10700 5850 50  0001 C CNN
F 3 "~" H 10700 5850 50  0001 C CNN
	1    10700 5850
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5A032930
P 13300 6550
F 0 "C13" H 13310 6620 50  0000 L CNN
F 1 "100nF" H 13310 6470 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13300 6550 50  0001 C CNN
F 3 "~" H 13300 6550 50  0001 C CNN
	1    13300 6550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5A032C27
P 13550 6650
F 0 "C15" H 13560 6720 50  0000 L CNN
F 1 "100nF" H 13560 6570 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13550 6650 50  0001 C CNN
F 3 "~" H 13550 6650 50  0001 C CNN
	1    13550 6650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5A032C8D
P 13300 6850
F 0 "C16" H 13310 6920 50  0000 L CNN
F 1 "100nF" H 13310 6770 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13300 6850 50  0001 C CNN
F 3 "~" H 13300 6850 50  0001 C CNN
	1    13300 6850
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5A032D14
P 13550 6950
F 0 "C18" H 13560 7020 50  0000 L CNN
F 1 "100nF" H 13560 6870 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13550 6950 50  0001 C CNN
F 3 "~" H 13550 6950 50  0001 C CNN
	1    13550 6950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5A032D84
P 13300 7150
F 0 "C19" H 13310 7220 50  0000 L CNN
F 1 "100nF" H 13310 7070 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13300 7150 50  0001 C CNN
F 3 "~" H 13300 7150 50  0001 C CNN
	1    13300 7150
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C20
U 1 1 5A032E0B
P 13550 7250
F 0 "C20" H 13560 7320 50  0000 L CNN
F 1 "100nF" H 13560 7170 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13550 7250 50  0001 C CNN
F 3 "~" H 13550 7250 50  0001 C CNN
	1    13550 7250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C21
U 1 1 5A032E7D
P 13300 7400
F 0 "C21" H 13310 7470 50  0000 L CNN
F 1 "2.7nF" H 13310 7320 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13300 7400 50  0001 C CNN
F 3 "~" H 13300 7400 50  0001 C CNN
	1    13300 7400
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C22
U 1 1 5A032F3B
P 13550 7500
F 0 "C22" H 13560 7570 50  0000 L CNN
F 1 "2.7nF" H 13560 7420 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 13550 7500 50  0001 C CNN
F 3 "~" H 13550 7500 50  0001 C CNN
	1    13550 7500
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5A032F99
P 13850 6900
F 0 "R8" V 13930 6900 50  0000 C CNN
F 1 "5.5k" V 13850 6900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 13780 6900 50  0001 C CNN
F 3 "~" H 13850 6900 50  0001 C CNN
	1    13850 6900
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5A03302C
P 13850 7200
F 0 "R10" V 13930 7200 50  0000 C CNN
F 1 "5.5k" V 13850 7200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 13780 7200 50  0001 C CNN
F 3 "~" H 13850 7200 50  0001 C CNN
	1    13850 7200
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C14
U 1 1 5A0330B1
P 11000 6650
F 0 "C14" H 11010 6720 50  0000 L CNN
F 1 "2.2uF" H 11010 6570 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 11000 6650 50  0001 C CNN
F 3 "~" H 11000 6650 50  0001 C CNN
	1    11000 6650
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C17
U 1 1 5A0331CD
P 11000 6950
F 0 "C17" H 11010 7020 50  0000 L CNN
F 1 "2.2uF" H 11010 6870 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 11000 6950 50  0001 C CNN
F 3 "~" H 11000 6950 50  0001 C CNN
	1    11000 6950
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR09
U 1 1 5A033BC6
P 14150 7650
F 0 "#PWR09" H 14150 7400 50  0001 C CNN
F 1 "GNDA" H 14150 7500 50  0000 C CNN
F 2 "" H 14150 7650 50  0001 C CNN
F 3 "" H 14150 7650 50  0001 C CNN
	1    14150 7650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR010
U 1 1 5A033C20
P 12100 8250
F 0 "#PWR010" H 12100 8000 50  0001 C CNN
F 1 "GNDA" H 12100 8100 50  0000 C CNN
F 2 "" H 12100 8250 50  0001 C CNN
F 3 "" H 12100 8250 50  0001 C CNN
	1    12100 8250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C23
U 1 1 5A033CC0
P 12250 8050
F 0 "C23" H 12260 8120 50  0000 L CNN
F 1 "2.2uF" H 12260 7970 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12250 8050 50  0001 C CNN
F 3 "~" H 12250 8050 50  0001 C CNN
	1    12250 8050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J6
U 1 1 5A035898
P 10100 5550
F 0 "J6" H 10100 5950 50  0000 C CNN
F 1 "CONN_01X07" V 10200 5550 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x07_P2.00mm_Vertical" H 10100 5550 50  0001 C CNN
F 3 "~" H 10100 5550 50  0001 C CNN
	1    10100 5550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5A0359FA
P 13600 5350
F 0 "J5" H 13600 5550 50  0000 C CNN
F 1 "CONN_01X03" V 13700 5350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 13600 5350 50  0001 C CNN
F 3 "~" H 13600 5350 50  0001 C CNN
	1    13600 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR011
U 1 1 5A036037
P 10300 6050
F 0 "#PWR011" H 10300 5800 50  0001 C CNN
F 1 "GNDA" H 10300 5900 50  0000 C CNN
F 2 "" H 10300 6050 50  0001 C CNN
F 3 "" H 10300 6050 50  0001 C CNN
	1    10300 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR012
U 1 1 5A036097
P 13400 5600
F 0 "#PWR012" H 13400 5350 50  0001 C CNN
F 1 "GNDA" H 13400 5450 50  0000 C CNN
F 2 "" H 13400 5600 50  0001 C CNN
F 3 "" H 13400 5600 50  0001 C CNN
	1    13400 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5A030773
P 7900 950
F 0 "R2" V 7980 950 50  0000 C CNN
F 1 "10k" V 7900 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7830 950 50  0001 C CNN
F 3 "~" H 7900 950 50  0001 C CNN
	1    7900 950 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR013
U 1 1 5A03082D
P 7900 700
F 0 "#PWR013" H 7900 550 50  0001 C CNN
F 1 "VCC" H 7900 850 50  0000 C CNN
F 2 "" H 7900 700 50  0001 C CNN
F 3 "" H 7900 700 50  0001 C CNN
	1    7900 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5A0319D5
P 7900 1700
F 0 "#PWR014" H 7900 1450 50  0001 C CNN
F 1 "GND" H 7900 1550 50  0000 C CNN
F 2 "" H 7900 1700 50  0001 C CNN
F 3 "" H 7900 1700 50  0001 C CNN
	1    7900 1700
	1    0    0    -1  
$EndComp
Entry Wire Line
	7600 1900 7700 1800
Text Label 7700 1800 1    60   ~ 0
Reset
$Comp
L Device:Rotary_Encoder_Switch SW1
U 1 1 5A033611
P 3150 7950
F 0 "SW1" H 3150 8210 50  0000 C CNN
F 1 "Rotary_Encoder" H 3150 7690 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC11E-Switch_Vertical_H20mm" H 3050 8110 50  0001 C CNN
F 3 "~" H 3150 8210 50  0001 C CNN
	1    3150 7950
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push_Dual SW2
U 1 1 5A033956
P 3150 4950
F 0 "SW2" H 3200 5050 50  0000 L CNN
F 1 "SW_Push_Dual" H 3150 4680 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3150 5150 50  0001 C CNN
F 3 "~" H 3150 5150 50  0001 C CNN
	1    3150 4950
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW5
U 1 1 5A0339ED
P 3150 6550
F 0 "SW5" H 3200 6650 50  0000 L CNN
F 1 "SW_Push_Dual" H 3150 6280 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3150 6750 50  0001 C CNN
F 3 "~" H 3150 6750 50  0001 C CNN
	1    3150 6550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW4
U 1 1 5A033AE6
P 3150 6000
F 0 "SW4" H 3200 6100 50  0000 L CNN
F 1 "SW_Push_Dual" H 3150 5730 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3150 6200 50  0001 C CNN
F 3 "~" H 3150 6200 50  0001 C CNN
	1    3150 6000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW3
U 1 1 5A040232
P 3150 5500
F 0 "SW3" H 3200 5600 50  0000 L CNN
F 1 "SW_Push_Dual" H 3150 5230 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3150 5700 50  0001 C CNN
F 3 "~" H 3150 5700 50  0001 C CNN
	1    3150 5500
	1    0    0    -1  
$EndComp
Text Label 5700 2750 0    60   ~ 0
ENC0
Text Label 5700 2850 0    60   ~ 0
ENC1
Entry Wire Line
	6200 5600 6300 5500
Entry Wire Line
	6200 5400 6300 5300
Entry Wire Line
	6200 5500 6300 5400
Entry Wire Line
	6200 5700 6300 5600
$Comp
L power:GND #PWR015
U 1 1 5A037A5C
P 7650 5000
F 0 "#PWR015" H 7650 4750 50  0001 C CNN
F 1 "GND" H 7650 4850 50  0000 C CNN
F 2 "" H 7650 5000 50  0001 C CNN
F 3 "" H 7650 5000 50  0001 C CNN
	1    7650 5000
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR016
U 1 1 5A03820B
P 7650 6100
F 0 "#PWR016" H 7650 5950 50  0001 C CNN
F 1 "VCC" H 7650 6250 50  0000 C CNN
F 2 "" H 7650 6100 50  0001 C CNN
F 3 "" H 7650 6100 50  0001 C CNN
	1    7650 6100
	-1   0    0    1   
$EndComp
Text Label 6300 5500 0    60   ~ 0
BTN3_MOSI
Text Label 6300 5300 0    60   ~ 0
Reset
Text Label 6300 5600 0    60   ~ 0
PowerBTN_MISO
Entry Wire Line
	6100 6300 6200 6400
Entry Wire Line
	6100 6400 6200 6500
Entry Wire Line
	6100 6500 6200 6600
Entry Wire Line
	6100 6600 6200 6700
Entry Wire Line
	6100 6200 6200 6300
Text Label 5750 6300 0    60   ~ 0
BTN3_MOSI
Text Label 5900 6400 0    60   ~ 0
BTN2
Text Label 5900 6500 0    60   ~ 0
BTN1
Text Label 5900 6600 0    60   ~ 0
BTN0
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 5A0984D8
P 7450 6650
F 0 "J7" H 7450 6800 50  0000 C CNN
F 1 "CONN_01X02" V 7550 6650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7450 6650 50  0001 C CNN
F 3 "~" H 7450 6650 50  0001 C CNN
	1    7450 6650
	1    0    0    -1  
$EndComp
Entry Wire Line
	6200 7200 6300 7100
$Comp
L Device:R R9
U 1 1 5A0995ED
P 6700 7100
F 0 "R9" V 6780 7100 50  0000 C CNN
F 1 "3k" V 6700 7100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6630 7100 50  0001 C CNN
F 3 "~" H 6700 7100 50  0001 C CNN
	1    6700 7100
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 5A099811
P 7150 7100
F 0 "Q1" H 7350 7150 50  0000 L CNN
F 1 "." H 7350 7050 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 7350 7200 50  0001 C CNN
F 3 "~" H 7150 7100 50  0001 C CNN
	1    7150 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5A099983
P 6950 6700
F 0 "D1" H 6950 6800 50  0000 C CNN
F 1 "D" H 6950 6600 50  0000 C CNN
F 2 "Diode_THT:D_T-1_P10.16mm_Horizontal" H 6950 6700 50  0001 C CNN
F 3 "~" H 6950 6700 50  0001 C CNN
	1    6950 6700
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR018
U 1 1 5A099D6A
P 7250 6450
F 0 "#PWR018" H 7250 6300 50  0001 C CNN
F 1 "VCC" H 7250 6600 50  0000 C CNN
F 2 "" H 7250 6450 50  0001 C CNN
F 3 "" H 7250 6450 50  0001 C CNN
	1    7250 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5A09A220
P 7250 7450
F 0 "#PWR019" H 7250 7200 50  0001 C CNN
F 1 "GND" H 7250 7300 50  0000 C CNN
F 2 "" H 7250 7450 50  0001 C CNN
F 3 "" H 7250 7450 50  0001 C CNN
	1    7250 7450
	1    0    0    -1  
$EndComp
Text Label 6300 7100 0    60   ~ 0
Power
$Comp
L Device:CP_Small C2
U 1 1 5A09E531
P 4800 1650
F 0 "C2" H 4810 1720 50  0000 L CNN
F 1 "100nF" H 4810 1570 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 4800 1650 50  0001 C CNN
F 3 "~" H 4800 1650 50  0001 C CNN
	1    4800 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5A09E6CF
P 5050 1700
F 0 "#PWR020" H 5050 1450 50  0001 C CNN
F 1 "GND" H 5050 1550 50  0000 C CNN
F 2 "" H 5050 1700 50  0001 C CNN
F 3 "" H 5050 1700 50  0001 C CNN
	1    5050 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5A0A0DF1
P 9000 4250
F 0 "J3" H 9000 4450 50  0000 C CNN
F 1 "CONN_01X03" V 9100 4250 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9000 4250 50  0001 C CNN
F 3 "~" H 9000 4250 50  0001 C CNN
	1    9000 4250
	1    0    0    -1  
$EndComp
Entry Wire Line
	8400 4350 8500 4250
$Comp
L power:GND #PWR021
U 1 1 5A0A1300
P 8800 4450
F 0 "#PWR021" H 8800 4200 50  0001 C CNN
F 1 "GND" H 8800 4300 50  0000 C CNN
F 2 "" H 8800 4450 50  0001 C CNN
F 3 "" H 8800 4450 50  0001 C CNN
	1    8800 4450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR022
U 1 1 5A0A13B9
P 8800 4050
F 0 "#PWR022" H 8800 3900 50  0001 C CNN
F 1 "VCC" H 8800 4200 50  0000 C CNN
F 2 "" H 8800 4050 50  0001 C CNN
F 3 "" H 8800 4050 50  0001 C CNN
	1    8800 4050
	1    0    0    -1  
$EndComp
Text Label 8500 4250 0    60   ~ 0
IRint
$Comp
L Device:C_Small C3
U 1 1 5A0A5AC8
P 11000 4150
F 0 "C3" H 11010 4220 50  0000 L CNN
F 1 "0.33uF" H 11010 4070 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 11000 4150 50  0001 C CNN
F 3 "~" H 11000 4150 50  0001 C CNN
	1    11000 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5A0A5BCF
P 12300 4150
F 0 "C6" H 12310 4220 50  0000 L CNN
F 1 "100nF" H 12310 4070 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 12300 4150 50  0001 C CNN
F 3 "~" H 12300 4150 50  0001 C CNN
	1    12300 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5A118984
P 8950 1650
F 0 "J1" H 8950 1800 50  0000 C CNN
F 1 "CONN_01X02" V 9050 1650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8950 1650 50  0001 C CNN
F 3 "~" H 8950 1650 50  0001 C CNN
	1    8950 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5A119E98
P 10500 4350
F 0 "J4" H 10500 4500 50  0000 C CNN
F 1 "CONN_01X02" V 10600 4350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10500 4350 50  0001 C CNN
F 3 "~" H 10500 4350 50  0001 C CNN
	1    10500 4350
	-1   0    0    1   
$EndComp
Text Label 13150 5250 0    60   ~ 0
LEFT
Text Label 13150 5350 0    60   ~ 0
RIGHT
$Comp
L power:GND #PWR025
U 1 1 5A11FCBB
P 9150 1750
F 0 "#PWR025" H 9150 1500 50  0001 C CNN
F 1 "GND" H 9150 1600 50  0000 C CNN
F 2 "" H 9150 1750 50  0001 C CNN
F 3 "" H 9150 1750 50  0001 C CNN
	1    9150 1750
	1    0    0    -1  
$EndComp
Text Label 9350 1550 0    60   ~ 0
VCC
$Comp
L Connector_Generic:Conn_01x08 J8
U 1 1 5A121290
P 4900 6300
F 0 "J8" H 4900 6750 50  0000 C CNN
F 1 "CONN_01X08" V 5000 6300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 4900 6300 50  0001 C CNN
F 3 "~" H 4900 6300 50  0001 C CNN
	1    4900 6300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J9
U 1 1 5A12145B
P 5400 6400
F 0 "J9" H 5400 6850 50  0000 C CNN
F 1 "CONN_01X08" V 5500 6400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5400 6400 50  0001 C CNN
F 3 "~" H 5400 6400 50  0001 C CNN
	1    5400 6400
	-1   0    0    1   
$EndComp
Text Label 5650 6200 0    60   ~ 0
PowerBTN_MISO
Entry Wire Line
	6100 6100 6200 6200
Entry Wire Line
	6100 6100 6200 6200
Entry Wire Line
	6100 6000 6200 6100
Text Label 5850 6000 0    60   ~ 0
ENC0
Text Label 5850 6100 0    60   ~ 0
ENC1
$Comp
L power:GND #PWR026
U 1 1 5A123AB0
P 5600 6850
F 0 "#PWR026" H 5600 6600 50  0001 C CNN
F 1 "GND" H 5600 6700 50  0000 C CNN
F 2 "" H 5600 6850 50  0001 C CNN
F 3 "" H 5600 6850 50  0001 C CNN
	1    5600 6850
	1    0    0    -1  
$EndComp
Text Label 3600 8400 1    60   ~ 0
A1_GND
Text Label 4550 6000 0    60   ~ 0
A1_GND
Wire Wire Line
	8500 2400 8800 2400
Wire Wire Line
	4550 1500 4550 1650
Wire Wire Line
	7250 2600 7250 2750
Wire Wire Line
	7200 1350 7300 1350
Wire Wire Line
	7300 700  7300 1350
Connection ~ 7300 1350
Wire Wire Line
	7400 1650 7400 1800
Wire Wire Line
	7200 1650 7200 1800
Wire Wire Line
	11200 4350 11200 4250
Wire Wire Line
	10700 4350 11000 4350
Wire Wire Line
	12050 4350 12050 4250
Connection ~ 11650 4350
Wire Wire Line
	11650 4300 11650 4350
Connection ~ 11200 4000
Wire Wire Line
	12050 4050 12050 4000
Wire Wire Line
	12050 4000 12300 4000
Wire Wire Line
	11200 7350 11150 7350
Wire Wire Line
	11150 7350 11150 7450
Wire Wire Line
	10650 7250 11200 7250
Wire Wire Line
	10650 7150 11200 7150
Wire Wire Line
	12600 4000 12600 4950
Wire Wire Line
	12600 4950 12100 4950
Wire Wire Line
	11200 5250 10800 5250
Wire Wire Line
	11200 5350 11050 5350
Wire Wire Line
	11200 5550 10800 5550
Wire Wire Line
	11200 5650 11050 5650
Wire Wire Line
	11200 5850 10800 5850
Wire Wire Line
	11200 5950 11100 5950
Wire Wire Line
	11200 6650 11100 6650
Wire Wire Line
	10900 6650 10900 6550
Wire Wire Line
	10900 6550 11200 6550
Wire Wire Line
	11200 6950 11100 6950
Wire Wire Line
	10900 6950 10900 6850
Wire Wire Line
	10900 6850 11200 6850
Wire Wire Line
	12250 7850 12250 7950
Wire Wire Line
	12250 8150 12250 8250
Wire Wire Line
	12250 8250 12100 8250
Wire Wire Line
	12100 8250 12100 7850
Wire Wire Line
	14150 6550 14150 6650
Wire Wire Line
	14150 6550 13400 6550
Wire Wire Line
	13100 6550 13200 6550
Wire Wire Line
	13100 6650 13450 6650
Wire Wire Line
	13650 6650 14150 6650
Connection ~ 14150 6650
Wire Wire Line
	13100 6850 13200 6850
Wire Wire Line
	13400 6850 13700 6850
Wire Wire Line
	13700 6850 13700 6900
Wire Wire Line
	13100 6950 13450 6950
Wire Wire Line
	13700 6950 13650 6950
Connection ~ 13700 6900
Wire Wire Line
	14000 6900 14150 6900
Connection ~ 14150 6900
Wire Wire Line
	13100 7150 13200 7150
Wire Wire Line
	13400 7150 13700 7150
Wire Wire Line
	13700 7150 13700 7200
Wire Wire Line
	13100 7250 13450 7250
Wire Wire Line
	13700 7250 13650 7250
Connection ~ 13700 7200
Wire Wire Line
	14000 7200 14150 7200
Connection ~ 14150 7200
Wire Wire Line
	13100 7400 13200 7400
Wire Wire Line
	13100 7500 13450 7500
Wire Wire Line
	13400 7400 14150 7400
Connection ~ 14150 7400
Wire Wire Line
	13650 7500 14150 7500
Connection ~ 14150 7500
Wire Wire Line
	13100 5250 13400 5250
Wire Wire Line
	13100 5350 13400 5350
Wire Wire Line
	10300 5250 10600 5250
Wire Wire Line
	10300 5350 10850 5350
Wire Wire Line
	10300 5450 10600 5450
Wire Wire Line
	10600 5450 10600 5550
Wire Wire Line
	10300 5550 10550 5550
Wire Wire Line
	10550 5550 10550 5650
Wire Wire Line
	10550 5650 10850 5650
Wire Wire Line
	10300 5650 10500 5650
Wire Wire Line
	10500 5650 10500 5850
Wire Wire Line
	10500 5850 10600 5850
Wire Wire Line
	10300 5750 10450 5750
Wire Wire Line
	10450 5750 10450 5950
Wire Wire Line
	10450 5950 10900 5950
Wire Wire Line
	10300 5850 10300 6050
Wire Wire Line
	13400 5450 13400 5600
Wire Wire Line
	10700 4000 11000 4000
Wire Wire Line
	7900 1100 7900 1250
Wire Wire Line
	7900 1600 7900 1700
Wire Wire Line
	7900 700  7900 800 
Wire Wire Line
	7700 1800 7700 1250
Wire Wire Line
	7700 1250 7900 1250
Connection ~ 7900 1250
Wire Wire Line
	6300 5500 7150 5500
Wire Wire Line
	6300 5300 7150 5300
Wire Wire Line
	6300 5400 7150 5400
Wire Wire Line
	6300 5600 7150 5600
Wire Wire Line
	7650 5900 7650 6100
Wire Wire Line
	5600 6300 6100 6300
Wire Wire Line
	5600 6400 6100 6400
Wire Wire Line
	5600 6500 6100 6500
Wire Wire Line
	5600 6600 6100 6600
Wire Wire Line
	6300 7100 6550 7100
Wire Wire Line
	6850 7100 6950 7100
Wire Wire Line
	7250 6900 6950 6850
Wire Wire Line
	7250 6450 7250 6500
Wire Wire Line
	7250 6500 6950 6550
Wire Wire Line
	7250 7300 7250 7450
Connection ~ 7250 6500
Wire Wire Line
	4550 1650 4700 1650
Connection ~ 4550 1650
Wire Wire Line
	4900 1650 5050 1650
Wire Wire Line
	5050 1650 5050 1700
Wire Wire Line
	8500 4250 8800 4250
Wire Wire Line
	8800 4050 8800 4150
Wire Wire Line
	8800 4450 8800 4350
Wire Wire Line
	11000 4000 11000 4050
Wire Wire Line
	11000 4250 11000 4350
Connection ~ 11200 4350
Wire Wire Line
	12300 4000 12300 4050
Connection ~ 12300 4000
Wire Wire Line
	12300 4350 12300 4250
Connection ~ 12050 4350
Wire Wire Line
	10700 4250 10700 4000
Connection ~ 11000 4000
Wire Wire Line
	11200 4050 11200 4000
Connection ~ 11000 4350
Wire Wire Line
	7250 6750 7250 6900
Wire Wire Line
	9150 1550 9600 1550
Wire Wire Line
	9150 1650 9150 1750
Wire Wire Line
	5600 6200 6100 6200
Wire Wire Line
	6100 6000 5600 6000
Wire Wire Line
	6100 6100 5600 6100
Wire Wire Line
	5600 6700 5600 6850
Wire Wire Line
	3450 7950 3600 7950
Wire Wire Line
	3450 8050 4550 8050
Wire Wire Line
	4550 8050 4550 6700
Wire Wire Line
	4550 6700 4700 6700
Wire Wire Line
	3450 7850 4450 7850
Wire Wire Line
	4450 7850 4450 6600
Wire Wire Line
	4450 6600 4700 6600
Wire Wire Line
	4350 7150 4350 6500
Wire Wire Line
	4350 6500 4700 6500
Wire Wire Line
	3350 6550 4250 6550
Wire Wire Line
	4250 6550 4250 6400
Wire Wire Line
	4250 6400 4700 6400
Wire Wire Line
	3350 6000 4250 6000
Wire Wire Line
	4250 6000 4250 6300
Wire Wire Line
	4250 6300 4700 6300
Wire Wire Line
	3350 5500 4350 5500
Wire Wire Line
	4350 5500 4350 6200
Wire Wire Line
	4350 6200 4700 6200
Wire Wire Line
	3350 4950 4450 4950
Wire Wire Line
	4450 4950 4450 6100
Wire Wire Line
	4450 6100 4700 6100
Wire Wire Line
	3600 7950 3600 8450
Wire Wire Line
	4700 6000 4550 6000
Wire Wire Line
	2950 4950 2650 4950
Wire Wire Line
	2650 4950 2650 5500
Wire Wire Line
	2950 6550 2650 6550
Connection ~ 2650 6550
Wire Wire Line
	2950 6000 2650 6000
Connection ~ 2650 6000
Wire Wire Line
	2950 5500 2650 5500
Connection ~ 2650 5500
Text Label 2650 7650 1    60   ~ 0
A1_GND
Wire Wire Line
	7300 1350 7400 1350
Wire Wire Line
	11650 4350 12050 4350
Wire Wire Line
	11650 4350 11650 4450
Wire Wire Line
	14150 6650 14150 6900
Wire Wire Line
	13700 6900 13700 6950
Wire Wire Line
	14150 6900 14150 7200
Wire Wire Line
	13700 7200 13700 7250
Wire Wire Line
	14150 7200 14150 7400
Wire Wire Line
	14150 7400 14150 7500
Wire Wire Line
	14150 7500 14150 7650
Wire Wire Line
	7300 700  7900 700 
Wire Wire Line
	7900 1250 7900 1400
Wire Wire Line
	7250 6500 7250 6650
Wire Wire Line
	4550 1650 4550 1750
Wire Wire Line
	11200 4350 11650 4350
Wire Wire Line
	12300 4000 12600 4000
Wire Wire Line
	12050 4350 12300 4350
Wire Wire Line
	11000 4000 11200 4000
Wire Wire Line
	11000 4350 11200 4350
Wire Wire Line
	2650 6000 2650 6550
Wire Wire Line
	2650 5500 2650 6000
$Comp
L Device:R R4
U 1 1 5A02D967
P 7200 1500
F 0 "R4" V 7280 1500 50  0000 C CNN
F 1 "10k" V 7200 1500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7130 1500 50  0001 C CNN
F 3 "~" H 7200 1500 50  0001 C CNN
	1    7200 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5A030F70
P 7900 1500
F 0 "C1" H 7910 1570 50  0000 L CNN
F 1 "100nF" H 7910 1420 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.5mm_P7.50mm_MKT" H 7900 1500 50  0001 C CNN
F 3 "~" H 7900 1500 50  0001 C CNN
	1    7900 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3850 2650 3950 2650
Wire Wire Line
	3850 2750 3850 2650
$Comp
L power:GNDA #PWR023
U 1 1 5A10D6D7
P 3850 2750
F 0 "#PWR023" H 3850 2500 50  0001 C CNN
F 1 "GNDA" H 3850 2600 50  0000 C CNN
F 2 "" H 3850 2750 50  0001 C CNN
F 3 "" H 3850 2750 50  0001 C CNN
	1    3850 2750
	1    0    0    -1  
$EndComp
Text Label 3450 2050 0    60   ~ 0
Reset
Wire Wire Line
	3400 2050 3950 2050
Wire Wire Line
	4650 1750 4550 1750
Connection ~ 4550 1750
Entry Wire Line
	6100 3650 6200 3750
$Comp
L Connector:AVR-ISP-10 CON1
U 1 1 5A036684
P 7550 5400
F 0 "CON1" H 7380 5730 50  0000 C CNN
F 1 "AVR-ISP-10" H 7210 5070 50  0000 L BNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" V 6800 5450 50  0001 C CNN
F 3 " ~" H 7550 5400 50  0001 C CNN
	1    7550 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	7350 3550 7350 3850
$Comp
L Device:Battery_Cell BT1
U 1 1 5A02D725
P 7800 2500
F 0 "BT1" H 7900 2600 50  0000 L CNN
F 1 "Battery_Cell" H 7900 2500 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_103_1x20mm" V 7800 2560 50  0001 C CNN
F 3 "~" V 7800 2560 50  0001 C CNN
	1    7800 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 2750 7350 2500
Wire Wire Line
	7350 2500 7600 2500
Wire Wire Line
	7900 2500 8050 2500
Wire Wire Line
	8050 2500 8050 2700
Wire Wire Line
	6300 2950 6850 2950
Wire Wire Line
	6300 3050 6850 3050
$Comp
L Device:Crystal Y1
U 1 1 5A02D584
P 6600 3300
F 0 "Y1" H 6600 3450 50  0000 C CNN
F 1 "Crystal" H 6600 3150 50  0000 C CNN
F 2 "Crystal:Crystal_AT310_D3.0mm_L10.0mm_Horizontal" H 6600 3300 50  0001 C CNN
F 3 "~" H 6600 3300 50  0001 C CNN
	1    6600 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3450 6850 3450
Wire Wire Line
	6600 3150 6850 3150
Wire Wire Line
	6850 3150 6850 3250
Wire Wire Line
	6850 3350 6850 3450
Entry Wire Line
	6100 2250 6200 2350
Entry Wire Line
	6100 2350 6200 2450
Text Label 5700 2250 0    60   ~ 0
BTN2
Text Label 5700 2350 0    60   ~ 0
BTN3_MOSI
Entry Wire Line
	6100 2450 6200 2550
Text Label 5650 2450 0    50   ~ 0
PowerBTN_MISO
Text Label 6300 5400 0    60   ~ 0
SCK
Entry Wire Line
	6100 2550 6200 2650
Text Label 5700 2550 0    50   ~ 0
SCK
Wire Wire Line
	2850 7150 2850 7850
Wire Wire Line
	2850 7150 4350 7150
Wire Wire Line
	2850 8050 2650 8050
Wire Wire Line
	2650 6550 2650 8050
Wire Wire Line
	2650 8050 2650 8450
Wire Wire Line
	2650 8450 3600 8450
Connection ~ 2650 8050
Wire Wire Line
	8500 2500 8800 2500
Text Label 8550 2500 0    60   ~ 0
VCC
Entry Wire Line
	8400 2600 8500 2500
Entry Wire Line
	8400 2500 8500 2400
Text Label 8550 2600 0    60   ~ 0
SCL
Wire Wire Line
	8500 2600 8800 2600
Entry Wire Line
	8400 2700 8500 2600
Text Label 8550 2700 0    60   ~ 0
SDA
Wire Wire Line
	8500 2700 8800 2700
Entry Wire Line
	8400 2800 8500 2700
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5E2FAD0D
P 9000 2500
F 0 "J2" H 9080 2492 50  0000 L CNN
F 1 "Conn_01x04" H 9080 2401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9000 2500 50  0001 C CNN
F 3 "~" H 9000 2500 50  0001 C CNN
	1    9000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 4000 12050 4000
Connection ~ 12050 4000
Wire Wire Line
	11200 4000 11350 4000
Wire Wire Line
	5150 2050 6100 2050
Wire Wire Line
	5150 2150 6100 2150
Wire Wire Line
	5150 2250 6100 2250
Wire Wire Line
	5150 2350 6100 2350
Wire Wire Line
	5150 2450 6100 2450
Wire Wire Line
	5150 2550 6100 2550
Wire Wire Line
	5150 2750 6100 2750
Wire Wire Line
	5150 2850 6100 2850
Wire Wire Line
	5150 3150 6100 3150
Wire Wire Line
	5150 3250 6100 3250
Wire Wire Line
	5150 3650 6100 3650
Wire Wire Line
	4550 4550 4550 4650
Wire Wire Line
	4650 4550 4650 4650
Wire Wire Line
	4650 4650 4550 4650
Connection ~ 4550 4650
Wire Wire Line
	4550 4650 4550 4850
Text Label 5700 3450 0    60   ~ 0
Power
Entry Wire Line
	6100 3450 6200 3550
Wire Wire Line
	5150 3450 6100 3450
Wire Bus Line
	6200 1900 8400 1900
Wire Bus Line
	8400 1900 8400 4600
Wire Bus Line
	6200 1900 6200 9200
$EndSCHEMATC
