File.open "day6.txt" do |file|
  input = file.readlines.first.split(',').map(&:to_i)

  groups = input
    .sort
    .chunk { |life| life }
    .map { |life, cc| [life, cc.length] }

  1.upto(256).each do |day|
    puts "day #{day}"

    groups.map! { |life, amount| [life - 1, amount] }
    spawners_idx = groups.index { |life, amount| life < 0 }

    if spawners_idx
      spawners = groups.delete_at(spawners_idx)
      groups << [8, spawners[1]]
      sixth_idx = groups.index { |life, amount| life == 6 }
      if sixth_idx
        sixth = groups.delete_at(sixth_idx)
        groups << [6, sixth[1] + spawners[1]]
      else
        groups << [6, spawners[1]]
      end
    end
  end

  puts groups.map { |l, a| a }.sum
end
