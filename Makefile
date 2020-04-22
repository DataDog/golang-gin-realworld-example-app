all: build

build-tracer_v1:
	docker-compose build tracer_v1

build-notracer:
	docker-compose build notracer

build: build-tracer_v1 build-notracer

publish: build
	docker push registry.ddbuild.io/apm-integrations-testing/handmade/go-gin:1.14.tracer_v1
	docker push registry.ddbuild.io/apm-integrations-testing/handmade/go-gin:1.14.notracer
