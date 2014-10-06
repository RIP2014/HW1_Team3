# Towers of Hanoi HTN Planning

import pyhop
import sys
import time
sys.setrecursionlimit(30000)
global num_states_explored;

## Operators
def move(state, disk, source, dest):
	global num_states_explored;
	if state.loc[disk] == source:
		state.loc[disk] = dest
		num_states_explored = num_states_explored +  1;
		return state
	else:
		return False

pyhop.declare_operators(move)
print('')
pyhop.print_operators()


## Methods
def move_stack(state, disk, source, dest, spare):
	global num_states_explored;
	if disk >0:
                return [('move_tower', disk-1, source, spare, dest), ('move', disk, source, dest), ('move_tower', disk-1, spare, dest, source)]
	else:
		num_states_explored = num_states_explored + 1;
		return False



def move_disk(state, disk, source, dest, spare):
	global num_states_explored;
	if disk == 0:
		return [('move', disk, source, dest)]
	else:
		num_states_explored = num_states_explored + 1;
		return False


pyhop.declare_methods('move_tower', move_stack, move_disk)
print('')
pyhop.print_methods()

## Num Disks
num_disks =  int(sys.argv[1]);
num_states_explored = 0;
## Define state
state1 = pyhop.State('state1')
state1.loc = {};
for i in  range(0,num_disks):
	state1.loc[i] = 0

## Run SHOP planner
t0 = time.time()
result = pyhop.pyhop(state1, [('move_tower', num_disks -1, 0, 2, 1)], verbose=0);
t1 = time.time()
total = t1 - t0;

## Print state
count = 0;
for i in result:
	print count,'- Move disk', i[1]+1, 'from', i[2], 'to',i[3]
	count = count + 1;

print '--------------------'
print 'Time taken:',total,'seconds'
print 'Total number of states explored:', num_states_explored
