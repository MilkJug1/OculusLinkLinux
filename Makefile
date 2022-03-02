# Still trying to learn Makefiles at the current moment, so expect this to be really bad. 
COMPILER = g++ 

COMPILER_FLAGS = -w 

all: 
	mkdir oll/src
	mkdir oll/build
	mkdir oll/build/release
	mkdir oll/build/debug 

clean:
	rm -rf oll/build/debug/*.o
	rm -rf oll/build/release/*.o
	rm -rf oll/build/debug/
	rm -rf oll/build/release/
	rm -rf oll/src/ 
	rm -rf oll/build/

debug:
	$(COMPILER) $(COMPILER_FLAGS) -c oll/src/*.cpp -o oll/build/debug/*.o 