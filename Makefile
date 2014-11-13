ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = CallConnect
CallConnect_FILES = Tweak.xm
CallConnect_FRAMEWORKS = AudioToolbox
CallConnect_PrivateFrameworks = TelephonyUtilities

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
