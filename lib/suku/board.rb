class Board
  attr_reader :rows, :digits, :columns, :squares,
              :unit_list, :units, :peers

  def initialize
    @rows      = "ABCDEFGHI"
    @digits    = "123456789"
    @columns   = @digits
    @squares   = cross(@rows, @columns)
    @unit_list = create_unit_list
    @units     = create_units
    @peers     = create_peers
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
    ["ABC", "DEF", "GHI"].product(["123", "456", "789"]).map do |i|
      cross(i[0], i[1])
    end
  end

  def create_units
    squares.reduce({}) do |units, key|
      units[key] = unit_list.reduce([]) do |value, list|
        value << list if list.include? key
        value
      end
      units
    end
  end

  def create_peers
    squares.reduce({}) do |peers, key|
      peers.merge( { key => (units[key].flatten.uniq - [key]) } )
    end
  end

  def cross(a,b)
    a.split("").product(b.split("")).map { |i| i[0] + i[1] }
  end
end
