from engines import Engine
from copy import deepcopy

class StudentEngine(Engine):
    """ Game engine that implements a simple fitness function maximizing the
    difference in number of pieces in the given color's favor. """
    def __init__(self):
        self.alpha_beta = False
        self.col = 0
        #self.node_gen = {}
        #self.branch_factor = []


        #representation of weights of squares in othello
        self.weights = [[120, -20, 20, 5, 5, 20, -20, 120],
                        [-20, -40,  -5,  -5,  -5,  -5, -40, -20],
                        [20,  -5,  15,   3,   3,  15,  -5,  20],
                        [5,  -5,   3,   3,   3,   3,  -5,   5],
                        [5,  -5,   3,   3,   3,   3,  -5,   5],
                        [20,  -5,  15,   3,   3,  15,  -5,  20],
                        [-20, -40,  -5,  -5,  -5,  -5, -40, -20],
                        [120, -20,  20,   5,   5,  20, -20, 120]]

    def get_move(self, board, color, move_num=None,
                 time_remaining=None, time_opponent=None):
        """ Return a move for the given color that maximizes the difference in 
        number of pieces for that color. """
        # Get a list of all legal moves.
        moves = board.get_legal_moves(color)

        #this is where i was initially testing branch factor, but i moved it to
        #within the algorithms as well when i realized you wanted it for every
        #node generated...anyway, this is the code, and i marked where i moved it for tests
        #self.branch_factor.append(len(moves))
        #print(self.branch_factor) 
        #by the end it prints out the branch factor of each time
        
        self.col = color

        
        if self.alpha_beta == False:
            #nodes_revisited = 0

            #s, m = self.minimax2(board, color, 3)
            s, m = self.minimax(board, color, 0, 3)
            
            
            #NOTE THAT I USED THIS COMMENTED OUT CODE IN THE ELSE
            #STATEMENT HERE IN THE SAME WAY, BUT I DELETED IT TO MAKE
            #THIS LOOK MORE READABLE:

            #print(len(self.node_gen.keys()))
            #for x in self.node_gen:
                #if self.node_gen[x] >1:
                    #nodes_revisited = nodes_revisited + self.node_gen[x] - 1
            #print nodes_revisited
            return m
        else:
            if time_remaining <= 10:
                #if running out of time, do alpha beta with a lower max depth
                s, m = self.minimax_alpha_beta(board, color, 0, 4, -10000, 10000)
                return  m
            else:
                
                s, m = self.minimax_alpha_beta(board, color, 0, 5, -10000, 10000)
        
                return m
        
        
        
        # Return the best move according to our simple utility function:
        # which move yields the largest different in number of pieces for the
        # given color vs. the opponent?

        #chosen = max(moves, key=lambda move: self._get_cost(board, color, move))
	#return max(moves, key=lambda move: self._get_cost(board, color, move))

        

    

    def heuristic(self, board, color):
        
        score = 0
        my_squares = board.get_squares(color)
        enemy_squares = board.get_squares(-color)
        for move in my_squares:
            x = move[0]
            y = move[1]
            score = score + self.weights[x][y]
        for move2 in enemy_squares:
            x2 = move2[0]
            y2 = move2[1]
            score = score - self.weights[x2][y2]
        
        return score

    def minimax_alpha_beta(self, board, color, depth, max_depth, alpha, beta):
        if depth == max_depth:
            if depth % 2 == 0:
                #max depth is even
                if color == -1:
                    #color is black
                    return self.heuristic(board, -color), None
                else:
                    #color is white
                    return self.heuristic(board, color), None
            
            else:
                #max depth is odd
                if color == -1:

                    return self.heuristic(board, -color), None
                else:
                    return self.heuristic(board, color), None
        moves = board.get_legal_moves(color)
        
        #can put code for how many child nodes here for branching factor

        if len(moves) == 0:
            #no moves
            return self.heuristic(board, color), None

        best_move = None
        if color ==1:
            #white
            for move in moves:
                #explore children
                b = deepcopy(board)
                b.execute_move(move, color)

                #did the node_gen stuff here, see minimax or q2_gyg2104.txt
                #for the exact code
                



                #color alternates
                value = self.minimax_alpha_beta(b, -color, depth+1, max_depth, alpha, beta)[0]
                if value > alpha:
                    alpha = value
                    best_move = move
                if alpha >= beta:
                    #stop going down this branch
                    break
            return alpha, best_move
        else:
            #black
            for move in moves:
                b = deepcopy(board)
                b.execute_move(move, color)



                #also did node_gen here

                value = self.minimax_alpha_beta(b, -color, depth+1, max_depth, alpha, beta)[0]
                if value < beta:
                    beta = value
                    best_move = move

                if beta <= alpha:
                    #stop going down this branch
                    break
            return beta, best_move



    def minimax2(self, board, color, depth):
        #IGNORE THIS METHOD, I WAS CHECKING TO SEE IF DOING
        #WHAT WAS IN THE SLIDE WOULD MAKE IT WORK BETTER BUT IT IS THE SAME
        moves = board.get_legal_moves(color)
        
        best_move = None
        if not moves:
            
            return self.heuristic(board, color), None
        if depth == 0:
            
            return self.heuristic(board, color), None
        best_score = -1000
        for move in moves:
            b = deepcopy(board)
            b.execute_move(move, color)
            value = self.minimax2(b, color, depth-1)
            score = value[0]
            
            if score > best_score:
                best_score = score
                best_move = move
        return best_score, best_move
        
    def minimax(self, board, color, depth, max_depth):
        #minimax to certain depth
        if depth == max_depth:
            return self.heuristic(board, color), None
            
        best_move = None
        best_score = 0
        if color == 1:
            best_score = -10000
        else:
            best_score = 10000

        #by making a moves = board.get_legal_moves(color) here
        #can put in the other code in my q2 file in order to figure out branching factor

        for move in board.get_legal_moves(color):
            #make child board with this possible move on it
            b = deepcopy(board)
            b.execute_move(move, color)

            #just to show how I was getting info for node_gen:
            #l = [b.get_squares(color), b.get_squares(-color)]
            #tup = tuple(tuple(i) for i in l)
            #if self.node_gen.has_key(tup):
                #self.node_gen[tup] = self.node_gen[tup] + 1
            #else:
                #self.node_gen[tup] = 1





            #recurse
            score = self.minimax(b, color, depth+1, max_depth)
            if self.col == color:
                #find best score
                if score > best_score:
                    best_score = score
                    best_move = move
            else:
                #find best score
                if score < best_score:
                    best_score = score
                    best_move = move

        return best_score, best_move

    

    def count(self, color):
        #should prob jus use board.count(color)
        """ Count the number of pieces of the given color.
        (1 for white, -1 for black, 0 for empty spaces)"""
        count = 0
        for y in range(8):
            for x in range(8):
                if self[x][y] == color:
                    count +=1
        return count

        
engine = StudentEngine
