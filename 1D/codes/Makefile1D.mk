CC			=g++-13
CFLAGS		=-c -Wall -O4 -fopenmp -std=c++17 -I/usr/local/include/eigen3 -I/usr/local/include/
LDFLAGS		=-fopenmp -std=c++17 -I../
SOURCES		=./main.cpp
OBJECTS		=$(SOURCES:.cpp=.o)

DTYPE_FLAG  = -DUSE_real -DUSE_nHODLRdD # DUSE_nHODLRdD (nested) or -DUSE_snHODLRdD (semi-nested) 
# DTYPE_FLAG  = -DUSE_Complex # DUSE_nHODLRdD or -DUSE_snHODLRdD

EXECUTABLE	=./test

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
		$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
		$(CC) $(CFLAGS) $(DTYPE_FLAG) $< -o $@

clean:
	rm test *.o