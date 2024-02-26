SHELL := /bash/bin
sudo = ""
@if [$$(id -u) -eq 0]; then\
	$(sudo)=sudo



.PHONY : all clean fclean


all : 
	$(sudo) docker-compose -f src/docker-compose.yml  up --build

clean :
	$(sudo)docker-compose -f src/docker-compose.yml down

fclean :
	$(sudo)docker rmi $$(docker images -q) && docker volume rm $$(docker volume ls)
