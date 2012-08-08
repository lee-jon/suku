Given /^a game is in progress$/ do
  @puzzle = Sudoku::Board.new "009730526005020800608000047000009062040603080890500000260000108007010600951064200"
  @solution = Sudoku::Board.new @puzzle.stream
end

When /^I request a cell$/ do
  @request1 = @solution.get [2,0]
end

Then /^I am given the value at that cell$/ do
  @request1.should eq(9)
end


When /^I pick a number$/ do
  @cell = [0,0]
  @decision = 1
end

When /^That number is not one from the original puzzle$/ do
  if @solution.get(@cell) == @puzzle.get(@cell)
    if @puzzle.get(@cell) == 0
      @solution.set(@cell,@decision)
    end
  end
end

Then /^I then set the value at that cell$/ do
  @solution.get(@cell).should eq(@decision)
end
