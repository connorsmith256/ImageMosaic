.PHONY: all mosaic run clean cleanresized

OS := $(shell uname)

ifeq ($(OS), Darwin)
	g++ := /usr/local/bin/g++-5
else
	g++ := g++
endif

all: clean cleanresized mosaic

mosaic: bin/mosaic.o
bin/mosaic.o: src/*.cpp
	@$(g++) -O3 -std=c++11 src/*.cpp -o bin/mosaic.o -fopenmp

clean:
	@rm -f bin/*

cleanresized:
	@rm -f images_ppms/*resize*

