.PHONY: all

all: build run

build:
	ghc -dynamic -outputdir dist main.hs

run:
	./main
