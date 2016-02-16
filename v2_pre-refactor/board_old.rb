module Sudoku
  class Board
    attr_reader :grid

    def initialize(input = nil)
      @grid = case input
              when NilClass
                generate_blank_board

              when String
                raise ArgumentError if invalid_string?(input)

                generate_board(input)

              else
                raise ArgumentError
      end
    end

    private

    def generate_blank_board
      Array.new(9).map { |_i| [0, 0, 0, 0, 0, 0, 0, 0, 0] }
    end

    def generate_board(input)
      input = input.split("")

      input.map!(&:to_i)

      Array.new(9).map do |_i|
        Array.new(9).map do |_i|
          input.shift
        end
      end
    end

    def invalid_string?(input)
      input.size != 81
    end
  end
end
