README - gyg2104 (Gracie Gilbert)
readme_gyg2104.txt
PART 1:
I used the same heuristic for both, which is that I have an ideal board
weighting stored in an array from initialization, and then I compare the
actually moves on the possible boards passed into the heuristic function
with this board, and add all of the values that my color is on and subtract
the enemy values. The board weights are weights that I found online because
a lot of people have run Monte Carlo simulations to figure out the best
placements in Othello. The other thing I did is that, in part 2 when I am
doing alpha beta, I check to see how much time is left, and if it is 10 or
less seconds then I reduce the depth 2 levels so that it runs faster so that
I don’t (hopefully) get disqualified for time.
The heuristic isn’t great to be honest, but it at least works a little bit.

(please note that I included a function minimax2 which is just the minimax
done a little differently that I didn’t want to delete in case I need it
later - but the one this program actually uses is just the function
“minimax”)
In order to create the minimax algorithm, I just did what the pseudocode in
the book said to do for the most part. The way that I explored each of the
possibilities to a certain depth of the trees is by copying the board and
then executing the possible move on the copied board. 
Then, by doing a recursive call, I continued to get the whole tree. 
By the way, for the original values of best_score I was using the either
-10000 or 10000 because I figured it was just as good as doing -infinity or
infinity.


PART 2:
I also mainly just did what the book said to do here. I added in some kind
of weird conditions about what color to use when calculating the heuristic
because I noticed that without them it would return the worst possible
solutions instead of the best. So for example sometimes I will return a
negative instead of a positive. 
The idea of the function is  basically the same as the minimax except I
break instead of going all the way down branches if it is unnecessary. 


See q2_gyg2104.txt for Part 3 solutions
