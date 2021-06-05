SHELL := /bin/bash
.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

force-build: down build up nvim

up:
	docker-compose up -d --build

build:
	docker-compose build --no-cache

down:
	docker-compose down

nvim:
	docker-compose exec neovim bash
