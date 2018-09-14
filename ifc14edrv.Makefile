#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Joao Paulo Martins, Jeong Han Lee
# email   : joaopaulomartins@esss.se, han.lee@esss.se
# Date    : Friday, September 14 16:05:04 CEST 2018
# version : 0.0.2
#
# ifc14edrv repository follows EPICS standard structure
# 

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(where_am_I)/../configure/DECOUPLE_FLAGS


ifneq ($(strip $(NDS3_DEP_VERSION)),)
nds3_VERSION=$(NDS3_DEP_VERSION)
endif


ifneq ($(strip $(IFCDAQDRV2_DEP_VERSION)),)
ifcdaqdrv2_VERSION=$(IFCDAQDRV2_DEP_VERSION)
endif



APP:=ifc14edrv
APP2:=ifc14edrvApp
APPDB:=$(APP2)/Db
APPSRC:=$(APP2)/src


USR_INCLUDES += -I$(where_am_I)$(APPSRC)
USR_CXXFLAGS += -std=c++0x


# USR_CFLAGS   += -Wno-unused-variable
# USR_CFLAGS   += -Wno-unused-function
# USR_CFLAGS   += -Wno-unused-but-set-variable
# USR_CPPFLAGS += -Wno-unused-variable
# USR_CPPFLAGS += -Wno-unused-function
# USR_CPPFLAGS += -Wno-unused-but-set-variable

TEMPLATES += $(wildcard $(APPDB)/*.template)

SOURCES += $(APPSRC)/IFC14AIChannel.cpp
SOURCES += $(APPSRC)/IFC14AIChannelGroup.cpp
SOURCES += $(APPSRC)/IFC14Device.cpp


# db rule is the default in RULES_E3, so add the empty one

db:
