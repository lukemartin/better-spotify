watch:
	gulp

start:
	php -S localhost:4141

build:
	rm -rf dist/*
	cp -rf src/index.html dist/
	cp -rf src/partials dist/
	cd src && gulp package