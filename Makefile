env:
	cd ../invest && make env

install:
	cd ../invest && make python_packages
	cd ../invest && pip install dist/*.zip

clean:
	-@rm -rf workspace
	-mkdir workspace
	-touch workspace/.gitkeep
