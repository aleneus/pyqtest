MODULE = pyqtest.py

help:
	@echo "check"
	@echo "lint"
	@echo "upload"

check: test flake fixme lint-e

test:
	nose2

flake:
	flake8 $(MODULE)

lint-e:
	pylint --disable=R,C,W $(MODULE) || true

fixme:
	@rgrep "TODO" -n \
		--include="*py" \
		--include="*rst"\
		--exclude="release-checklist.md"\
		--exclude-dir=env \
		--exclude-dir=wenv \
		|| true

	@rgrep "# REF" -n \
		--include="*py" \
		--exclude="release-checklist.md" \
		|| true

lint:
	pylint $(MODULE) || true

upload:
	python3 setup.py sdist
	python3 -m twine upload --repository pypi dist/*
