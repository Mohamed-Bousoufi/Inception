
SETUP = ./src/requirements/pre/setup.sh
.PHONY : all clean fclean



all :
	
	$(SETUP) && docker-compose -f src/docker-compose.yml up --build

clean :
	docker-compose -f src/docker-compose.yml down

fclean :
	docker rmi  $$(docker images -q) && docker volume rm  $$(docker volume ls)



