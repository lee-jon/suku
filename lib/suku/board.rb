class Board
  attr_reader :rows, :digits, :columns,
              :unit_list, :units, :peers,
              :squares, :grid, :values

  def initialize
    @rows      = "ABCDEFGHI"
    @digits    = "123456789"
    @columns   = @digits
    @squares   = cross(@rows, @columns)
    @unit_list = create_unit_list
    @units     = create_units
    @peers     = create_peers
    @values    = {}
  end

  protected

  def create_unit_list
    column_units + row_units + box_units
  end

  def column_units
    columns.split("").map { |c| cross(rows, c) }
  end

  def row_units
    rows.split("").map { |r| cross(r, columns) }
  end

  def box_units
    %w(ABC DEF GHI).product(%w(123 456 789)).map do |i|
      cross(i[0], i[1])
    end
  end

  def create_units
    squares.each_with_object({}) do |key, units|
      units[key] = unit_list_select(key)
    end
  end

  def unit_list_select(key)
    unit_list.each_with_object([]) do |list, value|
      value << list if list.include? key
    end
  end

  def create_peers
    squares.reduce({}) do |peers, key|
      peers.merge(key => (units[key].flatten.uniq - [key]))
    end
  end

  def cross(a, b)
    a.split("").product(b.split("")).map { |i| i[0] + i[1] }
  end
end
