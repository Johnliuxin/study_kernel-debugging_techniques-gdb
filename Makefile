##
## This Makefile could automatic generation the dependence
## You don't need to modify this Makefile even if you add a c code
## For more information about this Makefile, check the following link:
## http://blog.chinaunix.net/uid-20316928-id-3395996.html
## <¸úÎÒÒ»ÆðÐ´Makefile-³Âð©.pdf : 5.8>
##

# Define the macro needed to be passed to source code
MACRO :=

# Define the build flags
CFLAGS := -g

ifneq ($(MACRO),)
CFLAGS += -D$(MACRO)
endif

# Define the compile tools
AS		= $(CROSS_COMPILE)as
LD		= $(CROSS_COMPILE)ld
CC		= $(CROSS_COMPILE)gcc
CPP		= $(CC) -E
AR		= $(CROSS_COMPILE)ar
NM		= $(CROSS_COMPILE)nm
STRIP		= $(CROSS_COMPILE)strip
OBJCOPY		= $(CROSS_COMPILE)objcopy
OBJDUMP		= $(CROSS_COMPILE)objdump

# Define the command name of this program
COMMAND_NAME := main

# Don't need to modify the following things
SOURCES := $(wildcard *.c)
OBJS := $(patsubst %.c, %.o,$(SOURCES))

# The default target of this Makefile
${COMMAND_NAME} : $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) -o ${COMMAND_NAME}
	@echo "command:${COMMAND_NAME} generated successful"

sinclude $(SOURCES:.c=.d)
%.d : %.c
	@set -e; rm -f $@; \
	$(CC) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
	
# The clean target
clean :
	@rm -rf $(OBJS)
	@rm -f $(SOURCES:.c=.d)
	
distclean :
	@rm -rf $(OBJS)
	@rm -f $(SOURCES:.c=.d)
	@rm -f ${COMMAND_NAME}
