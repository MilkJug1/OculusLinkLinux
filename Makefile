CC = g++

COMPILER_FLAGS = -w


MYDIR=build/test
[ -d $(MYDIR) ] || mkdir -p $(MYDIR)

all:
	$(MYDIR)