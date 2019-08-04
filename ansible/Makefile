PLAYBOOK := dotfiles.yml

.PHONY: default
default: run

.PHONY: run
run:
	ansible-playbook --inventory='localhost,' --ask-become-pass "$(PLAYBOOK)"

.PHONY: lint
lint:
	ansible-lint "$(PLAYBOOK)"
