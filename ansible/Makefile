PLAYBOOK := dotfiles.yml

.PHONY: default
default: run

include tools/prettier/Makefile

.PHONY: run
run:
	ansible-playbook --inventory='localhost,' --ask-become-pass '$(PLAYBOOK)'

.PHONY: lint
lint: \
	ansible-lint \
	yaml-lint

.PHONY: ansible-lint
ansible-lint:
	ansible-lint '$(PLAYBOOK)'

YAML_FILES := $(shell git ls-files --exclude-standard --cached --others -- '*.yml')

.PHONY: yaml-lint
yaml-lint: $(PRETTIER)
	$(PRETTIER) --check $(YAML_FILES)

.PHONY: yaml-format
yaml-format: $(PRETTIER)
	$(PRETTIER) --write $(YAML_FILES)
