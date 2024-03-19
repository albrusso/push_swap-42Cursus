# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albrusso <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 16:21:18 by albrusso          #+#    #+#              #
#    Updated: 2024/03/19 15:10:16 by albrusso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


################################################################################
#                                  CONFIG                                      #
################################################################################

NAME		=	push_swap
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
OBJ_DIR		=	.obj
SIZE		=	50

################################################################################
#                                  COLORS                                      #
################################################################################

RED			=	\033[1;31m
YELLOW		=	\033[1;33m
BLUE		=	\033[1;34m
GREEN		=	\033[1;32m
WHITE		=	\033[1;37m
DEFAULT		=	\033[0m

################################################################################
#                                   FILES                                      #
################################################################################
SRC			=	mandatory/function_evaluate_two.c \
				mandatory/function_evaluate.c     \
				mandatory/function_for_order.c    \
				mandatory/function_lst_one.c      \
				mandatory/function_lst_two.c      \
				mandatory/function_utils_two.c    \
				mandatory/function_utils.c        \
				mandatory/new_argc.c              \
				mandatory/rules_push.c            \
				mandatory/rules_reverse_rotate.c  \
				mandatory/rules_rotate.c          \
				mandatory/rules_swap.c            \
				mandatory/split_two.c             \
				mandatory/split.c                 \
				mandatory/table_three.c           \
				mandatory/table_two.c             \
				mandatory/table.c                 \
				mandatory/main.c

SRC_BONUS	=	bonus/main_bonus.c                         \
				bonus/function_to_execute_rules_bonus.c    \
				bonus/function_evaluate_two_bonus.c        \
				bonus/function_evaluate_bonus.c            \
				bonus/function_for_order_bonus.c           \
				bonus/function_lst_one_bonus.c             \
				bonus/function_lst_two_bonus.c             \
				bonus/function_utils_two_bonus.c           \
				bonus/function_utils_bonus.c               \
				bonus/new_argc_bonus.c                     \
				bonus/rules_push_bonus.c                   \
				bonus/rules_reverse_rotate_bonus.c         \
				bonus/rules_rotate_bonus.c                 \
				bonus/rules_swap_bonus.c                   \
				bonus/split_two_bonus.c                    \
				bonus/split_bonus.c                        \
				bonus/table_three_bonus.c                  \
				bonus/table_two_bonus.c                    \
				bonus/table_bonus.c                        \
				bonus/gnl/get_next_line.c                  \
				bonus/gnl/get_next_line_utils.c


################################################################################
#                                   MAKE                                       #
################################################################################

OBJ			=	$(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

OBJ_BONUS	=	$(addprefix $(OBJ_DIR)/, $(SRC_BONUS:.c=.o))

all:	$(NAME)
$(NAME): $(OBJ)
	@$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@printf "$(WHITE)%s$(BLUE)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Compiling... " "$<" "[OK]"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)/mandatory
	@mkdir -p $(OBJ_DIR)/bonus
	@mkdir -p $(OBJ_DIR)/bonus/gnl


bonus:		$(OBJ_BONUS)
	@$(CC) $(CFLAGS) $(OBJ_BONUS) -o checker

clean:
	@for file in $(OBJ); do \
		printf "$(WHITE)%s$(YELLOW)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$$file" "[OK]"; \
	done
	@for file in $(OBJ_BONUS); do \
		printf "$(WHITE)%s$(YELLOW)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$$file" "[OK]"; \
	done
	@rm -f $(OBJ)
	@rm -f $(OBJ_BONUS)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@printf "$(WHITE)%s$(RED)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "$(NAME)" "[OK]"
	@printf "$(WHITE)%s$(RED)%-$(SIZE)s$(GREEN)%s$(DEFAULT)\n" "Removing...  " "checker" "[OK]"
	@rm -f $(NAME)
	@rm -f checker

re:			fclean all

PHONY:		all bonus clean fclean re
