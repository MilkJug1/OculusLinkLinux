# Makefile for compiling this project for C++, this wasn't entirely written by me, that was Gabriel Parmer on youtube. Thanks to him! 
BINARY=oll
CODEDIRS=. src/lib/
INCDIRS=. src/include/ # can be list
OINCDIRS=. ./OpenXR-SDK/include/openxr/

CC=g++
OPT=-O0
# generate files that encode make rules for the .h dependencies
DEPFLAGS=-MP -MD
# automatically add the -I onto each include directory
CFLAGS=-Wall -Wextra -g $(foreach D,$(INCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

# do the exact same thing as the previous command, but only in the openxr directory.
CFLAGS=-Wall -Wextra -g $(foreach D, $(OINCDIRS), -I$(D)) $(OPT) $(DEPFLAGS) 

# for-style iteration (foreach) and regular expression completions (wildcard)
CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.cpp))
# regular expression replacement
OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^
	cp $(BINARY) ./build
	
# only want the .cpp file dependency here, thus $< instead of $^.
#
%.o:%.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf $(BINARY) $(OBJECTS) $(DEPFILES)

# shell commands are a set of keystrokes away
distribute: clean
	tar zcvf dist.tgz *

# include the dependencies
-include $(DEPFILES)
