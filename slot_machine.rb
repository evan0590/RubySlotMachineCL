require 'emojis'
emojis = Emojis.new

# global variable
$faces = [emojis[:red_apple], emojis[:peach], emojis[:tangerine]]

class Column
  attr_accessor :face

  def initialize
    @face = $faces.sample
  end

  def change_face
    @face = $faces.sample
  end
end

class Slot
  attr_accessor :x_slot, :y_slot, :z_slot

  def initialize
    @x_slot = Column.new
    @y_slot = Column.new
    @z_slot = Column.new
  end

  def take_bet(bet)
    @bet = bet
    bet
  end

  def show_slot
    puts @x_slot.face + @y_slot.face + @z_slot.face
  end

  def pull_handle
    @x_slot.change_face
    @y_slot.change_face
    @z_slot.change_face
  end

  def score_slot(bet)
    if @x_slot.face == @y_slot.face && @x_slot.face == @z_slot.face
      bet * 2
    elsif @x_slot.face == @y_slot.face || @y_slot.face == @z_slot.face || @x_slot.face == @z_slot.face
      bet * 1.5
    else
      0
    end
  end
end
