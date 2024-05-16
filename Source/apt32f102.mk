##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=apt32f102
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=admin
Date                   :=16/05/2024
CDKPath                :=../../../../../../C-Sky/CDK
ToolchainPath          :=C:/C-Sky/CDKRepo/Toolchain/CKV2ElfMinilib/V3.10.29/R/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=Release_APT32F102ab
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=apt32f102.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   := 
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)User $(IncludeSwitch)User/LCD $(IncludeSwitch)include  
IncludeAPath           := $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)../../../../../../C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)User $(IncludeSwitch)User/LCD  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)_102TKey_1_15 $(LibrarySwitch)_102ClkCalib_1_03 $(LibrarySwitch)m  
ArLibs                 := "lib_102TKey_1_15" "lib_102ClkCalib_1_03" "libm" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch).  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -w  -ffunction-sections -mistack 
CFLAGS   := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -w  -ffunction-sections -mistack 
ASFLAGS  := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CKCPU_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IntermediateDirectory)/arch_apt32f102a_iostring$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_adc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_bt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_coret$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_countera$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_crc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_ept$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_et$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f102a_gpio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_gpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_i2c$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_ifc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_lpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_rtc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_sio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_spi$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_syscon$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_tkey_parameter$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f102a_uart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102a_wwdt$(ObjectSuffix) $(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/apt32f102a_initial$(ObjectSuffix) $(IntermediateDirectory)/apt32f102a_interrupt$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IntermediateDirectory)/User_analog$(ObjectSuffix) $(IntermediateDirectory)/User_key$(ObjectSuffix) $(IntermediateDirectory)/User_led$(ObjectSuffix) \
	$(IntermediateDirectory)/User_logic$(ObjectSuffix) $(IntermediateDirectory)/User_task$(ObjectSuffix) $(IntermediateDirectory)/User_uart$(ObjectSuffix) $(IntermediateDirectory)/User_gui$(ObjectSuffix) $(IntermediateDirectory)/LCD_lcd$(ObjectSuffix) $(IntermediateDirectory)/LCD_lcd_init$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	-@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJCOPY) $(ObjcopySwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  $(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix) 
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/arch_crt0$(ObjectSuffix): arch/crt0.S  
	$(AS) $(SourceSwitch) arch/crt0.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_crt0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/arch_crt0$(PreprocessSuffix): arch/crt0.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_crt0$(PreprocessSuffix) arch/crt0.S

$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix): arch/mem_init.c  
	$(CC) $(SourceSwitch) arch/mem_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_mem_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_mem_init$(PreprocessSuffix): arch/mem_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_mem_init$(PreprocessSuffix) arch/mem_init.c

$(IntermediateDirectory)/arch_apt32f102a_iostring$(ObjectSuffix): arch/apt32f102a_iostring.c  
	$(CC) $(SourceSwitch) arch/apt32f102a_iostring.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_apt32f102a_iostring$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_apt32f102a_iostring$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_apt32f102a_iostring$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_apt32f102a_iostring$(PreprocessSuffix): arch/apt32f102a_iostring.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_apt32f102a_iostring$(PreprocessSuffix) arch/apt32f102a_iostring.c

$(IntermediateDirectory)/FWlib_apt32f102a_adc$(ObjectSuffix): FWlib/apt32f102a_adc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_adc$(PreprocessSuffix): FWlib/apt32f102a_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_adc$(PreprocessSuffix) FWlib/apt32f102a_adc.c

$(IntermediateDirectory)/FWlib_apt32f102a_bt$(ObjectSuffix): FWlib/apt32f102a_bt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_bt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_bt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_bt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_bt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_bt$(PreprocessSuffix): FWlib/apt32f102a_bt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_bt$(PreprocessSuffix) FWlib/apt32f102a_bt.c

$(IntermediateDirectory)/FWlib_apt32f102a_coret$(ObjectSuffix): FWlib/apt32f102a_coret.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_coret.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_coret$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_coret$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_coret$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_coret$(PreprocessSuffix): FWlib/apt32f102a_coret.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_coret$(PreprocessSuffix) FWlib/apt32f102a_coret.c

$(IntermediateDirectory)/FWlib_apt32f102a_countera$(ObjectSuffix): FWlib/apt32f102a_countera.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_countera.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_countera$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_countera$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_countera$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_countera$(PreprocessSuffix): FWlib/apt32f102a_countera.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_countera$(PreprocessSuffix) FWlib/apt32f102a_countera.c

$(IntermediateDirectory)/FWlib_apt32f102a_crc$(ObjectSuffix): FWlib/apt32f102a_crc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_crc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_crc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_crc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_crc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_crc$(PreprocessSuffix): FWlib/apt32f102a_crc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_crc$(PreprocessSuffix) FWlib/apt32f102a_crc.c

$(IntermediateDirectory)/FWlib_apt32f102a_ept$(ObjectSuffix): FWlib/apt32f102a_ept.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_ept.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_ept$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_ept$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_ept$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_ept$(PreprocessSuffix): FWlib/apt32f102a_ept.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_ept$(PreprocessSuffix) FWlib/apt32f102a_ept.c

$(IntermediateDirectory)/FWlib_apt32f102a_et$(ObjectSuffix): FWlib/apt32f102a_et.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_et.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_et$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_et$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_et$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_et$(PreprocessSuffix): FWlib/apt32f102a_et.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_et$(PreprocessSuffix) FWlib/apt32f102a_et.c

$(IntermediateDirectory)/FWlib_apt32f102a_gpio$(ObjectSuffix): FWlib/apt32f102a_gpio.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_gpio$(PreprocessSuffix): FWlib/apt32f102a_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_gpio$(PreprocessSuffix) FWlib/apt32f102a_gpio.c

$(IntermediateDirectory)/FWlib_apt32f102a_gpt$(ObjectSuffix): FWlib/apt32f102a_gpt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_gpt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_gpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_gpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_gpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_gpt$(PreprocessSuffix): FWlib/apt32f102a_gpt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_gpt$(PreprocessSuffix) FWlib/apt32f102a_gpt.c

$(IntermediateDirectory)/FWlib_apt32f102a_i2c$(ObjectSuffix): FWlib/apt32f102a_i2c.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_i2c$(PreprocessSuffix): FWlib/apt32f102a_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_i2c$(PreprocessSuffix) FWlib/apt32f102a_i2c.c

$(IntermediateDirectory)/FWlib_apt32f102a_ifc$(ObjectSuffix): FWlib/apt32f102a_ifc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_ifc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_ifc$(PreprocessSuffix): FWlib/apt32f102a_ifc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_ifc$(PreprocessSuffix) FWlib/apt32f102a_ifc.c

$(IntermediateDirectory)/FWlib_apt32f102a_lpt$(ObjectSuffix): FWlib/apt32f102a_lpt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_lpt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_lpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_lpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_lpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_lpt$(PreprocessSuffix): FWlib/apt32f102a_lpt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_lpt$(PreprocessSuffix) FWlib/apt32f102a_lpt.c

$(IntermediateDirectory)/FWlib_apt32f102a_rtc$(ObjectSuffix): FWlib/apt32f102a_rtc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_rtc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_rtc$(PreprocessSuffix): FWlib/apt32f102a_rtc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_rtc$(PreprocessSuffix) FWlib/apt32f102a_rtc.c

$(IntermediateDirectory)/FWlib_apt32f102a_sio$(ObjectSuffix): FWlib/apt32f102a_sio.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_sio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_sio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_sio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_sio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_sio$(PreprocessSuffix): FWlib/apt32f102a_sio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_sio$(PreprocessSuffix) FWlib/apt32f102a_sio.c

$(IntermediateDirectory)/FWlib_apt32f102a_spi$(ObjectSuffix): FWlib/apt32f102a_spi.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_spi$(PreprocessSuffix): FWlib/apt32f102a_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_spi$(PreprocessSuffix) FWlib/apt32f102a_spi.c

$(IntermediateDirectory)/FWlib_apt32f102a_syscon$(ObjectSuffix): FWlib/apt32f102a_syscon.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_syscon.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_syscon$(PreprocessSuffix): FWlib/apt32f102a_syscon.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_syscon$(PreprocessSuffix) FWlib/apt32f102a_syscon.c

$(IntermediateDirectory)/FWlib_apt32f102a_tkey_parameter$(ObjectSuffix): FWlib/apt32f102a_tkey_parameter.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_tkey_parameter.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_tkey_parameter$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_tkey_parameter$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_tkey_parameter$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_tkey_parameter$(PreprocessSuffix): FWlib/apt32f102a_tkey_parameter.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_tkey_parameter$(PreprocessSuffix) FWlib/apt32f102a_tkey_parameter.c

$(IntermediateDirectory)/FWlib_apt32f102a_uart$(ObjectSuffix): FWlib/apt32f102a_uart.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_uart$(PreprocessSuffix): FWlib/apt32f102a_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_uart$(PreprocessSuffix) FWlib/apt32f102a_uart.c

$(IntermediateDirectory)/FWlib_apt32f102a_wwdt$(ObjectSuffix): FWlib/apt32f102a_wwdt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f102a_wwdt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102a_wwdt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102a_wwdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102a_wwdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102a_wwdt$(PreprocessSuffix): FWlib/apt32f102a_wwdt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102a_wwdt$(PreprocessSuffix) FWlib/apt32f102a_wwdt.c

$(IntermediateDirectory)/main$(ObjectSuffix): main.c  
	$(CC) $(SourceSwitch) main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) main.c

$(IntermediateDirectory)/apt32f102a_initial$(ObjectSuffix): apt32f102a_initial.c  
	$(CC) $(SourceSwitch) apt32f102a_initial.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102a_initial$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102a_initial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102a_initial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102a_initial$(PreprocessSuffix): apt32f102a_initial.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102a_initial$(PreprocessSuffix) apt32f102a_initial.c

$(IntermediateDirectory)/apt32f102a_interrupt$(ObjectSuffix): apt32f102a_interrupt.c  
	$(CC) $(SourceSwitch) apt32f102a_interrupt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102a_interrupt$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102a_interrupt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102a_interrupt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102a_interrupt$(PreprocessSuffix): apt32f102a_interrupt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102a_interrupt$(PreprocessSuffix) apt32f102a_interrupt.c

$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix): drivers/apt32f102.c  
	$(CC) $(SourceSwitch) drivers/apt32f102.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102$(PreprocessSuffix): drivers/apt32f102.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102$(PreprocessSuffix) drivers/apt32f102.c

$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix): drivers/apt32f102_ck801.c  
	$(CC) $(SourceSwitch) drivers/apt32f102_ck801.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102_ck801$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102_ck801$(PreprocessSuffix): drivers/apt32f102_ck801.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102_ck801$(PreprocessSuffix) drivers/apt32f102_ck801.c

$(IntermediateDirectory)/User_analog$(ObjectSuffix): User/analog.c  
	$(CC) $(SourceSwitch) User/analog.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_analog$(ObjectSuffix) -MF$(IntermediateDirectory)/User_analog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_analog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_analog$(PreprocessSuffix): User/analog.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_analog$(PreprocessSuffix) User/analog.c

$(IntermediateDirectory)/User_key$(ObjectSuffix): User/key.c  
	$(CC) $(SourceSwitch) User/key.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_key$(ObjectSuffix) -MF$(IntermediateDirectory)/User_key$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_key$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_key$(PreprocessSuffix): User/key.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_key$(PreprocessSuffix) User/key.c

$(IntermediateDirectory)/User_led$(ObjectSuffix): User/led.c  
	$(CC) $(SourceSwitch) User/led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_led$(ObjectSuffix) -MF$(IntermediateDirectory)/User_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_led$(PreprocessSuffix): User/led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_led$(PreprocessSuffix) User/led.c

$(IntermediateDirectory)/User_logic$(ObjectSuffix): User/logic.c  
	$(CC) $(SourceSwitch) User/logic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_logic$(ObjectSuffix) -MF$(IntermediateDirectory)/User_logic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_logic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_logic$(PreprocessSuffix): User/logic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_logic$(PreprocessSuffix) User/logic.c

$(IntermediateDirectory)/User_task$(ObjectSuffix): User/task.c  
	$(CC) $(SourceSwitch) User/task.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_task$(ObjectSuffix) -MF$(IntermediateDirectory)/User_task$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_task$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_task$(PreprocessSuffix): User/task.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_task$(PreprocessSuffix) User/task.c

$(IntermediateDirectory)/User_uart$(ObjectSuffix): User/uart.c  
	$(CC) $(SourceSwitch) User/uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/User_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_uart$(PreprocessSuffix): User/uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_uart$(PreprocessSuffix) User/uart.c

$(IntermediateDirectory)/User_gui$(ObjectSuffix): User/gui.c  
	$(CC) $(SourceSwitch) User/gui.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/User_gui$(ObjectSuffix) -MF$(IntermediateDirectory)/User_gui$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/User_gui$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/User_gui$(PreprocessSuffix): User/gui.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/User_gui$(PreprocessSuffix) User/gui.c

$(IntermediateDirectory)/LCD_lcd$(ObjectSuffix): User/LCD/lcd.c  
	$(CC) $(SourceSwitch) User/LCD/lcd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/LCD_lcd$(ObjectSuffix) -MF$(IntermediateDirectory)/LCD_lcd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/LCD_lcd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/LCD_lcd$(PreprocessSuffix): User/LCD/lcd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/LCD_lcd$(PreprocessSuffix) User/LCD/lcd.c

$(IntermediateDirectory)/LCD_lcd_init$(ObjectSuffix): User/LCD/lcd_init.c  
	$(CC) $(SourceSwitch) User/LCD/lcd_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/LCD_lcd_init$(ObjectSuffix) -MF$(IntermediateDirectory)/LCD_lcd_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/LCD_lcd_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/LCD_lcd_init$(PreprocessSuffix): User/LCD/lcd_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/LCD_lcd_init$(PreprocessSuffix) User/LCD/lcd_init.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
