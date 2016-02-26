class Puzzle < Board
  def initialize
    super

    @values = blank_grid
  end

  def parse_grid(grid)
    grid_value(grid).each do |square, digit|
      assign(square, digit) if digits.include? digit
    end
  end

  def assign(square, digit)
    other_values(digit).each_char do |value|
      eliminate(square, value)
    end
  end

  def eliminate(square, value)
    return false unless @values[square].include? value
    return false if @values[square].empty?

    @values[square] = @values[square].gsub(value, "")

    if @values[square].length == 1
      value2 = @values[square]
      peers[square].each do |peer_square|
        eliminate(peer_square, value2)
      end
    end

    units[square].each do |unit|
      dplaces = unit.select { |s| @values[s].include? value }

      assign(dplaces[0], value) if dplaces.length == 1
    end
  end

  private

  def other_values(digit)
    digits.gsub(digit, "")
  end

  def grid_value(grid)
    raise ArgumentError if grid.length != 81

    squares.zip(grid.each_char)
  end

  def blank_grid
    squares.each_with_object({}) do |square, values|
      values[square] = digits
    end
  end
end
