%{
#include <stdio.h>
#include <stdlib.h>

int balance = 1000;
int is_logged_in = 0;
int pin = 1234;

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int num;
}

%token LOGIN LOGOUT WITHDRAW DEPOSIT BALANCE
%token <num> NUMBER

%%
session:
    | session command
    ;

command:
      LOGIN NUMBER {
            if ($2 == pin) {
                if (is_logged_in)
                    printf("Already logged in.\n");
                else {
                    is_logged_in = 1;
                    printf("Login successful.\n");
                }
            } else {
                printf("Invalid PIN.\n");
            }
      }
    | LOGOUT {
            if (is_logged_in) {
                is_logged_in = 0;
                printf("Logged out.\n");
            } else {
                printf("You are not logged in.\n");
            }
      }
    | BALANCE {
            if (is_logged_in)
                printf("Current balance: %d\n", balance);
            else
                printf("Login required to view balance.\n");
      }
    | WITHDRAW NUMBER {
            if (is_logged_in) {
                if ($2 <= balance) {
                    balance -= $2;
                    printf("Withdrawn: %d\n", $2);
                } else {
                    printf("Insufficient balance.\n");
                }
            } else {
                printf("Login required to withdraw.\n");
            }
      }
    | DEPOSIT NUMBER {
            if (is_logged_in) {
                balance += $2;
                printf("Deposited: %d\n", $2);
            } else {
                printf("Login required to deposit.\n");
            }
      }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Welcome to the ATM Simulator\n");
    yyparse();
    return 0;
}

