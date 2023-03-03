SHELL := /bin/bash

# Start

all : config bash installgitflow golang_playbook
.PHONY : all

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