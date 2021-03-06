; XXXXXXX 
; XXX__XX 
; XXXa_XX 
; X_b__rX 
; X_ggg_X 
; XXc__XX 
; XX__XXX 
; XXXXXXX 

; This is an auto generated sokoban problem
(define (problem sokoban_problem )

; The domain for our sokoban problem is simply named sokoban
(:domain sokoban)

; Specify list of objects
(:objects 

; Specify list of directions
up down left right

; Specify list of blocks
a b c 

; Specify list of locations
r0-c0 r0-c1 r0-c2 r0-c3 r0-c4 r0-c5 r0-c6 
r1-c0 r1-c1 r1-c2 r1-c3 r1-c4 r1-c5 r1-c6 
r2-c0 r2-c1 r2-c2 r2-c3 r2-c4 r2-c5 r2-c6 
r3-c0 r3-c1 r3-c2 r3-c3 r3-c4 r3-c5 r3-c6 
r4-c0 r4-c1 r4-c2 r4-c3 r4-c4 r4-c5 r4-c6 
r5-c0 r5-c1 r5-c2 r5-c3 r5-c4 r5-c5 r5-c6 
r6-c0 r6-c1 r6-c2 r6-c3 r6-c4 r6-c5 r6-c6 
r7-c0 r7-c1 r7-c2 r7-c3 r7-c4 r7-c5 r7-c6 

)


; Init direction objects
(:init

; Init direction objects
(direction up)
(direction down)
(direction left)
(direction right)

; Init block objects and locations
(block a)
(block-at a r2-c3)
(block b)
(block-at b r3-c2)
(block c)
(block-at c r5-c2)


; Init robot location
(robot-at r3-c5)

; Init navigable objects
(navigable r1-c3)
(navigable r1-c4)
(navigable r2-c3)
(navigable r2-c4)
(navigable r3-c1)
(navigable r3-c2)
(navigable r3-c3)
(navigable r3-c4)
(navigable r3-c5)
(navigable r4-c1)
(navigable r4-c2)
(navigable r4-c3)
(navigable r4-c4)
(navigable r4-c5)
(navigable r5-c2)
(navigable r5-c3)
(navigable r5-c4)
(navigable r6-c2)
(navigable r6-c3)

; Init empty objects
(empty r1-c3)
(empty r1-c4)
(empty r2-c4)
(empty r3-c1)
(empty r3-c3)
(empty r3-c4)
(empty r4-c1)
(empty r4-c2)
(empty r4-c3)
(empty r4-c4)
(empty r4-c5)
(empty r5-c3)
(empty r5-c4)
(empty r6-c2)
(empty r6-c3)

; Init adjacent objects
(adjacent r0-c0 r1-c0 down) (adjacent r0-c0 r0-c1 right) 
(adjacent r0-c1 r1-c1 down) (adjacent r0-c1 r0-c0 left) (adjacent r0-c1 r0-c2 right) 
(adjacent r0-c2 r1-c2 down) (adjacent r0-c2 r0-c1 left) (adjacent r0-c2 r0-c3 right) 
(adjacent r0-c3 r1-c3 down) (adjacent r0-c3 r0-c2 left) (adjacent r0-c3 r0-c4 right) 
(adjacent r0-c4 r1-c4 down) (adjacent r0-c4 r0-c3 left) (adjacent r0-c4 r0-c5 right) 
(adjacent r0-c5 r1-c5 down) (adjacent r0-c5 r0-c4 left) (adjacent r0-c5 r0-c6 right) 
(adjacent r0-c6 r1-c6 down) (adjacent r0-c6 r0-c5 left) 
(adjacent r1-c0 r0-c0 up) (adjacent r1-c0 r2-c0 down) (adjacent r1-c0 r1-c1 right) 
(adjacent r1-c1 r0-c1 up) (adjacent r1-c1 r2-c1 down) (adjacent r1-c1 r1-c0 left) (adjacent r1-c1 r1-c2 right) 
(adjacent r1-c2 r0-c2 up) (adjacent r1-c2 r2-c2 down) (adjacent r1-c2 r1-c1 left) (adjacent r1-c2 r1-c3 right) 
(adjacent r1-c3 r0-c3 up) (adjacent r1-c3 r2-c3 down) (adjacent r1-c3 r1-c2 left) (adjacent r1-c3 r1-c4 right) 
(adjacent r1-c4 r0-c4 up) (adjacent r1-c4 r2-c4 down) (adjacent r1-c4 r1-c3 left) (adjacent r1-c4 r1-c5 right) 
(adjacent r1-c5 r0-c5 up) (adjacent r1-c5 r2-c5 down) (adjacent r1-c5 r1-c4 left) (adjacent r1-c5 r1-c6 right) 
(adjacent r1-c6 r0-c6 up) (adjacent r1-c6 r2-c6 down) (adjacent r1-c6 r1-c5 left) 
(adjacent r2-c0 r1-c0 up) (adjacent r2-c0 r3-c0 down) (adjacent r2-c0 r2-c1 right) 
(adjacent r2-c1 r1-c1 up) (adjacent r2-c1 r3-c1 down) (adjacent r2-c1 r2-c0 left) (adjacent r2-c1 r2-c2 right) 
(adjacent r2-c2 r1-c2 up) (adjacent r2-c2 r3-c2 down) (adjacent r2-c2 r2-c1 left) (adjacent r2-c2 r2-c3 right) 
(adjacent r2-c3 r1-c3 up) (adjacent r2-c3 r3-c3 down) (adjacent r2-c3 r2-c2 left) (adjacent r2-c3 r2-c4 right) 
(adjacent r2-c4 r1-c4 up) (adjacent r2-c4 r3-c4 down) (adjacent r2-c4 r2-c3 left) (adjacent r2-c4 r2-c5 right) 
(adjacent r2-c5 r1-c5 up) (adjacent r2-c5 r3-c5 down) (adjacent r2-c5 r2-c4 left) (adjacent r2-c5 r2-c6 right) 
(adjacent r2-c6 r1-c6 up) (adjacent r2-c6 r3-c6 down) (adjacent r2-c6 r2-c5 left) 
(adjacent r3-c0 r2-c0 up) (adjacent r3-c0 r4-c0 down) (adjacent r3-c0 r3-c1 right) 
(adjacent r3-c1 r2-c1 up) (adjacent r3-c1 r4-c1 down) (adjacent r3-c1 r3-c0 left) (adjacent r3-c1 r3-c2 right) 
(adjacent r3-c2 r2-c2 up) (adjacent r3-c2 r4-c2 down) (adjacent r3-c2 r3-c1 left) (adjacent r3-c2 r3-c3 right) 
(adjacent r3-c3 r2-c3 up) (adjacent r3-c3 r4-c3 down) (adjacent r3-c3 r3-c2 left) (adjacent r3-c3 r3-c4 right) 
(adjacent r3-c4 r2-c4 up) (adjacent r3-c4 r4-c4 down) (adjacent r3-c4 r3-c3 left) (adjacent r3-c4 r3-c5 right) 
(adjacent r3-c5 r2-c5 up) (adjacent r3-c5 r4-c5 down) (adjacent r3-c5 r3-c4 left) (adjacent r3-c5 r3-c6 right) 
(adjacent r3-c6 r2-c6 up) (adjacent r3-c6 r4-c6 down) (adjacent r3-c6 r3-c5 left) 
(adjacent r4-c0 r3-c0 up) (adjacent r4-c0 r5-c0 down) (adjacent r4-c0 r4-c1 right) 
(adjacent r4-c1 r3-c1 up) (adjacent r4-c1 r5-c1 down) (adjacent r4-c1 r4-c0 left) (adjacent r4-c1 r4-c2 right) 
(adjacent r4-c2 r3-c2 up) (adjacent r4-c2 r5-c2 down) (adjacent r4-c2 r4-c1 left) (adjacent r4-c2 r4-c3 right) 
(adjacent r4-c3 r3-c3 up) (adjacent r4-c3 r5-c3 down) (adjacent r4-c3 r4-c2 left) (adjacent r4-c3 r4-c4 right) 
(adjacent r4-c4 r3-c4 up) (adjacent r4-c4 r5-c4 down) (adjacent r4-c4 r4-c3 left) (adjacent r4-c4 r4-c5 right) 
(adjacent r4-c5 r3-c5 up) (adjacent r4-c5 r5-c5 down) (adjacent r4-c5 r4-c4 left) (adjacent r4-c5 r4-c6 right) 
(adjacent r4-c6 r3-c6 up) (adjacent r4-c6 r5-c6 down) (adjacent r4-c6 r4-c5 left) 
(adjacent r5-c0 r4-c0 up) (adjacent r5-c0 r6-c0 down) (adjacent r5-c0 r5-c1 right) 
(adjacent r5-c1 r4-c1 up) (adjacent r5-c1 r6-c1 down) (adjacent r5-c1 r5-c0 left) (adjacent r5-c1 r5-c2 right) 
(adjacent r5-c2 r4-c2 up) (adjacent r5-c2 r6-c2 down) (adjacent r5-c2 r5-c1 left) (adjacent r5-c2 r5-c3 right) 
(adjacent r5-c3 r4-c3 up) (adjacent r5-c3 r6-c3 down) (adjacent r5-c3 r5-c2 left) (adjacent r5-c3 r5-c4 right) 
(adjacent r5-c4 r4-c4 up) (adjacent r5-c4 r6-c4 down) (adjacent r5-c4 r5-c3 left) (adjacent r5-c4 r5-c5 right) 
(adjacent r5-c5 r4-c5 up) (adjacent r5-c5 r6-c5 down) (adjacent r5-c5 r5-c4 left) (adjacent r5-c5 r5-c6 right) 
(adjacent r5-c6 r4-c6 up) (adjacent r5-c6 r6-c6 down) (adjacent r5-c6 r5-c5 left) 
(adjacent r6-c0 r5-c0 up) (adjacent r6-c0 r7-c0 down) (adjacent r6-c0 r6-c1 right) 
(adjacent r6-c1 r5-c1 up) (adjacent r6-c1 r7-c1 down) (adjacent r6-c1 r6-c0 left) (adjacent r6-c1 r6-c2 right) 
(adjacent r6-c2 r5-c2 up) (adjacent r6-c2 r7-c2 down) (adjacent r6-c2 r6-c1 left) (adjacent r6-c2 r6-c3 right) 
(adjacent r6-c3 r5-c3 up) (adjacent r6-c3 r7-c3 down) (adjacent r6-c3 r6-c2 left) (adjacent r6-c3 r6-c4 right) 
(adjacent r6-c4 r5-c4 up) (adjacent r6-c4 r7-c4 down) (adjacent r6-c4 r6-c3 left) (adjacent r6-c4 r6-c5 right) 
(adjacent r6-c5 r5-c5 up) (adjacent r6-c5 r7-c5 down) (adjacent r6-c5 r6-c4 left) (adjacent r6-c5 r6-c6 right) 
(adjacent r6-c6 r5-c6 up) (adjacent r6-c6 r7-c6 down) (adjacent r6-c6 r6-c5 left) 
(adjacent r7-c0 r6-c0 up) (adjacent r7-c0 r7-c1 right) 
(adjacent r7-c1 r6-c1 up) (adjacent r7-c1 r7-c0 left) (adjacent r7-c1 r7-c2 right) 
(adjacent r7-c2 r6-c2 up) (adjacent r7-c2 r7-c1 left) (adjacent r7-c2 r7-c3 right) 
(adjacent r7-c3 r6-c3 up) (adjacent r7-c3 r7-c2 left) (adjacent r7-c3 r7-c4 right) 
(adjacent r7-c4 r6-c4 up) (adjacent r7-c4 r7-c3 left) (adjacent r7-c4 r7-c5 right) 
(adjacent r7-c5 r6-c5 up) (adjacent r7-c5 r7-c4 left) (adjacent r7-c5 r7-c6 right) 
(adjacent r7-c6 r6-c6 up) (adjacent r7-c6 r7-c5 left) 

; Init Done
)
; Define goal states
(:goal (and 
		(empty r1-c3)
		(empty r1-c4)
		
		(empty r2-c3)
		(empty r2-c4)
		
		(empty r3-c1)
		(empty r3-c2)
		(robot-at r3-c3)
		(empty r3-c4)
		(empty r3-c5)
		
		(empty r4-c1)
		(empty r4-c5)
		
		(empty r5-c2)
		(empty r5-c3)
		(empty r5-c4)
		
		(empty r6-c2)
		(empty r6-c3)
	)
)

; Problem Define Done
)
