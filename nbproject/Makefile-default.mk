#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=blinker_led.asm delay_16mhz.asm delay_4mhz.asm uart_sample.asm i2c_sample.asm spi_sample.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/blinker_led.o ${OBJECTDIR}/delay_16mhz.o ${OBJECTDIR}/delay_4mhz.o ${OBJECTDIR}/uart_sample.o ${OBJECTDIR}/i2c_sample.o ${OBJECTDIR}/spi_sample.o
POSSIBLE_DEPFILES=${OBJECTDIR}/blinker_led.o.d ${OBJECTDIR}/delay_16mhz.o.d ${OBJECTDIR}/delay_4mhz.o.d ${OBJECTDIR}/uart_sample.o.d ${OBJECTDIR}/i2c_sample.o.d ${OBJECTDIR}/spi_sample.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/blinker_led.o ${OBJECTDIR}/delay_16mhz.o ${OBJECTDIR}/delay_4mhz.o ${OBJECTDIR}/uart_sample.o ${OBJECTDIR}/i2c_sample.o ${OBJECTDIR}/spi_sample.o

# Source Files
SOURCEFILES=blinker_led.asm delay_16mhz.asm delay_4mhz.asm uart_sample.asm i2c_sample.asm spi_sample.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=12f1822
MP_LINKER_DEBUG_OPTION= -r=RAM@GPR:0xB0:0xBF
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/blinker_led.o: blinker_led.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/blinker_led.o.d 
	@${RM} ${OBJECTDIR}/blinker_led.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/blinker_led.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/blinker_led.lst\\\" -e\\\"${OBJECTDIR}/blinker_led.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/blinker_led.o\\\" \\\"blinker_led.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/blinker_led.o"
	@${FIXDEPS} "${OBJECTDIR}/blinker_led.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/delay_16mhz.o: delay_16mhz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay_16mhz.o.d 
	@${RM} ${OBJECTDIR}/delay_16mhz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/delay_16mhz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/delay_16mhz.lst\\\" -e\\\"${OBJECTDIR}/delay_16mhz.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/delay_16mhz.o\\\" \\\"delay_16mhz.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/delay_16mhz.o"
	@${FIXDEPS} "${OBJECTDIR}/delay_16mhz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/delay_4mhz.o: delay_4mhz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay_4mhz.o.d 
	@${RM} ${OBJECTDIR}/delay_4mhz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/delay_4mhz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/delay_4mhz.lst\\\" -e\\\"${OBJECTDIR}/delay_4mhz.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/delay_4mhz.o\\\" \\\"delay_4mhz.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/delay_4mhz.o"
	@${FIXDEPS} "${OBJECTDIR}/delay_4mhz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/uart_sample.o: uart_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart_sample.o.d 
	@${RM} ${OBJECTDIR}/uart_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/uart_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/uart_sample.lst\\\" -e\\\"${OBJECTDIR}/uart_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/uart_sample.o\\\" \\\"uart_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/uart_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/uart_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/i2c_sample.o: i2c_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_sample.o.d 
	@${RM} ${OBJECTDIR}/i2c_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/i2c_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/i2c_sample.lst\\\" -e\\\"${OBJECTDIR}/i2c_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/i2c_sample.o\\\" \\\"i2c_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/i2c_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/i2c_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/spi_sample.o: spi_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_sample.o.d 
	@${RM} ${OBJECTDIR}/spi_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/spi_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/spi_sample.lst\\\" -e\\\"${OBJECTDIR}/spi_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/spi_sample.o\\\" \\\"spi_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/spi_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/spi_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/blinker_led.o: blinker_led.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/blinker_led.o.d 
	@${RM} ${OBJECTDIR}/blinker_led.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/blinker_led.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/blinker_led.lst\\\" -e\\\"${OBJECTDIR}/blinker_led.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/blinker_led.o\\\" \\\"blinker_led.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/blinker_led.o"
	@${FIXDEPS} "${OBJECTDIR}/blinker_led.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/delay_16mhz.o: delay_16mhz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay_16mhz.o.d 
	@${RM} ${OBJECTDIR}/delay_16mhz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/delay_16mhz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/delay_16mhz.lst\\\" -e\\\"${OBJECTDIR}/delay_16mhz.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/delay_16mhz.o\\\" \\\"delay_16mhz.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/delay_16mhz.o"
	@${FIXDEPS} "${OBJECTDIR}/delay_16mhz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/delay_4mhz.o: delay_4mhz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay_4mhz.o.d 
	@${RM} ${OBJECTDIR}/delay_4mhz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/delay_4mhz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/delay_4mhz.lst\\\" -e\\\"${OBJECTDIR}/delay_4mhz.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/delay_4mhz.o\\\" \\\"delay_4mhz.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/delay_4mhz.o"
	@${FIXDEPS} "${OBJECTDIR}/delay_4mhz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/uart_sample.o: uart_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart_sample.o.d 
	@${RM} ${OBJECTDIR}/uart_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/uart_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/uart_sample.lst\\\" -e\\\"${OBJECTDIR}/uart_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/uart_sample.o\\\" \\\"uart_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/uart_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/uart_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/i2c_sample.o: i2c_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c_sample.o.d 
	@${RM} ${OBJECTDIR}/i2c_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/i2c_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/i2c_sample.lst\\\" -e\\\"${OBJECTDIR}/i2c_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/i2c_sample.o\\\" \\\"i2c_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/i2c_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/i2c_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/spi_sample.o: spi_sample.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi_sample.o.d 
	@${RM} ${OBJECTDIR}/spi_sample.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/spi_sample.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION) -u  -l\\\"${OBJECTDIR}/spi_sample.lst\\\" -e\\\"${OBJECTDIR}/spi_sample.err\\\" $(ASM_OPTIONS)    -o\\\"${OBJECTDIR}/spi_sample.o\\\" \\\"spi_sample.asm\\\" 
	@${DEP_GEN} -d "${OBJECTDIR}/spi_sample.o"
	@${FIXDEPS} "${OBJECTDIR}/spi_sample.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/picas_12F1822.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
