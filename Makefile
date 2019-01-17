.PHONY: build push run kill stop rm shell

IMAGE_BASE = interrobangc
IMAGE = ansible
MY_PWD = $(shell pwd)

all: build

build:
ifdef NOCACHE
	docker build --no-cache -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)
else
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)
endif

push:
	docker push $(IMAGE_BASE)/$(IMAGE)

run:
	docker run --privileged --rm -d -v $(MY_PWD):/app -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup:ro --tmpfs /run --tmpfs /run/lock --name $(IMAGE) $(IMAGE_BASE)$(IMAGE)

kill:
	docker kill $(IMAGE)

stop:
	docker stop $(IMAGE)

rm:
	docker rm -f $(IMAGE)

shell:
	docker exec -it $(IMAGE) bash
