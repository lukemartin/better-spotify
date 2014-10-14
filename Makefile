setup:
	cd src && npm install

start:
	php -S localhost:4141

watch:
	gulp

build:
	rm -rf dist/*
	cp -rf src/index.html dist/
	cp -rf src/partials dist/
	cd src && gulp package

publish:
	git subtree push --prefix dist origin gh-pages