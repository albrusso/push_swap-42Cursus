# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albrusso <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 16:21:18 by albrusso          #+#    #+#              #
#    Updated: 2023/04/19 14:36:14 by albrusso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


################################################################################
#                                  CONFIG                                      #
################################################################################

NAME	=	push_swap
CC		=	gcc
CFLAGS	=	-Wall -Werror -Wextra -g
RM		=	rm -f

################################################################################
#                                  COLORS                                      #
################################################################################

GREEN	=	\033[38;5;76m
RED		=	\033[38;5;160m
YELLOW	=	\033[38;5;226m
ORANGE	=	\033[38;5;202m
PURPLE	=	\033[38;5;213m
LBLUE	=	\033[38;5;51m
BLUE	=	\033[38;5;117m
INDI	=	\033[38;5;99m
RESET	=	\033[00m

################################################################################
#                                   FILES                                      #
################################################################################
SRCS	=	srcs/function_evaluate_two.c \
			srcs/function_evaluate.c     \
			srcs/function_for_order.c    \
			srcs/function_lst_one.c      \
			srcs/function_lst_two.c      \
			srcs/function_utils_two.c    \
			srcs/function_utils.c        \
			srcs/new_argc.c              \
			srcs/rules_push.c            \
			srcs/rules_reverse_rotate.c  \
			srcs/rules_rotate.c          \
			srcs/rules_swap.c            \
			srcs/split_two.c             \
			srcs/split.c                 \
			srcs/table_three.c           \
			srcs/table_two.c             \
			srcs/table.c                 \
			srcs/main.c

S_BONUS	=	bonus/bonus.c                       \
			bonus/function_to_execute_rules.c   \
			srcs/function_evaluate_two.c        \
			srcs/function_evaluate.c            \
			srcs/function_for_order.c           \
			srcs/function_lst_one.c             \
			srcs/function_lst_two.c             \
			srcs/function_utils_two.c           \
			srcs/function_utils.c               \
			srcs/new_argc.c                     \
			srcs/rules_push.c                   \
			srcs/rules_reverse_rotate.c         \
			srcs/rules_rotate.c                 \
			srcs/rules_swap.c                   \
			srcs/split_two.c                    \
			srcs/split.c                        \
			srcs/table_three.c                  \
			srcs/table_two.c                    \
			srcs/table.c                        \
			get_next_line/get_next_line.c       \
			get_next_line/get_next_line_utils.c \


################################################################################
#                                   MAKE                                       #
################################################################################

OBJS	=	$(SRCS:.c=.o)

O_BONUS	=	$(S_BONUS:.c=.o)

all:		header $(NAME)

header:
	@echo "$(ORANGE)Name:$(RESET)    push_swap"
	@echo "$(ORANGE)Author:  $(RESET)albrusso$(RESET)"
	@echo "$(ORANGE)Version: $(RESET)v 1.0$(RESET)"
	@echo

$(NAME):	$(OBJS)
			@ $(CC) $(CFLAGS) $(OBJS) -o $(NAME)
			@echo "$(BLUE)push_swap $(GREEN)compiled!$(RESET)"

bonus:		$(O_BONUS)
			$(CC) $(CFLAGS) $(O_BONUS) -o checker

clean:
			@ $(RM) $(OBJS) $(O_BONUS)
			@echo "$(BLUE)push_swap objects file $(YELLOW)removed!$(RESET)"
			@echo "$(BLUE)checker objects file $(YELLOW)removed!$(RESET)"

fclean:		clean
			@ $(RM) $(NAME)
			@echo "$(BLUE)push_swap $(YELLOW)removed!$(RESET)"
			@echo "$(BLUE)checker $(YELLOW)removed!$(RESET)"

re:			fclean all

PHONY:		all header bonus clean fclean re

.SILENT: