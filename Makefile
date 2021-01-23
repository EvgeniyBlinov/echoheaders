all: push

# TAG 0.0 shouldn't clobber any release builds
TAG = 1.4
PREFIX = echoserver-logs

container:
	docker build --pull -t $(PREFIX):$(TAG)-$$(git rev-parse --short HEAD) .

push: container
	docker -- push $(PREFIX):$(TAG)-$$(git rev-parse --short HEAD)
