 #----------------------------------------
 #     Prepare flags from make generator
 #----------------------------------------

 include build/conanbuildinfo.mak

 CCFLAGS              += $(CONAN_CFLAGS)
 CXXFLAGS            += $(CONAN_CXXFLAGS)
 CPPFLAGS            += $(addprefix -I, $(CONAN_INCLUDE_DIRS))
 CPPFLAGS            += $(addprefix -D, $(CONAN_DEFINES))
 LDFLAGS             += $(addprefix -L, $(CONAN_LIB_DIRS))
 LDLIBS              += $(addprefix -l, $(CONAN_LIBS))
 EXELINKFLAGS        += $(CONAN_EXELINKFLAGS)

 #----------------------------------------
 #     Make variables for a sample App
 #----------------------------------------

BINARY=oll
CODEDIRS=. src/lib/
INCDIRS=. src/include/ # can be list
#OINCDIRS=. ./openvr/headers/

# automatically add the -I onto each include directory
CFLAGS=-Wall -Wextra -g $(foreach D,$(INCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

# do the exact same thing as the previous command, but only in the openxr directory.
#OFLAGS=-Wall -Wextra -g $(foreach D, $(OINCDIRS), -I$(D)) $(OPT) $(DEPFLAGS) 

# for-style iteration (foreach) and regular expression completions (wildcard)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cpp))
# regular expression replacement
OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))



 #----------------------------------------
 #     Make Rules
 #----------------------------------------

all: $(BINARY)


 $(BINARY): $(OBJECTS)
	g++ $(OBJECTS) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) -lXau -lpthread -ldl -o $(BINARY)
	cp $(BINARY) ./build

 %.o: %.cpp
	g++ -c $(CPPFLAGS) $(CXXFLAGS) $(CFLAGS)  $< -o $@

clean:
	rm -rf $(BINARY) $(OBJECTS) $(DEPFILES)
