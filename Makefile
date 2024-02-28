.PHONY : all clean fclean

SETUP = ./src/requirements/tools/setup.sh



all :
	
	$(SETUP) && docker-compose -f src/docker-compose.yml up --build

clean :
	docker-compose -f src/docker-compose.yml down

fclean :
	docker rmi  $$(docker images -q) && docker volume rm  $$(docker volume ls -q)



