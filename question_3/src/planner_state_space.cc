#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include "boost/multi_array.hpp"


int width=7;
int height=8;
boost::multi_array<int, 2> gameboard(boost::extents[height][width]);
int robot_x, robot_y;

typedef struct
{
    int x;
    int y;
} position;

typedef struct
{
    position _position;
    int cost;
} valid_moves;

position robot_position;
position goal_position;
position box_position;

void printBoard(void);
void makeBoard(void);
int checkRules(int m, int n);
int calculateCost(int m, int n);
void makeMove(position pos1, position pos2);
void initBoard(void);
int generateMove(void);

void printBoard()
{
    for (int m=0; m<height; m++)
    {
       for (int n=0; n<width; n++)
       {
           
           switch (gameboard[m][n])
	   {
               case 0: std::cout << ' ' ; break;
               case 1: std::cout << "|" ;break;
               case 2: 
               case 3:
               case 4: std::cout << 'X'  ; break;
               case 5: std::cout << "R"  ; break;
               case 6: std::cout << "G"  ; break;
           }
           std::cout << "  ";
       }
       std::cout << std::endl;
    }
}

void makeBoard()
{
   
};

int checkRules(int m, int n)
{
    std::cout << "Checking Validity .." << std::endl;     
    std::cout << "m: " << m << "n: " << n << std::endl;
    if ( (gameboard[m][n] == 0) || (gameboard[m][n] >=5) ) return 1;
    else return 0;
}

int calculateCost(int m, int n)
{
    int cost = (width) * (height) - (sqrt((goal_position.y-m)^2 + (goal_position.x-n)^2));  
}

void makeMove(position pos1, position pos2)
{
    gameboard[pos2.y][pos2.x] = 5;
    gameboard[pos1.y][pos1.x] = 0;
    robot_position = pos2; 
}

int generateMove()
{
     valid_moves _valid_moves[4];
     position move;
     move.x = robot_position.x;
     move.y = robot_position.y;
     int nValid;
     std::cout << "Generating Move .. " << std::endl;
     std::cout << "m: " << robot_position.x << "n: " << robot_position.y << std::endl;
     if (checkRules(robot_position.y,robot_position.x +1))
          {
             std::cout << "Going one right" << std::endl; move.x++; return 1;
             makeMove(robot_position, move);
             //gameboard[robot_y][robot_x + 1] = 5; gameboard[robot_y][robot_x] = 0; robot_x++; return 1;
          }
     if (checkRules(robot_position.y+1,robot_position.x))
          {
             std::cout << "Going one up" << std::endl; move.y ++; return 1;
             makeMove(robot_position, move);
             //gameboard[robot_y+1][robot_x] = 5; gameboard[robot_y][robot_x] = 0;robot_y++; return 1;
          }             
     if (checkRules(robot_position.y,robot_position.x-1))
          {
             std::cout<< "Going one left" << std::endl; move.x --;
             makeMove(robot_position, move);
             //gameboard[robot_y][robot_x-1] = 5; gameboard[robot_y][robot_x] = 0; robot_x--; return 1;
          } 
     if (checkRules(robot_position.y-1, robot_position.x))
          {
             std::cout<< "Going one down" << std::endl; move.y --;
	     makeMove(robot_position,move);
             //gameboard[robot_y-1][robot_x] = 5; gameboard[robot_y][robot_x] =0; robot_y--; return 1;
          }
     return 0; 
}

void initBoard()
{
     int m,n;
     int temp[8][7] = {
                    {0,0,1,1,1,1,0},
		    {0,0,1,0,0,1,0},
		    {1,1,1,2,0,1,0},
		    {1,0,3,0,0,5,1},
		    {1,0,6,6,6,0,1},
		    {1,1,4,0,0,1,1},
		    {0,1,0,0,1,1,0},
		    {0,1,1,1,1,0,0}};
     for (m=0; m< height; m++)
         for (n=0; n<width; n++)
	      gameboard[m][n] = temp[m][n];
     robot_position.x = 5; robot_position.y = 3; 
}

int main()
{
   makeBoard();
   initBoard();
   //while (generateMove())   printBoard();
   generateMove(); printBoard();
   return 0;
} 
