# Makefile generated by Xilinx.

PROCESSOR = microblaze_0
LIBRARIES = ${PROCESSOR}/lib/libxil.a
BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))

ifneq (,$(findstring win,$(RDI_PLATFORM)))
 SHELL = CMD
endif

all: libs
	@echo 'Finished building libraries'

include: $(addsuffix /make.include,$(SUBDIRS))

libs: $(addsuffix /make.libs,$(SUBDIRS))

clean: $(addsuffix /make.clean,$(SUBDIRS))

$(PROCESSOR)/lib/libxil.a: $(PROCESSOR)/lib/libxil_init.a
	cp -f $< $@

%/make.include: $(if $(wildcard $(PROCESSOR)/lib/libxil_init.a),$(PROCESSOR)/lib/libxil.a,)
	@echo "Running Make include in $(subst /make.include,,$@)"
	$(MAKE) -C $(subst /make.include,,$@) -s include  "SHELL=$(SHELL)" "COMPILER=mb-gcc" "ARCHIVER=mb-ar" "COMPILER_FLAGS=  -O2 -c -mcpu=v11.0 -mlittle-endian -mno-xl-soft-div -mno-xl-soft-mul -mxl-barrel-shift" "EXTRA_COMPILER_FLAGS=-ffunction-sections -fdata-sections -Wall -Wextra"

%/make.libs: include
	@echo "Running Make libs in $(subst /make.libs,,$@)"
	$(MAKE) -C $(subst /make.libs,,$@) -s libs  "SHELL=$(SHELL)" "COMPILER=mb-gcc" "ARCHIVER=mb-ar" "COMPILER_FLAGS=  -O2 -c -mcpu=v11.0 -mlittle-endian -mno-xl-soft-div -mno-xl-soft-mul -mxl-barrel-shift" "EXTRA_COMPILER_FLAGS=-ffunction-sections -fdata-sections -Wall -Wextra"

%/make.clean: 
	$(MAKE) -C $(subst /make.clean,,$@) -s clean 
clean:
	rm -f ${PROCESSOR}/lib/libxil.a
