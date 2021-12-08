CC=gcc
BINARY_NAME=gatling
SRC=./src
BIN=./bin

gatling:
	mkdir -p $(BIN)
	$(CC) -Wall -o $(BIN)/$(BINARY_NAME) \
		$(SRC)/gatling.c \
		$(SRC)/hashmap.c \
		$(SRC)/subscriptions.c \
		$(SRC)/protocol.c \
		$(SRC)/chan.c \
		$(SRC)/queue.c

clean:
	rm -rf $(BIN)

PREFIX ?=   /usr/local
INSTALL ?=  install
RM ?=       rm

install:
	${INSTALL} -c $(BIN)/$(BINARY_NAME) ${PREFIX}/bin

uninstall:
	${RM} -f ${PREFIX}/bin/$(BINARY_NAME)
