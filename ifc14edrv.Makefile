
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=ifc14edrv
APPSRC:=src
APPINC:=include	

USR_CXXFLAGS = -std=c++0x

# WHY $(APPINC) DONT WORK???
# USR_INCLUDES += -Iinclude

SOURCES = $(wildcard src/*.cpp)

