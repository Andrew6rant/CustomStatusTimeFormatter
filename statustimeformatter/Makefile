TARGET := iphone:clang:latest:12.2

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = StatusTimeFormatter

StatusTimeFormatter_FILES = $(shell find Sources/StatusTimeFormatter -name '*.swift') $(shell find Sources/StatusTimeFormatterC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
StatusTimeFormatter_SWIFTFLAGS = -ISources/StatusTimeFormatterC/include
StatusTimeFormatter_INSTALL_PATH = /Library/PreferenceBundles
StatusTimeFormatter_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
