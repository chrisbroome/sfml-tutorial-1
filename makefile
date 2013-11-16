#!/usr/bin/make
# For details on makefile inspiration, see
# http://stackoverflow.com/questions/10455480/makefile-improvements-dependency-generation-not-functioning/

# locations for various files
SRCDIR := ./src
OBJDIR := ./obj
BINDIR := ./bin

SRCEXT := .cc
OBJEXT := .o

TGTNAME := prog1
LIBS    := sfml-graphics sfml-window sfml-system

# the output target
TARGET   := $(BINDIR)/$(TGTNAME)

LIBPATHS := /usr/local/lib/
INCPATHS := /usr/local/include/

CXXFLAGS += -D__DEBUG__
CXXFLAGS += -g3
CXXFLAGS += -Wall
CXXFLAGS += --std=c++0x

INCLUDES := $(addprefix -I, $(INCPATHS))
LDFLAGS  := $(addprefix -L, $(LIBPATHS))
LDLIBS   := $(addprefix -l, $(LIBS))
CXXFLAGS += $(INCLUDES)
CXXFLAGS += -MMD -MP

SRCS := $(wildcard $(SRCDIR)/*$(SRCEXT))
OBJS := $(SRCS:$(SRCDIR)/%$(SRCEXT)=$(OBJDIR)/%$(OBJEXT))
DEPS := $(OBJS:$(OBJDIR)/%$(OBJEXT)=$(OBJDIR)/%.d)

.PHONY: all all-before all-after clean clean-custom run

all: all-before $(TARGET) all-after

clean: clean-custom
	$(RM) $(OBJS) $(DEPS) $(TARGET)

run: $(TARGET)
	@$(TARGET)

$(TARGET): $(OBJS)
	@echo "[LINK] $@"
	@$(CXX) -o $(TARGET) $(OBJS) $(LDLIBS) $(LDFLAGS)

$(OBJDIR)/%$(OBJEXT) : $(SRCDIR)/%$(SRCEXT)
	@echo "[CC] $@"
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

-include $(DEPS)
