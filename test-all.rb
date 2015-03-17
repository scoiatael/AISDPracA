Dir['*.gen'].sort.each do |gen|
  name, _ = gen.split('.gen')
  puts "Starting #{name}"
  `perl #{gen} > #{name}.in`
  `cat #{name}.in | ./Main +RTS -h -M16m > #{name}_prog.out`
  ok = `./verify #{name}.in #{name}.out #{name}_prog.out && echo OK`
  fail "#{name} failed with #{ok}" unless ok.strip.upcase == 'OK'
  puts '..done'
end

puts 'OK'
