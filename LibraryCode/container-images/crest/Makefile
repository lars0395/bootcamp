.PHONY: image

# The binary to build (just the basename).
APP := crest

VERSION ?= "latest"

image:
	docker build -t containerbootcamp/$(APP):$(VERSION) .
	docker push containerbootcamp/$(APP):$(VERSION)