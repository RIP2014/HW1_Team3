#ifndef SOKOBANPLANNER_H
#define SOKOBANPLANNER_H

#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include "boost/multi_array.hpp"
#include "boost/heap/fibonacci_heap.hpp"
#include <thread>
#include <stack>
#include <mutex>
#include <algorithm>

typedef struct
{
    int x;
    int y;
} position;

typedef struct
{
    position _position;
    position _start_position;
    int cost;
} valid_moves;

typedef boost::multi_array<int, 2> multiArray;

typedef struct state
{
    multiArray gameboard;
    position robot_position;
    position box_position[3];
    int cost;
    std::stack<position> plan;
    //int nBranch;
    friend bool operator==(state const &lhs, state const &rhs)
    {
        if (lhs.gameboard == rhs.gameboard) return 1;
        else return 0;
    }
    state& operator=(const state &rhs) = default;
};

class sokobanPlanner
{
public:
    sokobanPlanner();

    void setWidth(int _width);
    int getWidth(void);

    void setHeight(int _height);
    int getHeight(void);

    void setnBoxes(int _nBoxes);
    int getnBoxes(void);

    void setInitialState(state * _initialState);
    int search(void);


private:
    struct state_compare
    {
        bool operator()(const state& m1, const state& m2) const
        {
            return m1.cost > m2.cost;
        }
    };
    int width;
    int height;
    int nBoxes;
    int gains;
    state initialState;
    position goal_position[3];
    boost::heap::fibonacci_heap<state, boost::heap::compare<state_compare> > state_frontier;
    boost::heap::fibonacci_heap<state, boost::heap::compare<state_compare>> explored;

    bool heapSearch (state currentState);
    bool checkExplored (state currentState);
    void printBoard(state currentState);
    int checkRules(state currentState, int m, int n);
    int calculateCost(state currentState);
    void makeMove(state * currentState, position pos1, position pos2);
    void copyState(state * toState, state * fromState);
    bool checkGoal(state currentState);
    int treeFilter(state currentState);
    int generateMove();

};

#endif // SOKOBANPLANNER_H
