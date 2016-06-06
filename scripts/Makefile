###############################################################################
# File: 	Makefile
# Author: Jared Bold
# Date:		6/6/2016
# Description:
# 	Generic Makefile for building lpc8xx project
###############################################################################

# Cross compile info
CROSS = arm-none-eabi
CPU = -mthumb -mpcu=cortex-m0plus -MD
FPU = # Add fpu options here

-include Make.mk

# Program variables
CC       =  ${CROSS}-gcc
LD       =  ${CROSS}-ld
OBJCOPY  =  ${CROSS}-objcopy
SIZE     =  ${CROSS}-size

# Compile Options
CFLAGS += -0s --specs=nano.specs -ffunction-sections -fdata-sections -fno-builtin
CFLAGS += ${CPU} ${FPU}
LDFLAGS = --gc-sections
