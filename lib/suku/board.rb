module Sudoku
  class Board

    def initialize(input=nil)

      if input.nil?
        self.generate_blank
        
      elsif input.class == String
        raise ArgumentError.new("Invalid number of characters in String input") unless input.length == 81
        @grid = Array.new(9)
        x = []; input.each_char { |char| x << char.to_i }
        (0..8).each do |row|
          temp_row = []
          (0..8).each do |col|
            temp_row[col] = x.shift
          end
          @grid[row] = temp_row
        end
      elsif input.class == Array
        raise ArgumentError.new("Incorrect array size") unless input.size == 9
        @grid = input
      else
        raise ArgumentError.new("Invalid input")
      end
    end
    
    def generate
      generate_blank
    end
    
    def generate_blank
      @grid = Array.new
      (0..8).each do |i|
        @grid[i] = [0,0,0,0,0,0,0,0,0]
      end
    end
    
    #Getting elements from a board
    def get coords
      @grid[coords[1]][coords[0]]
    end

    def set (coords, value)
      @grid[coords[1]][coords[0]] = value
    end

    def row(index)
      @grid[index]
    end

    def column(index)
      column = []
      (0..8).each do |i|
         column << @grid[i][index]
      end
      return column
    end

    def box(index)
      if index.class == Fixnum
        return boxes[index]
      elsif index.class == Array
        x = index[0]
        y = index[1]
        if x < 3
          calculated = 0
        elsif x < 6
          calculated = 1
        else
          calculated = 2
        end
        if y < 3
          calculated += 0
        elsif y < 6
          calculated += 3
        else
          calculated += 6
        end
        return boxes[calculated]
      end
    end

    # Methods which help Solve a board -- can put in another class later on to simplify board class.
    def blanks
      array_of_blank_cells = []
      (0..8).each do |r|
        (0..8).each do |c|
          number = get [r,c]
          if number == 0
            array_of_blank_cells << [c,r]
          end
        end
      end
      return array_of_blank_cells
    end

    def allowed
      allowed = Array.new
      (0..8).each do |r|
        allowed[r] = [0,0,0,0,0,0,0,0,0]
        (0..8).each do |c|
          if get([c,r]) != 0
            allowed[r][c] = 0
          else
            startstring = "123456789"
            x = Array.new
            x << row(r)
            x << column(c)
            x << box([c,r])
            x = x.flatten.uniq
            x.each { |i| startstring.sub!(i.to_s, '') }
            allowed[r][c] = startstring
          end
        end
      end
      return allowed
    end

    def stream
      @grid.join
    end

    def show
      response = ""
      (0..8).each do |i|
        response += "#{@grid[i][0]} #{@grid[i][1]} #{@grid[i][2]} | #{@grid[i][3]} #{@grid[i][4]} #{@grid[i][5]} | #{@grid[i][6]} #{@grid[i][7]} #{@grid[i][8]}\n".gsub("0", ".")
        if i == 2 || i == 5
          response += "------+-------+------\n"
        end
      end

      return response
    end

    def valid?
      if violations.empty?
        return true
      else
        return false
      end
    end

    def violations
      error_log = []
      (0..8).each do |r|
        test = self.row(r).inject(Hash.new(0)) { |h, i| h[i] += 1; h }
        test[0] = 1
        test.each_key do |key|
          if test[key] != 1
            error_log << "In row #{r}, #{key} appears #{test[key]}"
          end
        end
      end

      (0..8).each do |c|
        test = self.column(c).inject(Hash.new(0)) { |h, i| h[i] += 1; h }
        test[0] = 1
        test.each_key do |key|
          if test[key] != 1
            error_log << "In column #{c}, #{key} appears #{test[key]}"
          end
        end
      end

      (0..8).each do |l|
        test = self.box(l).inject(Hash.new(0)) { |h, i| h[i] += 1; h }
        test[0] = 1
        test.each_key do |key|
          if test[key] != 1
            error_log << "In cell #{l}, #{key} appears #{test[key]}"
          end
        end
      end

      return error_log
    end


    private

    def boxes
      corner = [0,3,6]
      cell_view = []
      cell_index = 0

      corner.each do |r|
        corner.each do |c|
          cell_view[cell_index] = [@grid[r][c],@grid[r][c+1],@grid[r][c+2],@grid[r+1][c],@grid[r+1][c+1],@grid[r+1][c+2],@grid[r+2][c],@grid[r+2][c+1],@grid[r+2][c+2] ]
          cell_index += 1
        end
      end
      return cell_view
    end


  end
end
