require_relative 'lib/Bank'

# Initialize the elevator bank, a singleton class
bank = Bank.new

puts "Welcome to elevator!"
puts "To push a button, indicate direction and floor like this:  \"u 4\" or \"d 17\""
puts "Or, just press enter to watch elevators move.  Type \"quit\" to quit."
puts

bank.report_status

until (info = gets.chomp) == "quit"
  if info.length > 0 then bank.push_button(*(info.split)) end
  bank.report_status
  bank.report_requests
end
