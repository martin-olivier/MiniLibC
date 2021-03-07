##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

SRC		=		src/strlen.asm			\
				src/strcmp.asm			\
				src/strncmp.asm			\
				src/strchr.asm			\
				src/rindex.asm			\
				src/memset.asm			\
				src/memcpy.asm			\
				src/memmove.asm			\
				src/strcasecmp.asm		\
				src/strcspn.asm			\
				src/strpbrk.asm			\
				src/strstr.asm			\

OBJ		= 		$(SRC:.asm=.o)

LFLAGS	=    	-L./ -lasm

NAME 	= 		libasm.so

%.o: %.asm
	nasm -f elf64 $<

all: $(OBJ)
	ld -fPIC -shared $(OBJ) -o $(NAME)
	rm src/*.o

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)

re: fclean all

auteur:
	echo $(USER) > auteur

.PHONY: all clean fclean re