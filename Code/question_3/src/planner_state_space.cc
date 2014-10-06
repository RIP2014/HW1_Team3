#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include "boost/multi_array.hpp"
#include "boost/heap/fibonacci_heap.hpp"
#include <thread>
#include <stack>
#include <mutex>
#include "sokobanplanner.h"

bool verbose = false;
uint64_t iteration =0;

class varunPlanner
{
public:
private:
};

int width=7;
int height=8;

int var_width;
int var_height;

boost::multi_array<int, 2> gameboard(boost::extents[height][width]);





int gains[] = {8,1,1};


struct state_compare
{
    bool operator()(const state& m1, const state& m2) const
    {
        if (m1.gameboard == m2.gameboard) return 0;
        else return m1.cost > m2.cost;
    }
};



struct _compare
{
    bool operator()(const state& m1, const state& m2) const
    {
        if (m1.gameboard == m2.gameboard) return 0;
        else return 1;
    }
};


boost::heap::fibonacci_heap<state, boost::heap::compare<state_compare> > state_frontier;
std::mutex state_frontier_mutex;
std::set<state, _compare> searched;

boost::heap::fibonacci_heap<state, boost::heap::compare<state_compare>> explored;
std::mutex explored_mutex;

//boost::heap::fibonacci_heap<valid_moves, boost::heap::compare<_compare> > frontier;
//valid_moves _valid_moves;
position robot_position;
position goal_position[3];
std::mutex goal_position_mutex;


int calculateCost(position _pos);
void makeMove(position pos1, position pos2);
void initBoard(void);
int generateMove(void);
void printBoard(state gameboard);
//bool heap_search(valid_moves _valid);


/*
bool heap_search(valid_moves _valid)
{
    valid_moves check;
    for (auto it=frontier.begin(); it!=frontier.end(); ++it)
    {
        check = *it;
        if ((check._position.x == _valid._position.x) && (check._position.y == _valid._position.y) && (check.cost == _valid.cost) ) return 1;
    }
    return 0;
}*/

bool heap_search_state(state currentState)
{
    //state check;
    //check.gameboard.resize(boost::extents[height][width]);
    auto it = std::find(state_frontier.begin(), state_frontier.end(), currentState);
    if (it != state_frontier.end())     return 1;
    else return 0;

    //return 1;
    //else return 0;
    //state_frontier_mutex.lock();
    //std::cout << "Locked Mutex" << std::endl;
    //for (auto it=state_frontier.begin(); it!= state_frontier.end(); ++it)
    //{
    //    check = *it;
    //    if (check.gameboard == currentState.gameboard) {return 1;}
    //}
    //state_frontier_mutex.unlock();
    //std::cout << "Unlocked Mutex" << std::endl;
    //return 0;
}

bool check_explored(state currentState)
{
    //state check;
    //check.gameboard.resize(boost::extents[height][width]);
    auto it= std::find(explored.begin(), explored.end(), currentState);
    if (it != explored.end()) return 1;
    else return 0;
    //for (auto it=explored.begin(); it!= explored.end(); ++it)
    //{
    //    check = *it;
    //    if (check.gameboard == currentState.gameboard) {return 1;}
    //}
    //return 0;
}


void printBoard(state gameboard)
{
    //std::cout << "Iteration: " << iteration << std::endl;
    for (int m=0; m<height; m++)
    {
       for (int n=0; n<width; n++)
       {
           
           switch (gameboard.gameboard[m][n])
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
    std::cout << std::endl; iteration ++;
}

void printFrontier()
{
    std::cout << "Frontier: " << std::endl;
    for (auto it=state_frontier.ordered_begin(); it!=state_frontier.ordered_end(); ++it)
    {
        printBoard(*it);
    }
}

void printExplored()
{
    std::cout << "Explored: " << std::endl;
    for (auto it=explored.ordered_begin(); it!=explored.ordered_end(); ++it)
    {
        printBoard(*it);
    }
}



int checkRules(state currentState, int m, int n)
{
    //std::cout << "Checking rules.... " << std::endl;
    //printBoard(currentState);
    int dir_x = n - currentState.robot_position.x;
    int dir_y = m - currentState.robot_position.y;
    //std::cout << "Robot X: " << currentState.robot_position.x << "Robot Y: " << currentState.robot_position.y << std::endl;
    //std::cout << "Checking X: " << n << "Checking Y: " << m << std::endl;
    //std::cout << "Adjacent to move X: " << n+dir_x << "Y: " << m+dir_y << std::endl;

    if (verbose) std::cout << "Checking Validity .." << std::endl;     
    if (verbose) std::cout << "m: " << m << "n: " << n << std::endl;
    if ( (currentState.gameboard[m][n] == 0) || (currentState.gameboard[m][n] >=5) ) return 1;
    else if (currentState.gameboard[m][n] == 2 && currentState.gameboard[m+dir_y][n+dir_x]==0)  {return 1;}
    else if (currentState.gameboard[m][n] == 3 && currentState.gameboard[m+dir_y][n+dir_x]==0)  {return 1;}
    else if (currentState.gameboard[m][n] == 4 && currentState.gameboard[m+dir_y][n+dir_x]==0)  {return 1;}
    else return 0;
}


int calculateCost(state currentState)
{
    //std::cout << "Starte calculating cost" << std::endl;
    //return 100;
    uint32_t cost;
    for (int i=0; i<3; i++)
    {
        //for (int j=0; j<3; j++)
        //{
            //cost += gains[1] * (goal_position[i].y-currentState.robot_position.y + goal_position[i].x-currentState.robot_position.x);
            //cost += gains[0] * (goal_position[i].y-currentState.box_position[i].y + goal_position[i].x-currentState.box_position[i].x);
        //}
    }
    //std::cout << "Done calculating cost" << std::endl;
    cost += currentState.cost;
    //cost += gains[2] * currentState.nBranch;
    //std::cout << "Done calculating cost" << std::endl;
    return cost;
}

void makeMove(state * currentState, position pos1, position pos2)
{
   // std::cout << "Moving .. " << std::endl;
   // std::cout << "Robot Position X: " << currentState->robot_position.x << std::endl;
   // std::cout << "Cost: " << currentState->cost << std::endl;
    printBoard(*currentState);
    currentState->plan.push(pos2);
    //currentState->nBranch ++;
    if (currentState->gameboard[pos2.y][pos2.x] == 0)
	{
        currentState->gameboard[pos2.y][pos2.x] = 5;
        currentState->gameboard[pos1.y][pos1.x] = 0;
        currentState->robot_position = pos2;
	}
    else if (currentState->gameboard[pos2.y][pos2.x] == 2)
	{
        currentState->gameboard[pos2.y][pos2.x] = 5;
        currentState->gameboard[pos1.y][pos1.x] = 0;
        currentState->robot_position = pos2;
        currentState->gameboard[pos2.y + (pos2.y-pos1.y)][pos2.x + (pos2.x-pos1.x)] = 2;
        currentState->box_position[0].y = pos2.y + (pos2.y-pos1.y);
        currentState->box_position[0].x = pos2.x + (pos2.x-pos1.x);
	}
    else if (currentState->gameboard[pos2.y][pos2.x] == 3)
    {
        currentState->gameboard[pos2.y][pos2.x] = 5;
        currentState->gameboard[pos1.y][pos1.x] = 0;
        currentState->robot_position = pos2;
        currentState->gameboard[pos2.y + (pos2.y-pos1.y)][pos2.x + (pos2.x-pos1.x)] = 3;
        currentState->box_position[1].y = pos2.y + (pos2.y-pos1.y);
        currentState->box_position[1].x = pos2.x + (pos2.x-pos1.x);
    }
    else if (currentState->gameboard[pos2.y][pos2.x] == 4)
    {
        currentState->gameboard[pos2.y][pos2.x] = 5;
        currentState->gameboard[pos1.y][pos1.x] = 0;
        currentState->robot_position = pos2;
        currentState->gameboard[pos2.y + (pos2.y-pos1.y)][pos2.x + (pos2.x-pos1.x)] = 4;
        currentState->box_position[2].y = pos2.y + (pos2.y-pos1.y);
        currentState->box_position[2].x = pos2.x + (pos2.x-pos1.x);
    }
    //std::cout << "Done moving" << std::endl;
    //printBoard(*currentState);
}

void copyState(state * fromState, state * toState)
{
    toState->gameboard.resize(boost::extents[height][width]);
    toState = fromState;
    /*
    fromState->gameboard.resize(boost::extents[height][width]);
    fromState->cost = toState->cost;
    fromState->robot_position = toState->robot_position;
    fromState->box_position[0]   = toState->box_position[0];
    fromState->box_position[1]   = toState->box_position[1];
    fromState->box_position[2]   = toState->box_position[2];
    fromState->gameboard = toState->gameboard;
    /*for (int i=0; i<height; i++)
            for (int j=0; j<width; j++)
                fromState->gameboard[i][j] = toState->gameboard[i][j];
    fromState->plan = toState->plan;
    fromState->nBranch = toState->nBranch;*/
    //fromState->parent = toState;
}

bool checkGoal(state currentState)
{
    //if (currentState.gameboard[goal_position.x][goal_position.y] == 2) return 1;
    int count = 0;
    for (int i = 0; i < 3; i++)
        for (int j =0; j < 3; j++)
    {
        if (currentState.box_position[j].x == goal_position[i].x && currentState.box_position[j].y == goal_position[i].y)   count ++;
    }
    //std::cout << "Count:   " << count << std::endl;
    if (count == 3) return 1;
    else return 0;
    //if (currentState.box_position[0].x == goal_position[0].x && currentState.box_position[0].y == goal_position[0].y)  return 1;
    //else return 0;
}

int treeFilter(state currentState)
{
    int count = 0;
    for (int i=0; i< 3; i++)
    {
        count = 0;
        if (currentState.gameboard[currentState.box_position[i].y+1][currentState.box_position[i].x] == 1 )  count ++;
        if (currentState.gameboard[currentState.box_position[i].y][currentState.box_position[i].x+1] == 1 )  count ++;
        if (currentState.gameboard[currentState.box_position[i].y-1][currentState.box_position[i].x] == 1 )  count ++;
        if (currentState.gameboard[currentState.box_position[i].y][currentState.box_position[i].x-1] == 1 )  count ++;
        //std::cout << "Count is: " << count << std::endl;
        if (count >=2) return 1;
    }
    return 0;
}

int generateMove()
{
    try
    {
     //state_frontier_mutex.lock();
     state board;
     state temp_board;
     //board->gameboard = &state_frontier.top().gameboard;
     //std::cout << state_frontier.top() << std::endl;

     board.gameboard.resize(boost::extents[height][width]);
     temp_board.gameboard.resize(boost::extents[height][width]);
     board = state_frontier.top();
     //std::cout << "Fetched from frontier" << std::endl;
     /*
     board.gameboard.resize(boost::extents[height][width]);
     board.gameboard = state_frontier.top().gameboard;
     for (int i=0; i < height; i++)
        for (int j=0; j<width; j++)
            board.gameboard[i][j] = state_frontier.top().gameboard[i][j];
     board.cost = state_frontier.top().cost;
     board.robot_position = state_frontier.top().robot_position;
     board.nBranch = state_frontier.top().nBranch;
     board.box_position[0]   = state_frontier.top().box_position[0];
     board.box_position[1]   = state_frontier.top().box_position[1];
     board.box_position[2]   = state_frontier.top().box_position[2];
     board.plan = state_frontier.top().plan;
     */

     //board.parent = &static_cast<state>(state_frontier.top());
     state_frontier.pop();
     //state_frontier_mutex.unlock();
     //std::cout << "nBranch:  " << board.nBranch << std::endl;
     position move;
     move.x = board.robot_position.x;
     move.y = board.robot_position.y;

     if (checkGoal(board))   {
         std::cout << "Goal Found!" << std::endl;
         printBoard(board);
         std::cout << "Number of moves: " << board.plan.size() << std::endl;
         while (board.plan.size()!=0)
         {
             std::cout << "Robot Position: " << board.plan.top().x << ", " << board.plan.top().y << std::endl;
             board.plan.pop();
         }
         //std::cout << "Number of branches explored: " << board.nBranch << std::endl;
         return 0;}

     //if (board.nBranch > 17)    {printExplored(); printFrontier(); return 0;}

     int nValid;
     if (verbose) std::cout << "Generating Move .. " << std::endl;
     if (verbose) std::cout << "m: " << robot_position.x << "n: " << robot_position.y << std::endl;
     if (checkRules(board, board.robot_position.y,board.robot_position.x +1))
          {
             temp_board = board;
             if (verbose) std::cout << "Going one right" << std::endl; move.x++;
             makeMove(&temp_board, temp_board.robot_position, move);
             temp_board.cost = calculateCost(temp_board);
             //state_frontier_mutex.lock();
             //auto search = searched.find(temp_board);
             //if (search==searched.end() && !treeFilter(temp_board) )  {state_frontier.push(temp_board);searched.insert(temp_board);}
             if ((!heap_search_state(temp_board)) && (!check_explored(temp_board))) if (!treeFilter(temp_board))  state_frontier.push(temp_board);
             //state_frontier_mutex.unlock();
             move.x --;
          }
     if (checkRules(board, board.robot_position.y+1,board.robot_position.x))
          {
             //std::cout << "Starting copy" << std::endl;
             temp_board = board;
             //std::cout << "Done copying" << std::endl;
             if (verbose) std::cout << "Going one down" << std::endl; move.y ++;
             makeMove(&temp_board, temp_board.robot_position, move);
             temp_board.cost = calculateCost(temp_board);
             //auto search = searched.find(temp_board);
             //if (search==searched.end() && !treeFilter(temp_board))  {state_frontier.push(temp_board);searched.insert(temp_board);}
             //state_frontier_mutex.lock();
             if ((!heap_search_state(temp_board)) && (!check_explored(temp_board))) if (!treeFilter(temp_board))  state_frontier.push(temp_board);
             //state_frontier_mutex.unlock();
             move.y --;
          }
     if (checkRules(board, board.robot_position.y, board.robot_position.x-1))
          {
             temp_board = board;
             if (verbose) std::cout<< "Going one left" << std::endl; move.x --;
             makeMove(&temp_board, temp_board.robot_position, move);
             //auto search = searched.find(temp_board);
             temp_board.cost = calculateCost(temp_board);
             //if (search==searched.end() && !treeFilter(temp_board))  {state_frontier.push(temp_board);searched.insert(temp_board);}
             //state_frontier_mutex.lock();
             if ((!heap_search_state(temp_board)) && (!check_explored(temp_board))) if (!treeFilter(temp_board))  state_frontier.push(temp_board);
             //state_frontier_mutex.unlock();
             move.x ++;
          }
     if (checkRules(board, board.robot_position.y-1, board.robot_position.x))
          {
             temp_board = board;
             if (verbose) std::cout<< "Going one up" << std::endl; move.y --;
             makeMove(&temp_board, temp_board.robot_position, move);
             temp_board.cost = calculateCost(temp_board);
             //auto search = searched.find(temp_board);
             //if (search==searched.end() && !treeFilter(temp_board))  {state_frontier.push(temp_board);searched.insert(temp_board);}
             //state_frontier_mutex.lock();
             if ((!heap_search_state(temp_board)) && (!check_explored(temp_board))) if (!treeFilter(temp_board))  state_frontier.push(temp_board);
             //state_frontier_mutex.unlock();
             move.y ++;
          }

     //explored_mutex.lock();
     explored.push(board);
     //explored_mutex.unlock();
     return 1;
    }
    catch(int e)
    {
        return 1;
    }
}

void initBoard()
{
    //sokobanPlanner p = new sokobanPlanner::sokobanPlanner();
    //sokobanPlanner p = new sokobanPlanner();
    //p.setHeight(8);
    //p.setWidth(7);

    int m=8,n=7;
    state initState;
    initState.gameboard.resize(boost::extents[m][n]);

    // Question 2.1
    /*int temp[7][7] = {
        {1,1,1,1,0,0,0},
        {1,0,0,1,0,0,0},
        {1,1,5,1,1,1,1},
        {1,0,0,0,0,0,1},
        {1,0,0,2,0,0,1},
        {1,0,0,1,1,1,1},
        {1,1,1,0,0,0,0},
    };*/

    //Question 2.2
/*
    int temp [8][6] = {
        {1,1,1,1,1,1},
        {1,0,0,0,1,1},
        {1,5,2,3,0,1},
        {1,1,0,0,0,1},
        {0,1,1,0,0,1},
        {0,0,1,1,0,1},
        {0,0,0,1,0,1},
        {0,0,0,1,1,1},
    };
*/
    //Question 2.3
    int temp [8][7] = {
        {0,0,1,1,1,1,0},
        {0,0,1,0,0,1,0},
        {1,1,1,4,0,1,0},
        {1,0,2,0,0,5,1},
        {1,0,0,0,0,0,1},
        {1,1,3,0,0,1,1},
        {0,1,0,0,1,1,0},
        {0,1,1,1,1,0,1}
    };
     /*int temp[8][7] = {
                    {0,0,1,1,1,1,0},
            {0,0,1,0,0,1,0},
            {1,1,1,0,0,1,0},
            {1,0,2,2,5,0,1},
            {1,0,0,0,0,0,1},
            {1,1,0,0,0,1,1},
            {0,1,0,0,1,1,0},
            {0,1,1,1,1,0,0}};*/
     for (m=0; m< height; m++)
         for (n=0; n<width; n++)
          initState.gameboard[m][n] = temp[m][n];
     //initState.parent = &initState;
     //initState.nBranch = 0;
     initState.robot_position.x = 5; initState.robot_position.y = 3;
     initState.box_position[0].x   = 2; initState.box_position[0].y = 3;
     goal_position[0].x = 2;
     goal_position[0].y = 4;
     initState.box_position[1].x   = 2; initState.box_position[1].y = 5;
     goal_position[1].x = 3;
     goal_position[1].y = 4;
     initState.box_position[2].x   = 3; initState.box_position[2].y = 2;
     goal_position[2].x = 4;
     goal_position[2].y = 4;
     state_frontier.push(initState);
     searched.insert(initState);
     std::cout << "Initial State" <<std::endl;
     printBoard(initState);
}

bool goalFound = false;
void threadLoop ()
{
    while (!goalFound || state_frontier.size() == 0)  goalFound = generateMove();
    goalFound = true;
}

void search1()
{
    uint64_t count = 0;
    while (count <200000)
    {
        state_frontier_mutex.lock();
        if (state_frontier.size() == 0) break;
        state_frontier_mutex.unlock();
        if (!generateMove()) break;
        //printFrontier();
        count ++;
        //std::cout << "Iteration: " << count << std::endl;
    }
    goalFound = true;
}

void search()
{
    uint64_t count = 0;
    while (count < 100000)
    {
        state_frontier_mutex.lock();
        if (state_frontier.size() == 0) break;
        state_frontier_mutex.unlock();
        if (!generateMove() || goalFound) break;
        //printFrontier();
        count ++;
        //std::cout << "Iteration: " << count << std::endl;
    }
    //printFrontier();
    //printExplored();
    goalFound = true;
}

void joinThreads()
{
        //generateMove();
        std::thread first(search);
        //std::thread second(search);
        //std::this_thread::sleep_for(std::chrono::microseconds(10000));
        //std::thread third(search);
        //std::thread fourth(search);

        first.join();
        //std::this_thread::sleep_for(std::chrono::microseconds(10000));
        //second.join();
        //third.join();
        //fourth.join();

        while (!goalFound);
}

template<typename TimeT = std::chrono::milliseconds>
struct measure
{
    template<typename F, typename ...Args>
    static typename TimeT::rep execution(F func, Args&&... args)
    {
        auto start = std::chrono::system_clock::now();

        // Now call the function with all the parameters you need.
        func(std::forward<Args>(args)...);

        auto duration = std::chrono::duration_cast< TimeT>(std::chrono::system_clock::now() - start);

        return duration.count();
    }
};

int main()
{
   sokobanPlanner p;
   initBoard();
   uint64_t count = 0;
   //std::thread first(search);
   //std::thread second(threadLoop);
   //first.join();
   //second.join();
   /*auto start = std::chrono::high_resolution_clock::now();
   while (state_frontier.size() != 0 && count <200000)
   {
       if (!generateMove()) break;
       //printFrontier();
       count ++;
       //std::cout << "Iteration: " << count << std::endl;
   }
   //while (!goalFound);
   auto end = std::chrono::high_resolution_clock::now();
   uint64_t timestamp = std::chrono::duration_cast <std::chrono::milliseconds> (end-start).count()*100/100u;*/
   std::cout << "Time Elapsed: " << measure<>::execution (joinThreads)<< " milliseconds" << std::endl;
   //printExplored();
   //printFrontier();
   std::cout << "Number Explored: " << explored.size() << std::endl;
   return 0;
} 
