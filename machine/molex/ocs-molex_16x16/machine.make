# Copyright (C) 2025  Molex Corporation

# Intel(R) Atom(TM) CPU E3845 CPP

ONIE_ARCH = x86_64
FIRMWARE_TYPE = uefi
SWITCH_ASIC_VENDOR = none
UEFI_ENABLE = yes

VENDOR_REV ?= 0


# Enable building of secure boot binaries
SECURE_BOOT_ENABLE = no

# ONIE_VENDOR_SECRET_KEY_PEM -- file system path to private RSA key
# encoded in PEM format.
#
# WARNING: This key is extremely sensitive and should be handled
# carefully.  In practice, this key should never be checked into the
# code repository.  Set ONIE_VENDOR_SECRET_KEY_PEM on the make command
# line at build time.
#
# In this example, the machine is a demonstration vehicle and the
# secret key is not sensitive.  It is reasonable for this key to
# reside in the upstream code repository.
ONIE_VENDOR_SECRET_KEY_PEM = $(MACHINEDIR)/x509/onie_db.key

# ONIE_VENDOR_CERT_DER -- file system path to public vendor x509
# certificate, encoded in DER format.
#
# Typically this variable is specified on the command line as we do
# not expect the certificate to reside in the upstream code
# repository.  Included here as this machine is a demonstration
# vehicle.
ONIE_VENDOR_CERT_DER = $(MACHINEDIR)/x509/onie_db.der

# ONIE_VENDOR_CERT_PEM -- file system path to public vendor x509
# certificate, encoded in PEM format.  Same as ONIE_VENDOR_CERT_DER,
# but in PEM format.
ONIE_VENDOR_CERT_PEM = $(MACHINEDIR)/x509/onie_db.pem

# SHIM_SELF_SIGN_SECRET_KEY_PEM
# SHIM_SELF_SIGN_PUBLIC_CERT_PEM
#
# These two parameters are for testing purposes only.  They allow one
# to simulate having shimx64.efi signed by a recognized signing
# authority.  The certificate used here must be loaded into the DB on
# the target system in order to verify the signature.
SHIM_SELF_SIGN_SECRET_KEY_PEM  = $(MACHINEDIR)/x509/onie_db.key
SHIM_SELF_SIGN_PUBLIC_CERT_PEM = $(MACHINEDIR)/x509/onie_db.pem


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

CONSOLE_SPEED ?= 9600

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
