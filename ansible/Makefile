PLAYBOOK_CMD := ansible-playbook --inventory='localhost,' --ask-become-pass

MAIN_PLAYBOOK := dotfiles.yml
LINT_PLAYBOOK := lint.yml

.PHONY: default
default: run

.PHONY: run
run:
	$(PLAYBOOK_CMD) "$(MAIN_PLAYBOOK)"

.PHONY: lint
lint:
	ansible-lint \
	yaml-lint

.PHONY: ansible-lint
ansible-lint:
	ansible-lint "$(MAIN_PLAYBOOK)" "$(LINT_PLAYBOOK)"

YAML_FILES := $(shell git ls-files --exclude-standard --cached --others -- '*.yml')

.PHONY: yaml-lint
yaml-lint:
	$(PLAYBOOK_CMD) "$(LINT_PLAYBOOK)"
	prettier --format yaml --check $(YAML_FILES)
