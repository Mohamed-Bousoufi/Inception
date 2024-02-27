ifeq ($(shell id -u),0)
	sudo := sudo
endif

ifeq ($(shell if [ -d /home/$(id)/data ] ),1)
	@mkdir -p /home/$(shell id)/data/filesdata
	@mkdir -p /home/$(shell id)/data/db_data
endif
	

.PHONY : all clean fclean



all : 
	$(sudo) docker-compose -f src/docker-compose.yml up --build

clean :
	$(sudo) docker-compose -f src/docker-compose.yml down

fclean :
	$(sudo) docker rmi $$(docker images -q) && docker volume rm $$(docker volume ls)



