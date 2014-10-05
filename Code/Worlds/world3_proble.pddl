; XXXXXXXXXXX 
; XXXXXXXA__X 
; XXXXXXXBX_X 
; XXXXXXXCX_X 
; X_r_c_b_a_X 
; X_X_X_X_XXX 
; X_______XXX 
; XXXXXXXXXXX 

; This is an auto generated sokoban problem
(define (problem sokoban_problem )

; The domain for our sokoban problem is simply named sokoban
(:domain sokoban)

; Specify list of objects
(:objects 

; Specify list of directions
up down left right

; Specify list of blocks
c b a 

; Specify list of locations
r0-c0 r0-c1 r0-c2 r0-c3 r0-c4 r0-c5 r0-c6 r0-c7 r0-c8 r0-c9 r0-c10 
r1-c0 r1-c1 r1-c2 r1-c3 r1-c4 r1-c5 r1-c6 r1-c7 r1-c8 r1-c9 r1-c10 
r2-c0 r2-c1 r2-c2 r2-c3 r2-c4 r2-c5 r2-c6 r2-c7 r2-c8 r2-c9 r2-c10 
r3-c0 r3-c1 r3-c2 r3-c3 r3-c4 r3-c5 r3-c6 r3-c7 r3-c8 r3-c9 r3-c10 
r4-c0 r4-c1 r4-c2 r4-c3 r4-c4 r4-c5 r4-c6 r4-c7 r4-c8 r4-c9 r4-c10 
r5-c0 r5-c1 r5-c2 r5-c3 r5-c4 r5-c5 r5-c6 r5-c7 r5-c8 r5-c9 r5-c10 
r6-c0 r6-c1 r6-c2 r6-c3 r6-c4 r6-c5 r6-c6 r6-c7 r6-c8 r6-c9 r6-c10 
r7-c0 r7-c1 r7-c2 r7-c3 r7-c4 r7-c5 r7-c6 r7-c7 r7-c8 r7-c9 r7-c10 

)


; Init direction objects
(:init

; Init direction objects
(direction up)
(direction down)
(direction left)
(direction right)

; Init block objects and locations
(block c)
(block-at c r4-c4)
(block b)
(block-at b r4-c6)
(block a)
(block-at a r4-c8)


; Init robot location
(robot-at r4-c2)

; Init navigable objects
(navigable r1-c7)
(navigable r1-c8)
(navigable r1-c9)
(navigable r2-c7)
(navigable r2-c9)
(navigable r3-c7)
(navigable r3-c9)
(navigable r4-c1)
(navigable r4-c2)
(navigable r4-c3)
(navigable r4-c4)
(navigable r4-c5)
(navigable r4-c6)
(navigable r4-c7)
(navigable r4-c8)
(navigable r4-c9)
(navigable r5-c1)
(navigable r5-c3)
(navigable r5-c5)
(navigable r5-c7)
(navigable r6-c1)
(navigable r6-c2)
(navigable r6-c3)
(navigable r6-c4)
(navigable r6-c5)
(navigable r6-c6)
(navigable r6-c7)

; Init empty objects
(empty r1-c7)
(empty r1-c8)
(empty r1-c9)
(empty r2-c7)
(empty r2-c9)
(empty r3-c7)
(empty r3-c9)
(empty r4-c1)
(empty r4-c3)
(empty r4-c5)
(empty r4-c7)
(empty r4-c9)
(empty r5-c1)
(empty r5-c3)
(empty r5-c5)
(empty r5-c7)
(empty r6-c1)
(empty r6-c2)
(empty r6-c3)
(empty r6-c4)
(empty r6-c5)
(empty r6-c6)
(empty r6-c7)

; Init adjacent objects
(adjacent r0-c0 r1-c0 down) (adjacent r0-c0 r0-c1 right) 
(adjacent r0-c1 r1-c1 down) (adjacent r0-c1 r0-c0 left) (adjacent r0-c1 r0-c2 right) 
(adjacent r0-c2 r1-c2 down) (adjacent r0-c2 r0-c1 left) (adjacent r0-c2 r0-c3 right) 
(adjacent r0-c3 r1-c3 down) (adjacent r0-c3 r0-c2 left) (adjacent r0-c3 r0-c4 right) 
(adjacent r0-c4 r1-c4 down) (adjacent r0-c4 r0-c3 left) (adjacent r0-c4 r0-c5 right) 
(adjacent r0-c5 r1-c5 down) (adjacent r0-c5 r0-c4 left) (adjacent r0-c5 r0-c6 right) 
(adjacent r0-c6 r1-c6 down) (adjacent r0-c6 r0-c5 left) (adjacent r0-c6 r0-c7 right) 
(adjacent r0-c7 r1-c7 down) (adjacent r0-c7 r0-c6 left) (adjacent r0-c7 r0-c8 right) 
(adjacent r0-c8 r1-c8 down) (adjacent r0-c8 r0-c7 left) (adjacent r0-c8 r0-c9 right) 
(adjacent r0-c9 r1-c9 down) (adjacent r0-c9 r0-c8 left) (adjacent r0-c9 r0-c10 right) 
(adjacent r0-c10 r1-c10 down) (adjacent r0-c10 r0-c9 left) 
(adjacent r1-c0 r0-c0 up) (adjacent r1-c0 r2-c0 down) (adjacent r1-c0 r1-c1 right) 
(adjacent r1-c1 r0-c1 up) (adjacent r1-c1 r2-c1 down) (adjacent r1-c1 r1-c0 left) (adjacent r1-c1 r1-c2 right) 
(adjacent r1-c2 r0-c2 up) (adjacent r1-c2 r2-c2 down) (adjacent r1-c2 r1-c1 left) (adjacent r1-c2 r1-c3 right) 
(adjacent r1-c3 r0-c3 up) (adjacent r1-c3 r2-c3 down) (adjacent r1-c3 r1-c2 left) (adjacent r1-c3 r1-c4 right) 
(adjacent r1-c4 r0-c4 up) (adjacent r1-c4 r2-c4 down) (adjacent r1-c4 r1-c3 left) (adjacent r1-c4 r1-c5 right) 
(adjacent r1-c5 r0-c5 up) (adjacent r1-c5 r2-c5 down) (adjacent r1-c5 r1-c4 left) (adjacent r1-c5 r1-c6 right) 
(adjacent r1-c6 r0-c6 up) (adjacent r1-c6 r2-c6 down) (adjacent r1-c6 r1-c5 left) (adjacent r1-c6 r1-c7 right) 
(adjacent r1-c7 r0-c7 up) (adjacent r1-c7 r2-c7 down) (adjacent r1-c7 r1-c6 left) (adjacent r1-c7 r1-c8 right) 
(adjacent r1-c8 r0-c8 up) (adjacent r1-c8 r2-c8 down) (adjacent r1-c8 r1-c7 left) (adjacent r1-c8 r1-c9 right) 
(adjacent r1-c9 r0-c9 up) (adjacent r1-c9 r2-c9 down) (adjacent r1-c9 r1-c8 left) (adjacent r1-c9 r1-c10 right) 
(adjacent r1-c10 r0-c10 up) (adjacent r1-c10 r2-c10 down) (adjacent r1-c10 r1-c9 left) 
(adjacent r2-c0 r1-c0 up) (adjacent r2-c0 r3-c0 down) (adjacent r2-c0 r2-c1 right) 
(adjacent r2-c1 r1-c1 up) (adjacent r2-c1 r3-c1 down) (adjacent r2-c1 r2-c0 left) (adjacent r2-c1 r2-c2 right) 
(adjacent r2-c2 r1-c2 up) (adjacent r2-c2 r3-c2 down) (adjacent r2-c2 r2-c1 left) (adjacent r2-c2 r2-c3 right) 
(adjacent r2-c3 r1-c3 up) (adjacent r2-c3 r3-c3 down) (adjacent r2-c3 r2-c2 left) (adjacent r2-c3 r2-c4 right) 
(adjacent r2-c4 r1-c4 up) (adjacent r2-c4 r3-c4 down) (adjacent r2-c4 r2-c3 left) (adjacent r2-c4 r2-c5 right) 
(adjacent r2-c5 r1-c5 up) (adjacent r2-c5 r3-c5 down) (adjacent r2-c5 r2-c4 left) (adjacent r2-c5 r2-c6 right) 
(adjacent r2-c6 r1-c6 up) (adjacent r2-c6 r3-c6 down) (adjacent r2-c6 r2-c5 left) (adjacent r2-c6 r2-c7 right) 
(adjacent r2-c7 r1-c7 up) (adjacent r2-c7 r3-c7 down) (adjacent r2-c7 r2-c6 left) (adjacent r2-c7 r2-c8 right) 
(adjacent r2-c8 r1-c8 up) (adjacent r2-c8 r3-c8 down) (adjacent r2-c8 r2-c7 left) (adjacent r2-c8 r2-c9 right) 
(adjacent r2-c9 r1-c9 up) (adjacent r2-c9 r3-c9 down) (adjacent r2-c9 r2-c8 left) (adjacent r2-c9 r2-c10 right) 
(adjacent r2-c10 r1-c10 up) (adjacent r2-c10 r3-c10 down) (adjacent r2-c10 r2-c9 left) 
(adjacent r3-c0 r2-c0 up) (adjacent r3-c0 r4-c0 down) (adjacent r3-c0 r3-c1 right) 
(adjacent r3-c1 r2-c1 up) (adjacent r3-c1 r4-c1 down) (adjacent r3-c1 r3-c0 left) (adjacent r3-c1 r3-c2 right) 
(adjacent r3-c2 r2-c2 up) (adjacent r3-c2 r4-c2 down) (adjacent r3-c2 r3-c1 left) (adjacent r3-c2 r3-c3 right) 
(adjacent r3-c3 r2-c3 up) (adjacent r3-c3 r4-c3 down) (adjacent r3-c3 r3-c2 left) (adjacent r3-c3 r3-c4 right) 
(adjacent r3-c4 r2-c4 up) (adjacent r3-c4 r4-c4 down) (adjacent r3-c4 r3-c3 left) (adjacent r3-c4 r3-c5 right) 
(adjacent r3-c5 r2-c5 up) (adjacent r3-c5 r4-c5 down) (adjacent r3-c5 r3-c4 left) (adjacent r3-c5 r3-c6 right) 
(adjacent r3-c6 r2-c6 up) (adjacent r3-c6 r4-c6 down) (adjacent r3-c6 r3-c5 left) (adjacent r3-c6 r3-c7 right) 
(adjacent r3-c7 r2-c7 up) (adjacent r3-c7 r4-c7 down) (adjacent r3-c7 r3-c6 left) (adjacent r3-c7 r3-c8 right) 
(adjacent r3-c8 r2-c8 up) (adjacent r3-c8 r4-c8 down) (adjacent r3-c8 r3-c7 left) (adjacent r3-c8 r3-c9 right) 
(adjacent r3-c9 r2-c9 up) (adjacent r3-c9 r4-c9 down) (adjacent r3-c9 r3-c8 left) (adjacent r3-c9 r3-c10 right) 
(adjacent r3-c10 r2-c10 up) (adjacent r3-c10 r4-c10 down) (adjacent r3-c10 r3-c9 left) 
(adjacent r4-c0 r3-c0 up) (adjacent r4-c0 r5-c0 down) (adjacent r4-c0 r4-c1 right) 
(adjacent r4-c1 r3-c1 up) (adjacent r4-c1 r5-c1 down) (adjacent r4-c1 r4-c0 left) (adjacent r4-c1 r4-c2 right) 
(adjacent r4-c2 r3-c2 up) (adjacent r4-c2 r5-c2 down) (adjacent r4-c2 r4-c1 left) (adjacent r4-c2 r4-c3 right) 
(adjacent r4-c3 r3-c3 up) (adjacent r4-c3 r5-c3 down) (adjacent r4-c3 r4-c2 left) (adjacent r4-c3 r4-c4 right) 
(adjacent r4-c4 r3-c4 up) (adjacent r4-c4 r5-c4 down) (adjacent r4-c4 r4-c3 left) (adjacent r4-c4 r4-c5 right) 
(adjacent r4-c5 r3-c5 up) (adjacent r4-c5 r5-c5 down) (adjacent r4-c5 r4-c4 left) (adjacent r4-c5 r4-c6 right) 
(adjacent r4-c6 r3-c6 up) (adjacent r4-c6 r5-c6 down) (adjacent r4-c6 r4-c5 left) (adjacent r4-c6 r4-c7 right) 
(adjacent r4-c7 r3-c7 up) (adjacent r4-c7 r5-c7 down) (adjacent r4-c7 r4-c6 left) (adjacent r4-c7 r4-c8 right) 
(adjacent r4-c8 r3-c8 up) (adjacent r4-c8 r5-c8 down) (adjacent r4-c8 r4-c7 left) (adjacent r4-c8 r4-c9 right) 
(adjacent r4-c9 r3-c9 up) (adjacent r4-c9 r5-c9 down) (adjacent r4-c9 r4-c8 left) (adjacent r4-c9 r4-c10 right) 
(adjacent r4-c10 r3-c10 up) (adjacent r4-c10 r5-c10 down) (adjacent r4-c10 r4-c9 left) 
(adjacent r5-c0 r4-c0 up) (adjacent r5-c0 r6-c0 down) (adjacent r5-c0 r5-c1 right) 
(adjacent r5-c1 r4-c1 up) (adjacent r5-c1 r6-c1 down) (adjacent r5-c1 r5-c0 left) (adjacent r5-c1 r5-c2 right) 
(adjacent r5-c2 r4-c2 up) (adjacent r5-c2 r6-c2 down) (adjacent r5-c2 r5-c1 left) (adjacent r5-c2 r5-c3 right) 
(adjacent r5-c3 r4-c3 up) (adjacent r5-c3 r6-c3 down) (adjacent r5-c3 r5-c2 left) (adjacent r5-c3 r5-c4 right) 
(adjacent r5-c4 r4-c4 up) (adjacent r5-c4 r6-c4 down) (adjacent r5-c4 r5-c3 left) (adjacent r5-c4 r5-c5 right) 
(adjacent r5-c5 r4-c5 up) (adjacent r5-c5 r6-c5 down) (adjacent r5-c5 r5-c4 left) (adjacent r5-c5 r5-c6 right) 
(adjacent r5-c6 r4-c6 up) (adjacent r5-c6 r6-c6 down) (adjacent r5-c6 r5-c5 left) (adjacent r5-c6 r5-c7 right) 
(adjacent r5-c7 r4-c7 up) (adjacent r5-c7 r6-c7 down) (adjacent r5-c7 r5-c6 left) (adjacent r5-c7 r5-c8 right) 
(adjacent r5-c8 r4-c8 up) (adjacent r5-c8 r6-c8 down) (adjacent r5-c8 r5-c7 left) (adjacent r5-c8 r5-c9 right) 
(adjacent r5-c9 r4-c9 up) (adjacent r5-c9 r6-c9 down) (adjacent r5-c9 r5-c8 left) (adjacent r5-c9 r5-c10 right) 
(adjacent r5-c10 r4-c10 up) (adjacent r5-c10 r6-c10 down) (adjacent r5-c10 r5-c9 left) 
(adjacent r6-c0 r5-c0 up) (adjacent r6-c0 r7-c0 down) (adjacent r6-c0 r6-c1 right) 
(adjacent r6-c1 r5-c1 up) (adjacent r6-c1 r7-c1 down) (adjacent r6-c1 r6-c0 left) (adjacent r6-c1 r6-c2 right) 
(adjacent r6-c2 r5-c2 up) (adjacent r6-c2 r7-c2 down) (adjacent r6-c2 r6-c1 left) (adjacent r6-c2 r6-c3 right) 
(adjacent r6-c3 r5-c3 up) (adjacent r6-c3 r7-c3 down) (adjacent r6-c3 r6-c2 left) (adjacent r6-c3 r6-c4 right) 
(adjacent r6-c4 r5-c4 up) (adjacent r6-c4 r7-c4 down) (adjacent r6-c4 r6-c3 left) (adjacent r6-c4 r6-c5 right) 
(adjacent r6-c5 r5-c5 up) (adjacent r6-c5 r7-c5 down) (adjacent r6-c5 r6-c4 left) (adjacent r6-c5 r6-c6 right) 
(adjacent r6-c6 r5-c6 up) (adjacent r6-c6 r7-c6 down) (adjacent r6-c6 r6-c5 left) (adjacent r6-c6 r6-c7 right) 
(adjacent r6-c7 r5-c7 up) (adjacent r6-c7 r7-c7 down) (adjacent r6-c7 r6-c6 left) (adjacent r6-c7 r6-c8 right) 
(adjacent r6-c8 r5-c8 up) (adjacent r6-c8 r7-c8 down) (adjacent r6-c8 r6-c7 left) (adjacent r6-c8 r6-c9 right) 
(adjacent r6-c9 r5-c9 up) (adjacent r6-c9 r7-c9 down) (adjacent r6-c9 r6-c8 left) (adjacent r6-c9 r6-c10 right) 
(adjacent r6-c10 r5-c10 up) (adjacent r6-c10 r7-c10 down) (adjacent r6-c10 r6-c9 left) 
(adjacent r7-c0 r6-c0 up) (adjacent r7-c0 r7-c1 right) 
(adjacent r7-c1 r6-c1 up) (adjacent r7-c1 r7-c0 left) (adjacent r7-c1 r7-c2 right) 
(adjacent r7-c2 r6-c2 up) (adjacent r7-c2 r7-c1 left) (adjacent r7-c2 r7-c3 right) 
(adjacent r7-c3 r6-c3 up) (adjacent r7-c3 r7-c2 left) (adjacent r7-c3 r7-c4 right) 
(adjacent r7-c4 r6-c4 up) (adjacent r7-c4 r7-c3 left) (adjacent r7-c4 r7-c5 right) 
(adjacent r7-c5 r6-c5 up) (adjacent r7-c5 r7-c4 left) (adjacent r7-c5 r7-c6 right) 
(adjacent r7-c6 r6-c6 up) (adjacent r7-c6 r7-c5 left) (adjacent r7-c6 r7-c7 right) 
(adjacent r7-c7 r6-c7 up) (adjacent r7-c7 r7-c6 left) (adjacent r7-c7 r7-c8 right) 
(adjacent r7-c8 r6-c8 up) (adjacent r7-c8 r7-c7 left) (adjacent r7-c8 r7-c9 right) 
(adjacent r7-c9 r6-c9 up) (adjacent r7-c9 r7-c8 left) (adjacent r7-c9 r7-c10 right) 
(adjacent r7-c10 r6-c10 up) (adjacent r7-c10 r7-c9 left) 

; Init Done
)
; Define goal states
(:goal (and (block-at a r1-c7) (block-at b r2-c7) (block-at c r3-c7)))

; Problem Define Done
)
