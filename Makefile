# simple makefile to simplify repetitive build env management tasks under posix

# caution: testing won't work on windows, see README

PYTHON ?= python
CYTHON ?= cython
PYTEST ?= pytest

all: clean install #test

clean:
	$(PYTHON) setup.py clean
	rm -rf dist

install:
	$(PYTHON) setup.py install -v

in: inplace # just a shortcut
inplace:
	$(PYTHON) setup.py build_ext -i

test-code: in
	$(PYTEST) --showlocals -v rit --durations=20

test-code-parallel: in
	$(PYTEST) -n auto --showlocals -v rit --durations=20

test: test-code

trailing-spaces:
	find rit -name "*.py" -exec perl -pi -e 's/[ \t]*$$//' {} \;

cython:
	python setup.py build_src 