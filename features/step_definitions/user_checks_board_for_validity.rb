Given /^a valid puzzle is active$/ do
  valid_game = "009730526005020800608000047000009062040603080890500000260000108007010600951064200"
  @puzzle = Sudoku::Board.new valid_game
end

When /^I enter (\d+) in the cell at \[(\d+),(\d+)\]$/ do |value, x, y|
  @puzzle.set [x.to_i,y.to_i], value.to_i
end

Then /^the validity response should be true$/ do
  @puzzle.should be_valid
end

Then /^the validity response should be false$/ do
  @puzzle.should_not be_valid
end
