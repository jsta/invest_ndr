env:
	cd ../invest && make env

install:
	-rm ../invest/dist/*.zip
	cd ../invest && make python_packages
	cd ../invest && pip install --upgrade dist/*.zip

# cd ../invest && pip install --upgrade -e .

clean:
	-@rm -rf workspace
	-mkdir workspace
	-touch workspace/.gitkeep

run:
	(PYTHONBREAKPOINT=0 python scripts/run_ndr.py)

debug:
	python scripts/run_ndr.py
