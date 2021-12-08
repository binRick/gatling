CC=gcc
BINARY_NAME=gatling
DIST_GITHUB = -I ~/go-bash-bridge/src/dist/github/clibs-flag

SRC=./src
BIN=./bin
DEPS=./deps


#SRCS = $(wildcard deps/*/*.c)
SRCS = $(wildcard $(SRC)/*.c)
CFLAGS = -std=c99 -g -Wall
BUILD_CMD = $(CC) \
	-o $(BIN)/$(BINARY_NAME) \
	$(CFLAGS) \
	$(DIST_GITHUB) \
		$(SRCS)

t:
	@echo "Sources:       $(SRCS)" | bline -o italic:red
	@hr|head -c 40|bline -a green
	@echo -ne "             " 
	@echo "Build Command" | bline -a green:black
	@hr|head -c 40|bline -a light:green:black
	@echo $(BUILD_CMD) | bline -a dark:underline:italic:green
	@hr|head -c 40|bline -a light:green:black

g: gatling

build: gatling

gatling: t
	mkdir -p $(BIN)
	eval $(BUILD_CMD)

clean:
	rm -rf $(BIN)

PREFIX ?=   /usr/local
INSTALL ?=  install
RM ?=       rm

install:
	${INSTALL} -c $(BIN)/$(BINARY_NAME) ${PREFIX}/bin

uninstall:
	${RM} -f ${PREFIX}/bin/$(BINARY_NAME)
