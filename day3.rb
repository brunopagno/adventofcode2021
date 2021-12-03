require 'byebug'

def zeroes_at_index(charray, i)
  at_index(charray, i, '0')
end

def ones_at_index(charray, i)
  at_index(charray, i, '1')
end

def at_index(charray, i, val)
  charray.select { |c| c[i] == val }.count
end


File.open "./day3.txt" do |file|
  lines = file.readlines

  oxy = lines.clone
  (0..lines.length).each do |i|
    break if oxy.length == 1
    zeroes = zeroes_at_index(oxy, i)
    ones = ones_at_index(oxy, i)
    keep_char = ''
    if ones > zeroes
      keep_char = '1'
    elsif zeroes > ones
      keep_char = '0'
    else
      keep_char = '1'
    end

    oxy = oxy.select { |line| line[i] == keep_char }
  end

  co2 = lines.clone
  (0..lines.length).each do |i|
    break if co2.length == 1
    zeroes = zeroes_at_index(co2, i)
    ones = ones_at_index(co2, i)
    keep_char = ''
    if ones < zeroes
      keep_char = '1'
    elsif zeroes < ones
      keep_char = '0'
    else
      keep_char = '0'
    end

    co2 = co2.select { |line| line[i] == keep_char }
  end

  oxy = oxy.first.strip
  co2 = co2.first.strip
  puts "binaries oxy(#{oxy}), co2(#{co2})"
  oxy = oxy.to_i(2)
  co2 = co2.to_i(2)
  puts "integers oxy(#{oxy}), co2(#{co2})"
  puts "result #{oxy * co2}"
end
