CC=gcc
BINARY_NAME=gatling
DIST_GITHUB = -I ~/go-bash-bridge/src/dist/github/clibs-flag
DIST_GITHUB += -I ~/go-bash-bridge/src/dist
DIST_GITHUB_OBJECTS = ~/go-bash-bridge/src/dist/github/kalexey89-libdye/build/release/dye.o
DIST_GITHUB_LIB_PATHS = -L ~/go-bash-bridge/src/dist/github/kalexey89-libdye/build/release
DIST_GITHUB_LIBS = -ldye


SRC=./src
BIN=./bin
DEPS=./deps


#SRCS = $(wildcard deps/*/*.c)
SRCS = $(wildcard $(SRC)/*.c)
CFLAGS = -std=c99 -g -Wall -Wextra
//CFLAGS = -Wall -Wextra -static -std=gnu99
BUILD_CMD = $(CC) \
	-o $(BIN)/$(BINARY_NAME) \
	$(CFLAGS) \
	$(DIST_GITHUB) \
	$(DIST_GITHUB_LIB_PATHS) \
	$(DIST_GITHUB_LIBS) \
	$(DIST_GITHUB_OBJECTS) \
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
