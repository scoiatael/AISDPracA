Dir['*.gen'].sort.each do |gen|
  name, _ = gen.split('.gen')
  puts "Starting #{name}"
  `make run-test TEST=#{name}`
  ok = `make -s verify-test TEST=#{name}`
  fail "#{name} failed with #{ok}" unless ok.strip.upcase == 'OK'
  puts '..done'
end

puts 'OK'
