doker_swarm := $(shell docker node inspect self 2> /dev/null > /dev/null && echo 0 || echo 1)
#folder := /nagios/etc /nagios/var /nagios/plugins/nagios/graph/var /nagios/graph/etc

start:

	for folder in /nagios/etc /nagios/var /nagios/plugins nagios/graph/var /nagios/graph/etc; do \
  		sudo mkdir -p $$folder ; \
	done
	
	#/nagios/etc && mkdir -p /nagios/var && mkdir -p /nagios/plugins && mkdir -p /nagios/graph/var && mkdir -p /nagios/graph/etc
	@echo $(doker_swarm)
ifeq ($(doker_swarm), 1)
	docker swarm init
endif
	docker stack deploy --compose-file docker-compose.yml monit_stack


swarm_off:
	docker swarm leave --force