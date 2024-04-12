# Copyright (C) 2023  Molex Corporation

# Intel(R) Atom X6425E CPP

ONIE_ARCH = x86_64
FIRMWARE_TYPE = uefi
SWITCH_ASIC_VENDOR = none
UEFI_ENABLE = yes

VENDOR_REV ?= 0

# Translate hardware revision to ONIE hardware revision
ifeq ($(VENDOR_REV),0)
  MACHINE_REV = 0
else
  $(warning Unknown VENDOR_REV '$(VENDOR_REV)' for MACHINE '$(MACHINE)')
  $(error Unknown VENDOR_REV)
endif

# The VENDOR_VERSION string is appended to the overal ONIE version
# string.  HW vendors can use this to appended their own versioning
# information to the base ONIE version string.

# Vendor ID -- IANA Private Enterprise Number:
# http://www.iana.org/assignments/enterprise-numbers
# Open Compute Project IANA number
VENDOR_ID = 343

# Skip the i2ctools and the onie-syseeprom command for this platform
I2CTOOLS_ENABLE = no

# The onie-syseeprom command in i2ctools is deprecated.  It is recommended to
# use the one implemented in busybox instead.  The option intends to provide a
# quick way to turn off the feature in i2ctools.  The command will be removed
# from i2ctools in the future once all machines migrate their support of
# sys_eeprom to busybox.
#
# The option is significant when I2CTOOLS_ENABLE is 'yes'
#
#I2CTOOLS_SYSEEPROM = no

#
# Console parameters can be defined here (default values are in
# build-config/arch/x86_64.make).
# For example,
#

CONSOLE_SPEED ?= 115200

# Specify Linux kernel version -- comment out to use the default
LINUX_VERSION = 5.15
LINUX_MINOR_VERSION = 71
# GCC_VERSION = 8.3.0
# XTOOLS_LIBC_VERSION  = 1.0.38

# Specify any extra parameters that you'd want to pass to the onie linux
# kernel command line in EXTRA_CMDLINE_LINUX env variable. Eg:
#
#EXTRA_CMDLINE_LINUX ?= install_url=http://server/path/to/installer debug earlyprintk=serial
#
# NOTE: You can give multiple space separated parameters

#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:
