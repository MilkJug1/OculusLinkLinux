#----------------------------------------
#     Prepare flags from make generator
#----------------------------------------

-include build/conanbuildinfo.mak

CCFLAGS += $(CONAN_CFLAGS)
CXXFLAGS += $(CONAN_CXXFLAGS)
CPPFLAGS += $(addprefix -I, $(CONAN_INCLUDE_DIRS))
CPPFLAGS += $(addprefix -D, $(CONAN_DEFINES))
LDFLAGS += $(addprefix -L, $(CONAN_LIB_DIRS))
LDLIBS += $(addprefix -l, $(CONAN_LIBS))
EXELINKFLAGS += $(CONAN_EXELINKFLAGS)
CC = g++

#----------------------------------------
#     Make variables for a sample App
#----------------------------------------

BINARY = oll
OBJDIR = src/obj
CODEDIRS = src/ src/driver/
INCDIRS = 'src/include/' 'src/OpenXR-SDK/include/' 'src/driver/include'

CFLAGS = -Wall -Wextra -g -std=c++20 $(foreach D,$(INCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

CFILES = $(foreach D,$(CODEDIRS),$(wildcard $(D)*.cc))
OBJECTS = $(CFILES:src/%.cc=$(OBJDIR)/%.o)
DEPFILES = $(CFILES:src/%.cc=$(OBJDIR)/%.d)

#----------------------------------------
#     Make Rules
#----------------------------------------

all: $(BINARY)

deps:
	conan install . -if build/

builddeps:
	@if [ ! -d "build" ]; then \
		echo "Error: build directory does not exist."; \
		false; \
	else \
		conan install . -if build/ --build; \
	fi


$(BINARY): $(OBJECTS)
	@if [ -z "$(OBJECTS)" ]; then \
		echo "Error: OBJECTS variable is not set or empty."; \
		false; \
	elif [ -z "$(BINARY)" ]; then \
		echo "Error: BINARY variable is not set or empty."; \
		false; \
	else \
		$(CC) $(OBJECTS) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) -o $(BINARY); \
		mv $(BINARY) build/; \
		rm -rf $(OBJDIR)/*; \
	fi


$(OBJDIR)/%.o: src/%.cc
	@if [ -z "$<" ]; then \
		echo "Error: Source file variable $< is empty, missing source file."; \
		false; \
	else \
		@mkdir -p $(@D); \
		$(CC) -c $(CPPFLAGS) $(CXXFLAGS) $(CFLAGS) $< -o $@; \
	fi


clean:
	@if [ -z "$(BINARY)" ]; then \
		echo "Error: BINARY variable is not set."; \
		false; \
	elif [ -z "$(OBJDIR)" ]; then \
		echo "Error: OBJDIR variable is not set."; \
		false; \
	else \
		rm -rf build/$(BINARY); \
		rm -rf $(OBJDIR)/*; \
	echo "Cleaned up."; \
	fi


