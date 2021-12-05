require "byebug"

Line = Struct.new(:x1, :y1, :x2, :y2)

File.open "day5.txt" do |file|
  raw_input = file.readlines

  input = raw_input
    .map { |l| l.split(' -> ') }
    .map do |p1, p2|
      x1, y1 = p1.split(',').map(&:to_i)
      x2, y2 = p2.split(',').map(&:to_i)
      Line.new(x1, y1, x2, y2)
    end

  # matrix 1000x1000
  board = Array.new(1000) { Array.new(1000, 0) }

  input.each do |line|
    x1, x2, y1, y2 = line.x1, line.x2, line.y1, line.y2
    board[y1][x1] += 1
    while x1 != x2 || y1 != y2 do
      x1 = x1 != x2 ? x1 + (x2 - x1) / (x2 - x1).abs : x1
      y1 = y1 != y2 ? y1 + (y2 - y1) / (y2 - y1).abs : y1
      board[y1][x1] += 1
    end
  end

  result = board.map do |row|
    row.select { |e| e > 1 }.count
  end.sum

  puts result
end
