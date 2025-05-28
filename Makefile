MODULE = pyqtest.py

check: test flakes lint-only-errors todo

test:
	@nose2 --with-coverage || true

flakes:
	flake8 $(MODULE) || true

lint-only-errors:
	pylint --disable=R,C,W $(MODULE) || true

todo:
	@rgrep "TODO" -n \
		--include="*md" \
		--include="*py" \
		--include="*rst" \
		--exclude-dir=build \
		--exclude-dir=env \
		--exclude="release-checklist.md" \
		|| true

lint:
	pylint $(MODULE) || true

upload:
	python3 setup.py sdist
	python3 -m twine upload --repository pypi dist/*
