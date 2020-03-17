require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


5.times {Startup.new(Faker::App.name, Faker::Name.name, Faker::Company.industry)}
5.times {VentureCapitalist.new(Faker::Name.name, rand(500000..5000000000))}

5.times do |i|
  FundingRound.new(Startup.all[i], VentureCapitalist.all[i], Faker::Company.industry, rand(100000..2000000))
end

5.times do |i|
  FundingRound.new(Startup.all[i], VentureCapitalist.all[i + 1], Faker::Company.industry, rand(100000..2000000))
end

binding.pry
0 #leave this here to ensure binding.pry isn't the last line