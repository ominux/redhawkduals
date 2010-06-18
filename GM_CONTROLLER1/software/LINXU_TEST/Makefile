CC = gcc

WARN_FLAGS = -Wall 

EXE = test.exe

DEBUG_FLAGS = -g

LIB = -lm

FLAGS = $(DEBUG_FLAGS) $(WARN_FLAGS) 

OBJS = \
ship.o \
draw.o

SRC = \
ship.c \
draw.c

H = \
ship.h \
draw.h

$(EXE): $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o $(EXE) $(LIB)

%.o:%.c $(H)
	$(CC) $(FLAGS) -c $< -o $@ 

clean :
	rm -f *.exe
	rm -f *.o
	rm -f *~
