doker_swarm := $(shell docker node inspect self 2> /dev/null > /dev/null && echo 0 || echo 1)

start:
	@echo $(doker_swarm)
ifeq ($(doker_swarm), 1)
	docker swarm init
endif
	docker stack deploy --compose-file docker-compose.yml monit_stack

swarm_off:
	docker swarm leave --force
