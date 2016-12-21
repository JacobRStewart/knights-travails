def possible_moves_from(current_square, moves=[])
	location = current_square.coords

	moves << Square.new([location[0]-2, location[1]+1], current_square.depth + 1, current_square)
	moves << Square.new([location[0]-2, location[1]-1], current_square.depth + 1, current_square)
	moves << Square.new([location[0]-1, location[1]+2], current_square.depth + 1, current_square)
	moves << Square.new([location[0]-1, location[1]-2], current_square.depth + 1, current_square)
	moves << Square.new([location[0]+1, location[1]+2], current_square.depth + 1, current_square)
	moves << Square.new([location[0]+1, location[1]-2], current_square.depth + 1, current_square)
	moves << Square.new([location[0]+2, location[1]+1], current_square.depth + 1, current_square)
	moves << Square.new([location[0]+2, location[1]-1], current_square.depth + 1, current_square)

	#checks to see if move is out of bounds
	moves.delete_if { |square| square.coords[0] < 1 || square.coords[0] > 8 || square.coords[1] < 0 || square.coords[1] > 8}
	moves
end

def knight_moves(start, finish)
	path = []
	queue = [Square.new(start)]

	until queue.empty?
		current_square = queue.shift
		if current_square.coords == finish
			prev_square = current_square.prev_move
			until prev_square == nil
				path.unshift(prev_square.coords)
				prev_square = prev_square.prev_move
			end
			path << current_square.coords
			puts "You made it in #{current_square.depth} moves! \nHere's your path: \n"
			path.each { |step| p step }
			break
		 else
			moves = possible_moves_from(current_square)
			moves.each do |move|
				queue << move
			end
		end
	end

end


class Square

	attr_reader :coords, :depth, :prev_move

	def initialize(coords, depth=0, prev_move=nil)
		@coords = coords
		@depth = depth
		@prev_move = prev_move
	end

end


knight_moves([5,7], [4,3])
