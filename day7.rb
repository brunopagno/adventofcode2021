File.open "day7.txt" do |file|
  input = file
    .readlines
    .first
    .split(',')
    .map(&:to_i)
    .sort

  data = Array.new(input.last + 1, 0)

  input.each do |el|
    data[el] += 1
  end

  fuel_consumption_rank_thingy = {}
  0.upto(input.last) do |target|
    fuel = 0
    data.each_with_index do |crabs, index|
      distance = (target - index).abs
      cost = distance * (distance + 1) / 2 # https://en.wikipedia.org/wiki/1_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF
      fuel += cost * crabs
    end
    fuel_consumption_rank_thingy[target] = fuel
  end

  puts fuel_consumption_rank_thingy.values.sort.first(50)
end
