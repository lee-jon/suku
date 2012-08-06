def messenger
  @messenger ||= StringIO.new
end

Given /^the libraries are loaded$/ do
end

When /^I request a new board$/ do
  @game = Sudoku::Board.new
end

When /^I request a board with a input of cells$/ do
  @game = Sudoku::Board.new("123456789"*9)

end

Then /^a new blank board is generated$/ do
  @game.stream.should include("0"*81)
end

Then /^the board's cells are filled with my input$/ do
  @game.stream.should include("123456789"*9)
end
