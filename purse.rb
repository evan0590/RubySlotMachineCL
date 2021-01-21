class Purse
  attr_accessor :funds

  def initialize
    @funds = 10
  end

  def credit(bet)
    @funds = @funds + bet
  end

  def debit(bet)
    if @funds < bet
      pass
    else
      @funds = @funds - bet
    end
  end

  def get_balance
    puts "you have " + sprintf('%.2f', @funds)
  end
end
