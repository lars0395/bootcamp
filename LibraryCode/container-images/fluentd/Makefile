.PHONY: image

APP := kubernetes-fluentd

REPO ?= quay.io/fakod

VERSION ?= "latest"

image:
	docker build -t $(REPO)/$(APP):$(VERSION) .
	docker push $(REPO)/$(APP):$(VERSION)