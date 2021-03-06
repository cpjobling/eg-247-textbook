.PHONY: help book clean serve

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to install the necessary dependencies for jupyter-book to build"
	@echo "  book        to convert the content/ folder into Jekyll markdown in _build/"
	@echo "  clean       to clean out site build files"
	@echo "  runall      to run all notebooks in-place, capturing outputs with the notebook"
	@echo "  serve       to serve the repository locally with Jekyll"
	@echo "  build       to build the site HTML and store in _site/"
	@echo "  site 		 to build the site HTML, store in _site/, and serve with Jekyll"


linkcheck:
	jupyter-book build . --builder linkcheck

rebuild:
	make clean
	make build

clean:
	jupyter-book clean .

build:  
	make assets
	jupyter-book build .

site:   
	make clean
	make assets
	jupyter-book build .
	make portfolio
	touch _build/html/.nojekyll
	ghp-import --no-jekyll -p -f ./_build/html

portfolio: FORCE
	rsync -a --delete labs/ portfolio

assets: FORCE
	rsync -av --delete --exclude='*.ipynb' --exclude='*.md' --exclude='.*' --delete-excluded \
	dft \
	dt_systems \
	elementary_signals \
	FAQS \
	fourier_series \
	fourier_transform \
	homework \
	introduction \
	labs \
	laplace_transform \
	setup \
	worksheets \
	_assets
FORCE:
