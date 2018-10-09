class Question
  attr_reader :answer, :question
  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    @question = "What's #{@num1} + #{@num2}?: "
  end
end