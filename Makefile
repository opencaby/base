new_name?="invalid"

install_dev_env:
	@bash ./scripts/install_dev_env/install_dev_env.sh

clean:
	@bash ./scripts/codegen/clean/clean.sh

.PHONY: install_dev_env clean