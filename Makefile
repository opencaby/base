new_name?="invalid"


install_dev_env:
	@bash ./scripts/install_dev_env/install_dev_env.sh

clean:
	@bash ./scripts/codegen/clean/clean.sh

proto: ## Generate source code from protos
	@bash ./scripts/codegen/generate_code_from_proto.sh


.PHONY: install_dev_env clean