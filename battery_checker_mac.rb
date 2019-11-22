require 'pry'
require 'pry-byebug'

def check_power
  `pmset -g batt`.match(/\d+%/).to_s.chop.to_i
end

check_interval_sec = 10
state = true

powers = []
powers << check_power

system "clear"
puts '👍 Battery Check is Running !'
puts '✋ You can stop it by Ctr + C'

loop do
  powers << check_power
  if powers[0] > powers[1]
    `terminal-notifier -appIcon battery-icon.png -title "Decrese" -message "#{powers[0]}% -> #{powers[1]}%" -sound default`
    state = false
    check_interval_sec = 10
  elsif powers[0] < powers[1] && !state
    `terminal-notifier -appIcon battery-icon.png -title "✅Success" -message "#{powers[0]}% -> #{powers[1]}%" -sound default`
    state = true
    check_interval_sec = 60
  end
  powers.shift

  # puts "🔋 #{powers.first}%"
  sleep check_interval_sec
end
