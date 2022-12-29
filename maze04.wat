(module
 (import "js" "memory" (memory 1))
 (import "js" "table" (table 1 funcref))
 (global $canvas_width (import "js" "canvas_width") (mut i32))
 (global $canvas_height (import "js" "canvas_height") (mut i32))
 (global $artwork_width (import "js" "artwork_width") (mut i32))
 (global $artwork_height (import "js" "artwork_height") (mut i32))
 (global $canvas_addr (import "js" "canvas_addr") (mut i32))
 (global $artwork_addr (import "js" "artwork_addr") (mut i32))
 (func $console_log (import "js" "console_log") (param i32))
 (func $error_out_of_bounds (import "js" "error_out_of_bounds") (param i32) (param i32) (param i32))
 (func $random (import "js" "random") (param i32) (result i32))
 (func $calc_canvas_address (import "js" "calc_canvas_address") (param i32) (param i32) (result i32))
 (func $calc_artwork_address (import "js" "calc_artwork_address") (param i32) (param i32) (result i32))
 (func $clear_screen (import "js" "clear_screen") (param i32))
 (func $draw_image (import "js" "draw_image") (param i32) (param i32) (param i32) (param i32) (param i32))
 (func $draw_artwork (import "js" "draw_artwork") (param i32) (param i32) (param i32) (param i32) (param i32) (param i32))

;;Is 0x225, AKA Decimal for 549. In 0x225, It is an empty space. Its coordinates are currently (16, 16)
(data (offset (i32.const 0x100))
 "\25\02\00\00" ;;Starts with 0x100, initiliaze x pos "\25\02\00\00"
)


(data (offset (i32.const 0x90))
 "\10\00\00\00" ;;Starts with 0x90, initiliaze x pos
 "\10\00\00\00" ;;Initialize y. Coords are (16, 16)
 )

(data (offset (i32.const 0x7D0)) ;;Equals to 2,000.
 "\01" ;;1 means that Enemy #1 is Alive/Active.
 )
(data (offset (i32.const 0x11c))
 "\08\00\00\00" ;;Starts at 8. Slows down enemy #1
 )
 (data (offset (i32.const 0x10C))
 "\45\03\00\00" ;;Starts with 0x100, initiliaze pos of enemy #1
 )

(data (offset (i32.const 0x110))
 "\10\00\00\00" ;;Initialize x Coord of first enemy
 "\a0\00\00\00" ;;Initialize y Coord of first enemy
)


(data (offset (i32.const 0x7D1)) ;;Equals to 2,001.
 "\01" ;;1 means that Enemy #1 is Alive/Active.
 )

(data (offset (i32.const 0x13c))
 "\08\00\00\00" ;;Starts at 8. Slows down enemy #2
 )
 (data (offset (i32.const 0x12c))
 "\a2\04\00\00" ;;Starts with 0x100, initiliaze pos of enemy #2
 )

(data (offset (i32.const 0x130))
 "\e0\01\00\00" ;;Initialize x Coord of second enemy
 "\40\01\00\00" ;;Initialize y Coord of second enemy
)

 (data (offset (i32.const 0x84))
 "\08\00\00\00" ;;Starts at 8. Slows down character.
 )



(data (offset (i32.const 0x74))
 "\08\00\00\00" ;;Starts at 8. Slows down fireballs shot
 )

(data (offset (i32.const 0x60))
 "\01\00\00\00" ;;Starts facing right. 1 = Direction right. 2 = Left. 3 = Down. 4 = Up. For my character.
)


  (data (offset (i32.const 0x200))
   "\c0\02\00\00"  ;; i32 - represents length of array
   ;;32 in a row.
   "\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01"
   "\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\01\00\00\00\01\01\01\01\01\01\01\01"
   "\01\00\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\01\00\01\01\01\01\01\01\00\01"
   "\01\00\00\00\00\00\01\01\00\01\01\01\00\01\01\01\00\00\00\01\01\00\01\00\00\00\00\00\00\00\00\01"
   "\01\00\01\00\01\00\01\01\00\01\01\01\00\00\00\00\00\00\00\00\00\00\01\01\01\00\00\00\00\00\00\01"
   "\01\00\01\00\01\00\01\01\00\01\01\01\00\00\01\01\01\00\01\01\01\01\01\01\01\01\00\00\01\01\00\01"
   "\01\00\01\00\01\00\00\00\00\00\00\00\00\00\01\01\01\00\00\00\00\00\01\00\01\01\00\00\01\01\01\01"
   "\01\00\01\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\01\00\01\01\01\01\01\01\01\01"
   "\01\00\01\00\01\01\00\00\00\01\01\01\01\00\00\01\00\00\00\01\01\00\01\00\00\00\01\01\00\00\00\01"
   "\01\00\00\00\00\00\00\01\00\01\01\01\01\00\00\00\00\01\00\01\01\00\01\01\01\00\00\00\00\00\00\01"
   "\01\00\00\00\01\01\00\01\00\00\00\00\00\00\01\01\00\01\00\00\00\00\00\00\00\00\01\01\01\01\00\01"
   "\01\00\00\00\01\01\00\00\00\01\01\01\01\00\01\01\00\01\01\01\00\00\00\00\00\00\01\01\00\00\00\01"
   "\01\00\00\00\01\01\01\00\01\01\01\01\01\00\00\00\00\01\01\01\00\00\01\01\00\00\01\01\00\00\00\01"
   "\01\00\00\00\01\01\01\00\01\01\01\01\01\01\01\01\00\00\00\00\00\00\01\01\00\00\01\01\01\00\00\01"
   "\01\00\00\00\01\01\00\00\01\01\01\01\01\00\00\00\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\01"
   "\01\00\00\00\01\01\00\01\01\00\00\00\00\00\01\00\00\00\01\01\01\00\00\00\01\01\01\00\01\01\00\01"
   "\01\00\01\00\00\00\00\01\01\00\01\01\01\01\01\00\01\00\01\00\00\00\01\00\01\01\01\00\01\01\01\01"
   "\01\00\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\01\01\01\00\01\00\00\00\01\00\00\01"
   "\01\00\01\01\01\01\01\00\00\00\01\00\00\00\00\01\01\00\01\01\01\01\01\00\00\00\01\01\01\00\00\01"
   "\01\00\00\00\00\00\01\00\01\00\01\00\01\01\00\01\01\00\00\00\00\00\01\01\00\00\00\00\00\01\00\01"
   "\01\00\01\01\01\00\00\00\01\00\00\00\01\01\01\01\01\01\01\01\01\00\00\00\00\01\01\01\00\00\00\01"
   "\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01"

)

 (func $add_to_x (param $n i32)
    (i32.store (i32.const 0x90) (i32.add (i32.load (i32.const 0x90)) (local.get $n)))
 )
 (func $add_to_y (param $n i32)
    (i32.store (i32.const 0x94) (i32.add (i32.load (i32.const 0x94)) (local.get $n)))
 )

(func $step_Maze ;; (param $progress i32)
   (local $xArr i32)
   (local $yArr i32)
   (local $counter i32)
   (local $stop i32)
   (local $arrIndex i32) ;;The "block"
   (local $yCounter i32)

    ;;Set the values
    (local.set $stop (i32.load (i32.const 0x200)))
    (local.set $xArr(i32.const 0))
    (local.set $yArr(i32.const 0))
    (local.set $arrIndex(i32.const 0x204))
    (local.set $counter (i32.const 0))
    (local.set $yCounter(i32.const 0))


 block $done
    loop $repeat

     (i32.eq (local.get $counter) (local.get $stop)) ;;Finish based on the stop in our array set up.
     br_if $done

     (i32.eq (i32.const 1) (i32.load8_u (local.get $arrIndex))) ;;Put block if location in arr = 1
     if
    (call $draw_artwork
         (i32.const 156) ;;X on Image
          (i32.const 891)
          (i32.const 16)
          (i32.const 16)
          (local.get $xArr) ;;Location on Canvas. X.
          (local.get $yArr)  ;;Location on Canvas. Y.
    )
    end
    (local.set $counter(i32.add(i32.const 1)(local.get $counter)))
    (local.set $xArr (i32.add (i32.const 16) (local.get $xArr)))
(local.set $arrIndex (i32.add (i32.const 1) (local.get $arrIndex)))
   (local.set $yCounter (i32.add (i32.const 1) (local.get $yCounter)))
   (i32.eq (i32.const 32) (local.get $yCounter)) ;;When we are done with a row.
   if
   (local.set $yArr (i32.add (i32.const 16)(local.get $yArr)));;Y goes down.
   (local.set $yCounter (i32.const 0))
   (local.set $xArr(i32.const 0)) ;;Reset X.
   end
     br $repeat
    end $repeat
   end $done

)

(func $step_Character
(local $xDirection i32)
(local $spriteHex i32) ;;Keeps track of memory location 0x100
(local.set $spriteHex (i32.load (i32.const 0x100)))
(i32.store (i32.const 0x70) (i32.add (i32.const 1) (i32.load (i32.const 0x70))))

(i32.eq (i32.const 1) (i32.load (i32.const 0x60)))
if
(local.set $xDirection (i32.const 81))
end

(i32.eq (i32.const 2) (i32.load (i32.const 0x60)))
if
(local.set $xDirection (i32.const 60))
end

(i32.eq (i32.const 4) (i32.load (i32.const 0x60)))
if
(local.set $xDirection (i32.const 122))
end

(i32.eq (i32.const 3) (i32.load (i32.const 0x60)))
if
(local.set $xDirection (i32.const 166))
end



   ;;When I move left or right, change the number in 0x100 by 1 or -1. E.g. 0x100 is 517 (16, 0), then -1 is (0,0), and +1 is (32, 0)
   ;;When I move left or right, change the number in 0x100 by 32 or -32. E.g. 0x100 is 549 (0, 16), then -32 is 516, aka (0,0), and +32 is (0, 32)


(i32.eq (i32.const 1) (i32.div_u (i32.load (i32.const 0x70)) (i32.const 8)))
;; ^ Only move when counter at 0x70 is a multiple of 8. This is done to slow my character.
if
(i32.store (i32.const 0x70) (i32.const 0)) ;;Reset my counter that slows character speed.

  ;;With this and statement, I've made it so we only move left if only the left key is pressed down,
  ;;This limits movement to just one key press. AKA no diagonal movement.
  (i32.and
  (i32.and
   (i32.eqz (i32.load8_u (i32.const 40))) ;;IF 40 is 0. Aka not pressing down.
   (i32.eqz (i32.load8_u (i32.const 38))) ;;IF 38 is 0. Aka not pressing up.
    (i32.load8_u (i32.const 37)))) ;; left
  if
   (i32.eqz (i32.load8_u (i32.add (i32.const -1) (local.get $spriteHex)))) ;;When we load spriteHex - 1, is it equal to 0(0 means empty space)? If so, move left.
    if
    (i32.store  (i32.const 0x100) (i32.add (i32.load(i32.const 0x100))(i32.const -1))) ;;Change memory location 0x100.
      (call $add_to_x (i32.const -16));; Move by 16, as instructed.
      (i32.store (i32.const 0x60) (i32.const 2)) ;;For sprite direction. 2 = left.
    end
    end

  (i32.and
  (i32.and
  (i32.eqz (i32.load8_u (i32.const 37))) ;;Not pressing Left.
   (i32.eqz (i32.load8_u (i32.const 39))) ;;Not pressing right
    (i32.load8_u (i32.const 38)))) ;; up
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const -32) (local.get $spriteHex))))
      if
       (i32.store  (i32.const 0x100) (i32.add (i32.load(i32.const 0x100))(i32.const -32)))
      (call $add_to_y (i32.const -16));;
      (i32.store (i32.const 0x60) (i32.const 4))
    end
  end
 (i32.and
 (i32.and
  (i32.eqz (i32.load8_u (i32.const 38))) ;;Not pressing Up
  (i32.eqz (i32.load8_u (i32.const 40))) ;;Not pressing Down
    (i32.load8_u (i32.const 39)))) ;; right
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const 1) (local.get $spriteHex))))
    if
    (i32.store  (i32.const 0x100) (i32.add (i32.load(i32.const 0x100))(i32.const 1)))
      (call $add_to_x (i32.const 16))
      (i32.store (i32.const 0x60) (i32.const 1))
    end
    end

  (i32.and
  (i32.and
   (i32.eqz (i32.load8_u (i32.const 37)))
   (i32.eqz (i32.load8_u (i32.const 39)))
    (i32.load8_u (i32.const 40)))) ;; down
      if
      (i32.eqz  (i32.load8_u (i32.add (i32.const 32) (local.get $spriteHex))))
       if
       (i32.store  (i32.const 0x100) (i32.add (i32.load(i32.const 0x100))(i32.const 32)))
      (call $add_to_y (i32.const 16)) ;;
      (i32.store (i32.const 0x60) (i32.const 3))
    end
   end

  ;;(i32.and
  ;;(i32.eqz (i32.load8_u(i32.const 0x108))) ;;To shoot only 1 at a time.

    (i32.load8_u (i32.const 32)) ;;SpaceBar is pressed
  if

  (i32.eq (i32.const 1) (i32.load (i32.const 0x60))) ;;Only shoot right.
  if
   (call $step_fireRight)
  end
(i32.eq (i32.const 2) (i32.load (i32.const 0x60))) ;;Shoot Left
  if
   (call $step_fireLeft)
  end

(i32.eq (i32.const 3) (i32.load (i32.const 0x60))) ;;Shoot down
  if
   (call $step_fireDown)
  end


(i32.eq (i32.const 4) (i32.load (i32.const 0x60))) ;;Shoot down
  if
   (call $step_fireUp)
  end

   end
 end

;;The character
 (call $draw_artwork
        (local.get $xDirection)
          (i32.const 68);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x90))
          (i32.load (i32.const 0x94))
    )
)

(func $step_fireRight
(local $xRight i32) ;;x Coordinate for draw_Artwork
;;(local $fireball i32) ;;Location of my fireball. Will initialize to value of 0x100 + 1.
;;(local.set $fireball (i32.add (i32.const 1) (i32.load (i32.const 0x100))))
(i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x100)) (i32.const 1))) ;;Set fireballHex
;;(i32.store (i32.const 0x104) (i32.add (i32.load (i32.const 0x90)) (i32.const 16))) ;;Set fireball XCOOrd.
(i32.store8 (i32.const 0x108) (i32.const 1))
(local.set $xRight (i32.add (i32.load (i32.const 0x90)) (i32.const 16)))


block $done
 loop $repeat

 ;;If the area loaded in is empty.
 ;;(i32.eq (i32.const 1) (i32.load8_u (local.get $fireball)))
 (i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x10c)));;If fireball location = enemy #1
 if
  (i32.store8 (i32.const 0x7d0) (i32.const 0)) ;;Mark enemy as dead
end

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x12c)));;If fireball location = enemy #2
 if
  (i32.store8 (i32.const 0x7d1) (i32.const 0)) ;;Mark enemy as dead
end



  (i32.eq (i32.const 1)(i32.load8_u (i32.load (i32.const 0x64)))) ;;GOOD ONE
 br_if $done
  (call $draw_artwork
          (i32.const 52);;X on Image 102
          (i32.const 475);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          ;;(i32.load (i32.const 0x104))
          (local.get $xRight)
          (i32.load (i32.const 0x94)) ;; y.
    )
 ;;(i32.store (i32.const 0x104)  (i32.add (i32.load (i32.const 0x104) (i32.const 16)))) ;;GOOD ONe
  (local.set $xRight (i32.add (local.get $xRight) (i32.const 16))) ;;Move right
  (i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x64)) (i32.const 1))) ;;GOOD ONE
  ;;(local.set $fireball (i32.add (i32.const 1) (local.get $fireball)))

    br $repeat
  end $repeat
 end $done

(local.set $xRight (i32.add (local.get $xRight) (i32.const -16))) ;;Set it back.
(call $draw_artwork
          (i32.const 274);;X on Image 102
          (i32.const 62);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          ;;(i32.load (i32.const 0x104))
          (local.get $xRight)
          (i32.load (i32.const 0x94)) ;; y.
    )

(i32.store8 (i32.const 32)(i32.const 0)) ;;Make it stop?



(i32.store8 (i32.const 0x108) (i32.const 0))
)



(func $step_fireLeft
(local $xLeft i32) ;;x Coordinate for draw_Artwork
(i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x100)) (i32.const -1))) ;;Set fireballHex
;;(i32.store8 (i32.const 0x108) (i32.const 1))
(local.set $xLeft (i32.add (i32.load (i32.const 0x90)) (i32.const -16)))

block $done
 loop $repeat

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x10c)));;If fireball location = enemy #1
 if
  (i32.store8 (i32.const 0x7d0) (i32.const 0)) ;;Mark enemy as dead
end

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x12c)));;If fireball location = enemy #2
 if
  (i32.store8 (i32.const 0x7d1) (i32.const 0)) ;;Mark enemy as dead
end


  (i32.eq (i32.const 1)(i32.load8_u (i32.load (i32.const 0x64)))) ;;GOOD ONE
 br_if $done
  (call $draw_artwork
          (i32.const 52);;X on Image 102
          (i32.const 475);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          ;;(i32.load (i32.const 0x104))
          (local.get $xLeft)
          (i32.load (i32.const 0x94)) ;; y.
    )
  (local.set $xLeft (i32.add (local.get $xLeft) (i32.const -16))) ;;Move Left
  (i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x64)) (i32.const -1))) ;;GOOD ONE

    br $repeat
  end $repeat
 end $done


(local.set $xLeft (i32.add (local.get $xLeft) (i32.const 16))) ;;Set it back.
(call $draw_artwork
          (i32.const 274);;X on Image 102
          (i32.const 62);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          ;;(i32.load (i32.const 0x104))
          (local.get $xLeft)
          (i32.load (i32.const 0x94)) ;; y.
    )

(i32.store8 (i32.const 32)(i32.const 0)) ;;Make it stop?
(i32.store8 (i32.const 0x108) (i32.const 0))
)

(func $step_fireDown
(local $yDown i32) ;;x Coordinate for draw_Artwork

(i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x100)) (i32.const 32))) ;;Set fireballHex

(i32.store8 (i32.const 0x108) (i32.const 1))
(local.set $yDown (i32.add (i32.load (i32.const 0x94)) (i32.const 16)))

block $done
 loop $repeat

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x10c)));;If fireball location = enemy
 if
  (i32.store8 (i32.const 0x7d0) (i32.const 0)) ;;Mark enemy as dead
end

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x12c)));;If fireball location = enemy #2
 if
  (i32.store8 (i32.const 0x7d1) (i32.const 0)) ;;Mark enemy as dead
end


 ;;If the area loaded in is empty.
 ;;(i32.eq (i32.const 1) (i32.load8_u (local.get $fireball)))
  (i32.eq (i32.const 1)(i32.load8_u (i32.load (i32.const 0x64)))) ;;GOOD ONE
 br_if $done
  (call $draw_artwork
          (i32.const 52);;X on Image 102
          (i32.const 475);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x90))
          (local.get $yDown)
    )

  (local.set $yDown (i32.add (local.get $yDown) (i32.const 16))) ;;Move right
  (i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x64)) (i32.const 32))) ;;GOOD ONE


    br $repeat
  end $repeat
 end $done


(local.set $yDown (i32.add (local.get $yDown) (i32.const -16))) ;;Set it back.
(call $draw_artwork
          (i32.const 274);;X on Image 102
          (i32.const 62);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x90))
         ;; (local.get $xRight)
          (local.get $yDown) ;; y.
    )

(i32.store8 (i32.const 32)(i32.const 0)) ;;Make it stop?
(i32.store8 (i32.const 0x108) (i32.const 0))
)

(func $step_fireUp
(local $yUp i32) ;;x Coordinate for draw_Artwork

(i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x100)) (i32.const -32))) ;;Set fireballHex

(i32.store8 (i32.const 0x108) (i32.const 1))
(local.set $yUp (i32.add (i32.load (i32.const 0x94)) (i32.const -16)))

block $done
 loop $repeat

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x10c)));;If fireball location = enemy
 if
  (i32.store8 (i32.const 0x7d0) (i32.const 0)) ;;Mark enemy as dead
end

(i32.eq (i32.load (i32.const 0x64)) (i32.load (i32.const 0x12c)));;If fireball location = enemy #2
 if
  (i32.store8 (i32.const 0x7d1) (i32.const 0)) ;;Mark enemy as dead
end



 ;;If the area loaded in is empty.
 ;;(i32.eq (i32.const 1) (i32.load8_u (local.get $fireball)))
  (i32.eq (i32.const 1)(i32.load8_u (i32.load (i32.const 0x64)))) ;;GOOD ONE
 br_if $done
  (call $draw_artwork
          (i32.const 52);;X on Image 102
          (i32.const 475);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x90))
          (local.get $yUp)
    )

  (local.set $yUp (i32.add (local.get $yUp) (i32.const -16))) ;;Move Up
  (i32.store (i32.const 0x64) (i32.add (i32.load (i32.const 0x64)) (i32.const -32))) ;;GOOD ONE


    br $repeat
  end $repeat
 end $done


(local.set $yUp (i32.add (local.get $yUp) (i32.const 16))) ;;Set it back.
(call $draw_artwork
          (i32.const 274);;X on Image 102
          (i32.const 62);;Y on Image.
          (i32.const 16)
          (i32.const 16)
          (i32.load (i32.const 0x90))
         ;; (local.get $xRight)
          (local.get $yUp) ;; y.
    )

(i32.store8 (i32.const 32)(i32.const 0)) ;;Make it stop?
(i32.store8 (i32.const 0x108) (i32.const 0))
)

(func $step_enemy1 (param $ghost_addr i32) (param $progress i32)
    (local $enemyHex i32)
    (local $yDirection i32)
    (local $ghost_addr_x i32)
    (local $ghost_addr_y i32)
    (local $ghost_addr_dir i32)
    (local $ghost_artwork_frame i32)
    (local $xDirection i32) ;;To draw the proper direction sprite
;;(local $ghost_artwork_x i32)
     ;;(local $ghost_artwork_y i32)
    (local $ghost_movement i32)
    (local.set $yDirection (i32.const 425))
    (i32.store (i32.const 0x11c) (i32.add (i32.const 1) (i32.load (i32.const 0x11c))))

   (local.set $enemyHex (i32.load (local.get $ghost_addr)))
    (local.set $ghost_addr_x (i32.add (local.get $ghost_addr) (i32.const 4)))
    (local.set $ghost_addr_y (i32.add (local.get $ghost_addr) (i32.const 8)))

    ;; dir: 0 == stop, 1 == left, 2 == up, 3 == right, 4 == down
    (local.set $ghost_addr_dir (i32.add (local.get $ghost_addr) (i32.const 12)))
    (local.set $ghost_movement (i32.const 3))

    ;; divide $progress by 2^10 = 1024 and then take the three least significant bits to get a number that cycles 0..7 (inclusive)
    (local.set $ghost_artwork_frame (i32.and (i32.shr_u (local.get $progress) (i32.const 10)) (i32.const 7)))
      ;;(local.set $ghost_artwork_x (i32.add (i32.const 456) (i32.mul (i32.const 0x10) (local.get $ghost_artwork_frame))))
    ;;(local.set $ghost_artwork_y (i32.const 0x40))

    ;; choose new random direction based on $progress
    (i32.eqz (i32.and (i32.shr_u (local.get $progress) (i32.const 5)) (i32.const 0xF)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.add (call $random (i32.const 3)) (i32.const 1)))
    end

(i32.eq (i32.const 1) (i32.load8_u (i32.const 0x7D0))) ;;Only run if enemy is  "active"
if
(i32.eq (i32.const 1) (i32.div_u (i32.load (i32.const 0x11c)) (i32.const 8))) ;;To slow down character
  if
(i32.store (i32.const 0x11c) (i32.const 0))

    ;; if direction == left and x < $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 1))
      (i32.lt_u (i32.load (local.get $ghost_addr_x)) (local.get $ghost_movement)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

    ;; if direction == up and y < $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 2))
      (i32.lt_u (i32.load (local.get $ghost_addr_y)) (local.get $ghost_movement)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end
 ;; if direction == right and x > $canvas_width - $ghost_artwork_width - $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 3))
      (i32.gt_u (i32.load (local.get $ghost_addr_x)) (i32.sub (i32.sub (global.get $canvas_width) (i32.const 16)) (local.get $ghost_movement))))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

    ;; if direction == down and y > $canvas_height - $ghost_artwork_height - $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 4))
      (i32.gt_u (i32.load (local.get $ghost_addr_y)) (i32.sub (i32.sub (global.get $canvas_height) (i32.const 16)) (local.get $ghost_movement))))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

    ;; update ghost's (x,y) coordinates based on the direction


    (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 1)) ;;Left
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const -1) (local.get $enemyHex))))
      if
    ;;  (i32.store (local.get $ghost_addr_x) (i32.add (i32.load (local.get $ghost_addr_x)) (i32.mul (local.get $ghost_movement) (i32.const -1))))
    (i32.store  (i32.const 0x10c) (i32.add (i32.load(i32.const 0x10c))(i32.const -1)))
    (i32.store (i32.const 0x110) (i32.add (i32.load (i32.const 0x110)) (i32.const -16)))
    end
  end
(i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 2)) ;; UP
    if
   (i32.eqz (i32.load8_u (i32.add (i32.const -32) (local.get $enemyHex))))
   if
    ;;  (i32.store (local.get $ghost_addr_y) (i32.add (i32.load (local.get $ghost_addr_y)) (i32.mul (local.get $ghost_movement) (i32.const -1))))
    (i32.store (i32.const 0x114) (i32.add (i32.load (i32.const 0x114)) (i32.const -16)))
    (i32.store  (i32.const 0x10c) (i32.add (i32.load(i32.const 0x10c))(i32.const -32)))
    end
    end


    (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 3)) ;;Right
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const 1) (local.get $enemyHex))))
      if
   ;;   (i32.store (local.get $ghost_addr_x) (i32.add (i32.load (local.get $ghost_addr_x)) (local.get $ghost_movement)))
    (i32.store  (i32.const 0x10c) (i32.add (i32.load(i32.const 0x10c))(i32.const 1)))
    (i32.store (i32.const 0x110) (i32.add (i32.load (i32.const 0x110)) (i32.const 16)))
    end
  end

    (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 4)) ;;Down
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const 32) (local.get $enemyHex))))
    if
     ;; (i32.store (local.get $ghost_addr_y) (i32.add (i32.load (local.get $ghost_addr_y)) (local.get $ghost_movement)))
     (i32.store (i32.const 0x114) (i32.add (i32.load (i32.const 0x114)) (i32.const 16)))
    (i32.store  (i32.const 0x10c) (i32.add (i32.load(i32.const 0x10c))(i32.const 32)))
    end
   end
end
end

(i32.eq (i32.const 1) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 153))
end

(i32.eq (i32.const 2) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 132))
end

(i32.eq (i32.const 3) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 196))
end

(i32.eq (i32.const 4) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 174))
end

(i32.eq (i32.const 0) (i32.load8_u (i32.const 0x7D0)))
if
(local.set $xDirection(i32.const 156))
(local.set $yDirection (i32.const 891))
(i32.store (i32.const 0x110)(i32.const 0))
(i32.store (i32.const 0x114)(i32.const 0))
end

(call $draw_artwork
       (local.get $xDirection)
       (local.get $yDirection)
          (i32.const 16)
          (i32.const 16)
          (i32.load (local.get $ghost_addr_x))
          (i32.load (local.get $ghost_addr_y))
    )
 )

(func $step_enemy2 (param $ghost_addr i32) (param $progress i32)
    (local $enemyHex i32)
    (local $yDirection i32)
    (local $ghost_addr_x i32)
    (local $ghost_addr_y i32)
    (local $ghost_addr_dir i32)
    (local $ghost_artwork_frame i32)
    (local $xDirection i32) ;;To draw the proper direction sprite
;;(local $ghost_artwork_x i32)
     ;;(local $ghost_artwork_y i32)
    (local $ghost_movement i32)
    (local.set $yDirection (i32.const 425))
    (i32.store (i32.const 0x13c) (i32.add (i32.const 1) (i32.load (i32.const 0x13c))))

   (local.set $enemyHex (i32.load (local.get $ghost_addr)))
    (local.set $ghost_addr_x (i32.add (local.get $ghost_addr) (i32.const 4)))
    (local.set $ghost_addr_y (i32.add (local.get $ghost_addr) (i32.const 8)))

    ;; dir: 0 == stop, 1 == left, 2 == up, 3 == right, 4 == down
    (local.set $ghost_addr_dir (i32.add (local.get $ghost_addr) (i32.const 12)))
    (local.set $ghost_movement (i32.const 3))

    (local.set $ghost_artwork_frame (i32.and (i32.shr_u (local.get $progress) (i32.const 10)) (i32.const 7)))


    ;; choose new random direction based on $progress
    (i32.eqz (i32.and (i32.shr_u (local.get $progress) (i32.const 5)) (i32.const 0xF)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.add (call $random (i32.const 3)) (i32.const 1)))
    end

(i32.eq (i32.const 1) (i32.load8_u (i32.const 0x7D1))) ;;Only run if enemy is  "active"
if
(i32.eq (i32.const 1) (i32.div_u (i32.load (i32.const 0x13c)) (i32.const 8))) ;;To slow down character
  if
(i32.store (i32.const 0x13c) (i32.const 0))

    ;; if direction == left and x < $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 1))
      (i32.lt_u (i32.load (local.get $ghost_addr_x)) (local.get $ghost_movement)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end
;; if direction == up and y < $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 2))
      (i32.lt_u (i32.load (local.get $ghost_addr_y)) (local.get $ghost_movement)))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

    ;; if direction == right and x > $canvas_width - $ghost_artwork_width - $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 3))
      (i32.gt_u (i32.load (local.get $ghost_addr_x)) (i32.sub (i32.sub (global.get $canvas_width) (i32.const 16)) (local.get $ghost_movement))))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

 ;; if direction == down and y > $canvas_height - $ghost_artwork_height - $ghost_movement, then direction = stop
    (i32.and
      (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 4))
      (i32.gt_u (i32.load (local.get $ghost_addr_y)) (i32.sub (i32.sub (global.get $canvas_height) (i32.const 16)) (local.get $ghost_movement))))
    if
      (i32.store (local.get $ghost_addr_dir) (i32.const 0))
    end

    ;; update ghost's (x,y) coordinates based on the direction

(i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 1)) ;;Left
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const -1) (local.get $enemyHex))))
      if
    ;;  (i32.store (local.get $ghost_addr_x) (i32.add (i32.load (local.get $ghost_addr_x))(i32.mul (local.get $ghost_movement) (i32.const -1))))
    (i32.store  (i32.const 0x12c) (i32.add (i32.load(i32.const 0x12c))(i32.const -1)))
    (i32.store (i32.const 0x130) (i32.add (i32.load (i32.const 0x130)) (i32.const -16)))
    end
  end


    (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 2)) ;; UP
    if
   (i32.eqz (i32.load8_u (i32.add (i32.const -32) (local.get $enemyHex))))
   if
    ;;  (i32.store (local.get $ghost_addr_y) (i32.add (i32.load (local.get $ghost_addr_y)) (i32.mul (local.get $ghost_movement) (i32.const -1))))
    (i32.store (i32.const 0x134) (i32.add (i32.load (i32.const 0x134)) (i32.const -16)))
    (i32.store  (i32.const 0x12c) (i32.add (i32.load(i32.const 0x12c))(i32.const -32)))
    end
    end

 (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 3)) ;;Right
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const 1) (local.get $enemyHex))))
      if
   ;;   (i32.store (local.get $ghost_addr_x) (i32.add (i32.load (local.get $ghost_addr_x)) (local.get $ghost_movement)))
    (i32.store  (i32.const 0x12c) (i32.add (i32.load(i32.const 0x12c))(i32.const 1)))
    (i32.store (i32.const 0x130) (i32.add (i32.load (i32.const 0x130)) (i32.const 16)))
    end
  end

 (i32.eq (i32.load (local.get $ghost_addr_dir)) (i32.const 4)) ;;Down
    if
    (i32.eqz (i32.load8_u (i32.add (i32.const 32) (local.get $enemyHex))))
    if
     ;; (i32.store (local.get $ghost_addr_y) (i32.add (i32.load (local.get $ghost_addr_y))(local.get $ghost_movement)))
     (i32.store (i32.const 0x134) (i32.add (i32.load (i32.const 0x134)) (i32.const 16)))
    (i32.store  (i32.const 0x12c) (i32.add (i32.load(i32.const 0x12c))(i32.const 32)))
    end
   end
end
end

(i32.eq (i32.const 1) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 153))
end

(i32.eq (i32.const 2) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 132))
end

(i32.eq (i32.const 3) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 196))
end

(i32.eq (i32.const 4) (i32.load (i32.const 0x118)))
if
(local.set $xDirection (i32.const 174))
end

(i32.eq (i32.const 0) (i32.load8_u (i32.const 0x7D1)))
if
(local.set $xDirection(i32.const 156))
(local.set $yDirection (i32.const 891))
(i32.store (i32.const 0x130)(i32.const 0))
(i32.store (i32.const 0x134)(i32.const 0))
end

(call $draw_artwork
       (local.get $xDirection)
       (local.get $yDirection)
          (i32.const 16)
          (i32.const 16)
          (i32.load (local.get $ghost_addr_x))
          (i32.load (local.get $ghost_addr_y))
    )
 )


(func $step (export "step") (param $progress i32)
 (call $clear_screen (i32.const 0xFFeb343d)) ;;Turn it to blue.
 (call $step_Maze)
 (call $step_Character)
 (call $step_enemy1  (i32.const 0x10c) (local.get $progress))
 (call $step_enemy2  (i32.const 0x12c) (local.get $progress))

)
)