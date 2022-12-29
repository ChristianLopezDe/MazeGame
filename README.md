
# Web Assembly Final Assignment

This is the project I turned in for my Go Fast with Web Assembly Course

What is showcased from this assignment are the following: the use of JavaScript in the browser (determines the keys pressed by user and loads the web assembly code), the use of image files and how they can be utilized (for my character, enemies, etc), the importance of memory locations (array stores the maze, determines if an enemy is alive or not, coordinates of all characters, etc), the use of HTML to display the game, and how the methods for the game itself could be made in Web Assembly.

**Why use Web Assembly?**
 - Web Assembly runs faster than JavaScript (due to its binary format)
 - It is also more effecient than Javascript in terms of using memory
 - We can create programs (such as C), then compile to Web Assembly, and finally have said code run in browers.
 - It is more secure than Javascript


Notes:

- The original project used Putty, Wat2Wasm, and were ran on the local servers of my classroom.
    - Since the VS extension wasn't working, I used  https://webassembly.github.io/wabt/demo/wat2wasm/ to convert my wat files to wasm.
 - The actual code itself has not been touched/updated/fixed since I turned it in.
    - If I were to go back an edit my code I'd do the following: 
        - Enable the enemies to "kill" the user 
        - Have the blocks spell out "game over" or "You Win!" when either scenario occurs, 
        - Fix the typos/errors on my comments and useless/repeated comments
        - Not have repeated coding methods (Aka, the four long, repeated but slightly edited, methods for the direction my character shoots)


Fun Facts:
 - I received full points for the assignment, completing everything from the rubric:
    - For 25% - Have a maze displayed
    - For 50% - Have a character that can traverse the maze **properly** (no collision, maintable speed, doesn't go outside of canvas box)
    - For 75% - Have the character be able to shoot a projectile that gets removed upon contact with a wall.
    - For 100% - Include enemies that also share **proper** movement. Also, make it so the enemies can be killed.
 - The assignment took approximately two weeks to complete. Apparently we (students) also lost a week of work, as we were assigned the project later than intended 
 - When a character "dies", aka gets in contact with the fireballs, I literally turn them into a block, remove their ability to walk, and put them in the top left corner of the maze.
 - The end of the fireball is smoke, at a glance it looks like the hitmarker icon from the Call of Duty games
 - I've never played Bobble in my life, so the actions of characters are probably not accurate to the real game
 - Collision was the hardest part of the project

