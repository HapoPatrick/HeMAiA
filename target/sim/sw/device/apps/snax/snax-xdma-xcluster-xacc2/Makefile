

APP     = snax-xdma-xcluster-xacc2

INCDIRS += data
INCDIRS += INCDIRS += ../../../snax/xdma/include/

# Add binary to final build
RISCV_LDFLAGS += ../../../snax/xdma/build/snax-xdma-lib.o

SRCS    = src/snax-xdma-xcluster-xacc2.c

include ./data/Makefile
include ../../common.mk

$(DEP): $(DATA_H)


