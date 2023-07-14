.PHONY: build start stop clean

all:
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
	rm -rf ../data/*/*

re: clean all
