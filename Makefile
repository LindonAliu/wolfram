##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## FreeKOSOVO
##

NAME		= wolfram

CC			:= ghc

SRCS		=	$(addprefix src/,		\
				$(addsuffix .hs,		\
					ErrorHandling		\
					Rules				\
					Conf				\
					Wolfram				\
					Main))				\

OBJS		= $(SRCS:.hs=.o)

RM			=	rm -f
MV			=	mv

GREEN		= '\033[0;32m'
NO_COLOR	= '\033[0m'

all:	$(NAME)

$(NAME): $(SRCS)
	@$ $(CC) -o $(NAME) $(SRCS)
	@printf "$(CC) -o $(NAME) $(SRCS)\
	["$(GREEN)"COMPILING OK"$(NO_COLOR)"]\n"

clean:
	$(RM) $(OBJS)
	$(RM) src/*.hi

fclean: clean
	$(RM) $(NAME)

tests_run: re

re: fclean all

.PHONY: all clean fclean re
