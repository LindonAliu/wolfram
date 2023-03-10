##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## FreeKOSOVO
##

NAME		= 		wolfram

SRC			=		$(addprefix src/,		\
					$(addsuffix .hs,		\
						ErrorHandling		\
						Rules				\
						Conf				\
						Wolfram				\
						Main))				\

PATH_BIN	=		$(shell stack path --local-install-root)

all:	$(NAME)

$(NAME):
	stack build
	cp $(PATH_BIN)/bin/$(NAME) .

clean:
	stack purge

fclean: clean
	$(RM) $(NAME)

tests_run: re

re: fclean all

.PHONY: all clean fclean re
