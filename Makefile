MODULE = pyqtest.py

help:
	@echo "check"
	@echo "lint"

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
