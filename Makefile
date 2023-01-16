 #----------------------------------------
 #     Prepare flags from make generator
 #----------------------------------------

 -include build/conanbuildinfo.mak

 CCFLAGS              += $(CONAN_CFLAGS)
 CXXFLAGS            += $(CONAN_CXXFLAGS) 
 CPPFLAGS            += $(addprefix -I, $(CONAN_INCLUDE_DIRS))
 CPPFLAGS            += $(addprefix -D, $(CONAN_DEFINES))
 LDFLAGS             += $(addprefix -L, $(CONAN_LIB_DIRS))
 LDLIBS              += $(addprefix -l, $(CONAN_LIBS))
 EXELINKFLAGS        += $(CONAN_EXELINKFLAGS)
 CC 		     = g++

MAKEFLAGS = -j$(nproc) # use most if not all of your cpu cores to build, get set when running make build deps
 #----------------------------------------
 #     Make variables for a sample App
 #----------------------------------------

BINARY=oll
CODEDIRS = src/ # Set CODEDIRS to the src dir that way it can look inside of there for .cc files
CODEDIRS += src/driver/# append the driver path to it so it will also look inside of the driver dir
INCDIRS = 'src/include/' #VariabLe that has the path to the include dir, so that the compiler can look inside of it
INCDIRS += 'src/OpenXR-SDK/include/' # Append OpenXR's include path so we can also look inside of there too, even tho OpenXR may not be used here
INCDIRS += 'src/driver/include' # Also append the include dir inside of the driver/ folder

# automatically add the -I onto each include directory
CFLAGS=-Wall -Wextra -g -std=c++20 $(foreach D,$(INCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

# for-style iteration (foreach) and regular expression completions (wildcard)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cc))
# DFILES=$(foreach D,$(DRIVERDIR), $(wildcard $(D)/*.cc)) 
# regular expression replacement
OBJECTS=$(patsubst %.cc,%.o,$(CFILES))
DEPFILES=$(patsubst %.cc,%.d,$(CFILES))

 #----------------------------------------
 #     Make Rules
 #----------------------------------------

all: $(BINARY)

deps:
	conan install . -if build/ 

builddeps: 
	conan install . -if build/ --build


 $(BINARY): $(OBJECTS)
	$(CC) $(OBJECTS) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) -lXau -lpthread -ldl -ludev -o $(BINARY)
	mv $(BINARY) build/
	rm -rf $(OBJECTS) $(DEPFILES)

 %.o: %.cpp %.cc
	(CC) -c $(CPPFLAGS) $(CXXFLAGS) $(CFLAGS)  $< -o $@


clean:
	rm -rf $(BINARY) 
	rm -rf $(OBJECTS)
	rm -rf $(DEPFILES)

