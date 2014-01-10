module Sudoku
  class Puzzle < Board

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
  
  end
end