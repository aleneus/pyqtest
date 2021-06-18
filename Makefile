MODULE = pyqtest.py

help:
	@echo "check"
	@echo "lint"
	@echo "upload"

check: test flake todo lint-e

test:
	nose2

flake:
	flake8 $(MODULE)

lint-e:
	pylint --disable=R,C,W $(MODULE) || true

todo:
	@rgrep "TODO" --include="*py" || true

lint:
	pylint $(MODULE) || true

upload:
	python3 setup.py sdist
	python3 -m twine upload --repository pypi dist/*
