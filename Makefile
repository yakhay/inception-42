all :
	mkdir -p /home/yakhay/data/word
	mkdir -p /home/yakhay/data/db
	docker-compose -f ./srcs/docker-compose.yml build

run :
	docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down

re: clean run

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

restart: stop start

rmv:
	sudo rm -rf /home/yakhay/data/word
	sudo rm -rf /home/yakhay/data/db
	docker system prune -af

fclean: clean rmv
