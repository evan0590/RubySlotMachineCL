require_relative 'purse'
require_relative 'slot_machine'

wallet = Purse.new
machine = Slot.new
puts "==========  SLOT MACHINE  =========="
puts "Minimum bet is 2. Type 'N' to exit. "
wallet.get_balance
while wallet.funds > 1
  puts "How much do you bet: "
  bet = gets.chomp
  if bet == "N" or bet == "n"
    puts "You typed 'N' - Thank you for playing."
    break
  else
    begin
      gamble = machine.take_bet(bet.to_i)
    rescue NameError
      nil
    else
      if gamble < 2
        nil
      elsif gamble > wallet.funds
        wallet.debit(gamble)
      else
        wallet.debit(gamble)
        machine.pull_handle
        machine.show_slot
        wallet.credit(machine.score_slot(gamble))
        funds_format = sprintf('%.2f', wallet.funds)
        if wallet.funds < 2
          puts "You score " + machine.score_slot(gamble).to_s + " - Thank you for playing."
          puts "You are leaving with " + funds_format.to_s + "."
        elsif machine.score_slot(gamble) == 0
          puts "You score " + machine.score_slot(gamble).to_s + " - you have " + funds_format.to_s
        else
          puts "You score " + machine.score_slot(gamble).to_s + " - you have " + funds_format.to_s
        end
      end
    end
  end
end

