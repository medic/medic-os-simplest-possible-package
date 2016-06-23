
all: simplest-possible

simplest-possible:
	./scripts/build-package simplest-possible 10000

clean:
	rm -f output/packages/* staging/packages/*/*

