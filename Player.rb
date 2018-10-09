class Player
  attr_accessor :name
  attr_accessor :num_of_lives
  def initialize(name)
    @name = name
    @num_of_lives = 3;
  end
end
