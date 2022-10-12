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
 CC 		     = g++

 #----------------------------------------
 #     Make variables for a sample App
 #----------------------------------------

BINARY=oll
CODEDIRS=. src/ # look in both the `src` dir and in the `src/driver`
DRIVERDIR=. src/driver/
INCDIRS=. "src/include/", "src/OpenXR-SDK/include", "src/driver/include"# can be list

# automatically add the -I onto each include directory
CFLAGS=-Wall -Wextra -g -std=c++20 $(foreach D,$(INCDIRS),-I$(D)) $(foreach D,$(OINCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

# for-style iteration (foreach) and regular expression completions (wildcard)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cc))
DFILES=$(foreach D,$(DRIVERDIR), $(wildcard $(D)/*.cc)) 
# regular expression replacement
OBJECTS=$(patsubst %.cc,%.o,$(CFILES))
DEPFILES=$(patsubst %.cc,%.d,$(CFILES))

DOBJ=$(patsubst $.cc,%.o,$(DFILES))
DDEPFILE=$(patsubst %.cc,%.d,$(DFILES))



 #----------------------------------------
 #     Make Rules
 #----------------------------------------

all: $(BINARY)


 $(BINARY): $(OBJECTS)
	$(CC) $(OBJECTS) $(DOBJ) $(CXXFLAGS) $(LDFLAGS) $(LDLIBS) -lXau -lpthread -ldl -ludev -o $(BINARY)
	mv $(BINARY) build/
	#rm -rf $(OBJECTS) $(DEPFILES)

 %.o: %.cpp %.cc
	(CC) -c $(CPPFLAGS) $(CXXFLAGS) $(CFLAGS)  $< -o $@


clean:
	rm -rf $(BINARY) 
	rm -rf $(OBJECTS)
	rm -rf $(DEPFILES)

