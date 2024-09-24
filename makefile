ifeq ($(OS),Windows_NT) 
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

# please change all tools path to your own path

ifeq ($(detected_OS),Darwin)        # Mac OS X
    FULL_PATH_CC = /Users/deqingsun/Desktop/smallApps/sdcc/bin/sdcc
	OPENOCD = /Users/deqingsun/Desktop/smallApps/xpack-openocd-0.12.0-4/bin/openocd
	OPENOCD_SCRIPT = /Users/deqingsun/Desktop/smallApps/xpack-openocd-0.12.0-4/openocd/scripts
	CLEAR_CMD = find build -type f ! -name '.*' -delete
endif

ifeq ($(detected_OS),Windows)
    # SDCC path on windows is C:\Program Files (x86)\SDCC\bin
	OPENOCD = C:\TEMP\OpenOCD-20240916-0.12.0\bin\openocd.exe
	OPENOCD_SCRIPT = C:\TEMP\OpenOCD-20240916-0.12.0\share\openocd\scripts
	FULL_PATH_CC = "C:\Program Files (x86)\SDCC\bin\sdcc"
	CLEAR_CMD = for /f "delims=" %%i in ('dir /b /a-d build ^| findstr /v "^."') do del "build\%%i"
endif

CC = $(FULL_PATH_CC)

# Compiler flags
CFLAGS = --debug -mstm8 --std-sdcc99 --out-fmt-elf

SRC_ALL = main.c

OBJ_ALL = $(SRC_ALL:.c=.rel)

TARGET = stm8_test_debug

%.rel: %.c
#	compile from .c to .rel
	$(CC) $(CFLAGS) -c $< -o build/$@

all: compile

compile: $(OBJ_ALL)
	$(CC) $(CFLAGS) $(addprefix build/, $(OBJ_ALL)) -o build/$(TARGET).elf

# openocd_flash:
# 	$(OPENOCD) -f st-link.cfg -f $(OPENOCD_SCRIPT)/target/stm8l.cfg -c "init" -c "reset halt" -c "wait_halt" -c "load_image build/$(TARGET).hex 0" -c "reset run" -c "shutdown"

openocd:
	$(OPENOCD) -f st-link.cfg -f $(OPENOCD_SCRIPT)/target/stm8l.cfg -c "init" -c "reset halt"

clean:
	$(CLEAR_CMD)