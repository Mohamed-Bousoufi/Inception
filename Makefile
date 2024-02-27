WHOAMI=mbousouf


	

.PHONY : all clean fclean



all :
		ifeq ($(shell id -u),0)
		sudo := sudo
	endif

	ifeq ($(shell [ -d /home/$(id)/data ] ),1)
		@mkdir -p /home/$(WHOAMI)/data/filesdata
		@mkdir -p /home/$(WHOAMI)/data/db_data
	endif
	$(sudo) docker-compose -f src/docker-compose.yml up --build

clean :
	$(sudo) docker-compose -f src/docker-compose.yml down

fclean :
	$(sudo) docker rmi $$(docker images -q) && docker volume rm $$(docker volume ls)



