SHELL := /bin/bash

# Start

all: config bash installgitflow
.PHONY: all

all_golang: golang_playbook pyenv pyenv_virtenv python_venv precom_tool3
.PHONY: all_golang

# Local

.PHONY: config
config:
	@git config --global --add safe.directory '*'

.PHONY: bash
bash:
	@echo "=========== [BASH PROFILE] ==========="
	echo "alias m=make" >> ~/.bashrc
	source ~/.bashrc

.PHONY: installgitflow
installgitflow:
	@echo "=========== [GIT FLOW INSTALL] ==========="
	sudo apt-get update
	sudo apt-get install git-flow

.DEFAULT_GOAL := all

GOPATH := $(shell go env GOPATH)
HOMEPATH :=  $(HOME)
USERLOGGED :=  $(USER)

.PHONY: golang_playbook
golang_playbook:
	@echo "=========== [GOLANG PLAYBOOK INSTALLATION] ==========="
	env GO111MODULE=on
	go install github.com/gopherdata/gophernotes@v0.7.5
	mkdir -p $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes
	sudo cp $(GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes/
	sudo chown $(USER):$(USER) $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes/kernel.json
	sudo chmod +w $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes/kernel.json
	sudo sed "s|gophernotes|$(GOPATH)/bin/gophernotes|" < $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes/kernel.json.in > $(HOMEPATH)/.local/share/jupyter/kernels/gophernotes/kernel.json

.PHONY: pyenv
pyenv:
	@echo "=========== [PYENV - PRE REQUISIT] ==========="
	rm -rf ~/.pyenv
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	@echo "[PYENV - BASH]"
	echo '# PYENV VARIABLES' >> ~/.bashrc
	echo 'export PYENV_ROOT="$(HOME)/.pyenv"' >> ~/.bashrc
	echo 'command -v pyenv >/dev/null || export PATH="$(PYENV_ROOT)/bin:$(PATH)"' >> ~/.bashrc
	echo 'eval "$$(pyenv init -)"' >> ~/.bashrc
	@echo "[PYENV - PROFILE]"
	echo '# PYENV VARIABLES' >> ~/.profile
	echo 'export PYENV_ROOT="$(HOME)/.pyenv"' >> ~/.profile
	echo 'command -v pyenv >/dev/null || export PATH="$(PYENV_ROOT)/bin:$(PATH)"' >> ~/.profile
	echo 'eval "$$(pyenv init -)"' >> ~/.profile
	
.PHONY: pyenv_virtenv
pyenv_virtenv:
	@echo "=========== [PYENV - VIRTUAL ENVIRONMENT] ==========="
	git clone https://github.com/pyenv/pyenv-virtualenv.git $(PYENV_ROOT)/plugins/pyenv-virtualenv
	@echo "[PYENV - BASH]"
	echo '## pyenv Module virtualenv' >> ~/.bashrc
	echo 'eval "$$(pyenv virtualenv-init -)"' >> ~/.bashrc
	@echo "[PYENV - PROFILE]"
	echo '## pyenv Module virtualenv' >> ~/.profile
	echo 'eval "$$(pyenv virtualenv-init -)"' >> ~/.profile

.PHONY: python_venv
python_venv:
	@echo "=========== [PYTHON VIRTUAL ENVIRONMENT] ==========="
	pyenv install	3.9.16
	pyenv virtualenv 3.9.16 kodekloud_env

.PHONY: precom_tool3
precom_tool3:
	@echo "=========== [PRE-COMMIT & TOOL3 INSTALL - WEBHOOK] ==========="
	pip install pre-commit
	pre-commit install