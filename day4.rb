require "byebug"

Element = Struct.new(:value, :marked) do
  def mark!
    self.marked = true
  end
end

def print_answer(items, draw)
  puts items.flatten.select { |e| !e.marked }.map(&:value).map(&:to_i).sum * draw.to_i
end

File.open "./day4.txt" do |file|
  lines = file.readlines

  draw = lines.shift.strip.split(',')
  lines.shift
  boards = []
  current_board = []
  lines.each do |line|
    if line == "\n"
      boards << current_board
      current_board = []
    else
      current_board << line.strip.split(/\s+/).map { |value| Element.new(value, false) }
    end
  end

  draw.each do |entry|
    boards.each_with_index do |board, board_index|
      next unless board

      board.each do |row|
        row.each do |element|
          element.mark! if element.value == entry
        end
      end

      board.each do |row|
        if row.all? { |e| e.marked }
          print_answer(board, entry)
          boards[board_index] = nil
        end
      end
      (0...board.length).each do |col|
        column = board.map { |row| row[col] }
        if column.all? { |e| e.marked }
          print_answer(board, entry)
          boards[board_index] = nil
        end
      end
    end
  end
end
