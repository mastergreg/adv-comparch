#TO BE USED WITH LATEX
#TARGET =
#CC = xelatex
#CCFLAGS = -shell-escape
#
#all: $(TARGET).pdf
#
#%.pdf:	%.tex title/* files/*
#	$(CC) $(CCFLAGS) $<
#
#
#.PHONY:	clean all spell
#clean:
#	rm -f $(TARGET).{pdf,log,aux,pyg}
#
#spell:
#	aspell -l el_gr --ignore-case=true -c $(TARGET).tex
#TO BE USED WITH LATEX
TARGET = 
CC = gcc
CCFLAGS +=
OPT = 1

CCFLAGS += -O$(OPT) -Werror -Wall

CCFILES += $(wildcard *.c)
OBJ +=  $(patsubst %.c,%.o,$(CCFILES))
DEPENDS += $(wildcard *.h) 


all: $(TARGET)

$(TARGET): $(OBJ) $(DEPENDS)
	$(CC) $(OBJ) -o $(TARGET)

%.o:	%.c
	$(CC) -c $(CCFLAGS) $< -o $@


.PHONY:	clean all indent
clean:
	rm -f $(OBJ) $(TARGET)
indent:
	astyle --style=linux $(CCFILES)
