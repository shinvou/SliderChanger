CC := clang

ARCHS := -arch armv7 -arch arm64

SUBSTITUTE_LIBRARY_PATH := $(CURDIR)/lib
FRAMEWORKS:= -framework Foundation
SYSROOT := -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.1.sdk

CFLAGS := -g -O3 -Wall -Wextra -dynamiclib $(ARCHS)
LDFLAGS := -L$(SUBSTITUTE_LIBRARY_PATH) -lsubstitute $(FRAMEWORKS) $(SYSROOT)

all: SliderChanger.dylib
%.dylib: %.mm
	@mkdir -p out
	$(CC) $(CFLAGS) $(LDFLAGS) -o out/$@ $<

clean:
	rm -rf out
