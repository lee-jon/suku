class Printer
  def self.parse(p)
    values = p.squares.map { |s| p.values[s] }

    max_width = values.map(&:length).max + 1
    line = ([("-" * max_width * 3)] * 3).join("+") + "\n"

    response = ""
    (0..8).each do |row|
      (0..8).each do |col|
        value = values.shift
        response += value.center(max_width)
        response += "|" if col == 2 || col == 5
      end
      response += "\n"
      response += line if row == 2 || row == 5
    end

    response
  end
end
