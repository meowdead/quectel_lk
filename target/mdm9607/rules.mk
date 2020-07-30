LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared

PLATFORM := mdm9607

MEMBASE := 0x82900000 # SDRAM
MEMSIZE := 0x00100000 # 1MB

SCRATCH_ADDR                            := 0 # keeping for successful compilation
SCRATCH_ADDR_128                        := 0x86000000
SCRATCH_REGION1_128                     := 0x86000000
SCRATCH_REGION1_SIZE_128                := 0x01c00000  # 28MB
SCRATCH_REGION2_128                     := 0x80000000
SCRATCH_REGION2_SIZE_128                := 0x02900000   # 41M

KERNEL_REGION                           := 0x80000000
KERNEL_REGION_SIZE                      := 0x2000000 # 20MB

SCRATCH_ADDR_256                        := 0x88000000
SCRATCH_REGION_256                      := 0x88000000
SCRATCH_REGION_SIZE_256                 := 0x08000000  # 128MB

BASE_ADDR                               := 0x80000000


MODULES += \
	dev/keys \
	dev/vib \
	lib/ptable \
	dev/pmic/pm8x41 \
	lib/libfdt

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR) \
	SCRATCH_ADDR_128=$(SCRATCH_ADDR_128) \
	SCRATCH_ADDR_256=$(SCRATCH_ADDR_256) \
	SCRATCH_REGION_256=$(SCRATCH_REGION_256) \
	SCRATCH_REGION1_128=$(SCRATCH_REGION1_128) \
	SCRATCH_REGION2_128=$(SCRATCH_REGION2_128) \
	SCRATCH_REGION1_SIZE_128=$(SCRATCH_REGION1_SIZE_128) \
	SCRATCH_REGION2_SIZE_128=$(SCRATCH_REGION2_SIZE_128) \
	SCRATCH_REGION_SIZE_256=$(SCRATCH_REGION_SIZE_256) \
	KERNEL_REGION=$(KERNEL_REGION) \
	KERNEL_REGION_SIZE=$(KERNEL_REGION_SIZE)

OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/meminfo.o \
	$(LOCAL_DIR)/keypad.o

ifeq ($(ENABLE_SDHCI_SUPPORT),1)
	MODULES += lib/fs/ff12b
	OBJS += $(LOCAL_DIR)/regulator.o
endif
