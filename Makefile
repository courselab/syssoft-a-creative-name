CC = gcc
CFLAGS = -m32 -fpic
SOFLAGS = -m32 --shared
SRC = ronaldinho.c
OBJ = $(SRC:.c=.o)
SHARED_LIB = libronaldinho.so

$(SHARED_LIB): $(OBJ)
	$(CC) $(SOFLAGS) $(OBJ) -o $(SHARED_LIB)

run: $(SHARED_LIB)
	LD_PRELOAD=$(SHARED_LIB) ./docrypt $(FILE) $(KEY)

%.o: %.c
	$(CC) -c $(CFLAGS) $(SRC)

clean:
	rm -f $(OBJ) $(SHARED_LIB)
