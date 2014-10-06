; The domain for our sokoban problem is simply named sokoban
(define (domain sokoban)

; Our sokoban domain declares the most basic subset of PDDL, consisting of STRIPS as the only requirements
(:requirements :strips :adl)

; For our predicates, we'll specify the name and number of arguments used for each
(:predicates
	(navigable ?location)		; Is the location navigatble
	(direction ?direct)			; Is the object a direction
	(block-at ?box ?location)	; Is the box at the given location
	(robot-at ?location)		; Is the robot at the given location
	(block ?box)				; Is the given box a block or crate
	(adjacent ?location1 ?location2 ?direct) 	; Are the two locations adjacent
	(empty ?location)			; Is the location empty or avalable
)

; We'll need to be able to move our robot through locations
(:action move
	
	; To start, we need a from and to location need to be specified
	:parameters
		(?from ?to ?dir)

	; Before we effect the current state, we need to make sure
	; that both the first two given parameters are navigable,
	; the we have infact a direction
	; and that given the the direction
	; that our to location is both reachable (adjacent) and currently empty
	:precondition 
		(and 
			(navigable ?from) 
			(navigable ?to) 
			(direction ?dir) 
			(robot-at ?from) 
			(adjacent ?from ?to ?dir) 
			(empty ?to)
		)

	; The effect on the current state of the world is that
	; the location we previosly ocupied will now be vacant with no robot,
	; the robot now at the "to" location so "to" now ocupied
	:effect 
		(and 
			(empty ?from)
			(robot-at ?to) 
			(not (empty ?to))
			(not (robot-at ?from))
		)
)

; To menipulate boxes, we'll need to have an action to push them
(:action push

	; To start, we need locations of the robot, block, destination
	; plus the corisponding location and block object to be specified
	:parameters
		(?robotLocation ?blockLocation ?freeLocation  ?dirr ?activeBlock)

	; Before we effect the current state, we need to make sure
	; that all the first three given parameters are navigable,
	; and that the block can be pushed into an empty location
	; that is adjacent in the proper location
	:precondition 
		(and 
			(navigable ?robotLocation) 
			(navigable ?blockLocation) 
			(navigable ?freeLocation)          
			(direction ?dirr) 
			(block ?activeBlock) 
			(robot-at ?robotLocation)                   
			(block-at ?activeBlock ?blockLocation) 
			(adjacent ?robotLocation ?blockLocation ?dirr)                   
			(adjacent ?blockLocation ?freeLocation ?dirr) 
			(empty ?freeLocation)
		)

	; The effect on the current state of the world is that
	; the location we previosly ocupied will now be vacant with no robot,
	; the location the box previosly ocupied will now be ocupied by the robot,
	; and the free location will now be occupied by the box
	:effect
		(and 
			(robot-at ?blockLocation) 
			(block-at ?activeBlock ?freeLocation) 
			(empty ?robotLocation)       
			(not (robot-at ?robotLocation)) 
			(not (block-at ?activeBlock ?blockLocation)) 
			(not (empty ?freeLocation))
		)
)
)
