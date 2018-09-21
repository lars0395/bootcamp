.PHONY: image

APP := node-suchen

VERSION ?= "latest"

image:
	docker build -t containerbootcamp/$(APP):$(VERSION) .
	docker push containerbootcamp/$(APP):$(VERSION)