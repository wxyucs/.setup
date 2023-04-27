all: !NAME!.run

!NAME!.run: main.cpp
	cc \$^ -o \$@ -std=c++11 -fsanitize=address -lstdc++ -lm
