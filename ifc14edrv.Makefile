
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=ifc14edrv
APPSRC:=src

USR_CXXFLAGS = -std=c++0x

SOURCES = $(wildcard $(APPSRC)/*.cpp)
HEADERS = $(wildcard $(APPSRC)/*.h)
