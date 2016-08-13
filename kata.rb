class Kata
  attr_reader :input

  def initialize(input)
    @input = input.upcase
  end

  def run
    map_letters = ("A"..input).to_a
    lines = map_letters.each_with_index.map do |letter, index|
      build_line(letter, index, map_letters.size)
    end
    (lines + lines.reverse[1..-1]).join "\n"
  end

  private

  def build_line(letter, index, size)
    space = size - index - 1
    return " " * space + letter if index.zero?
    " " * space + letter + " " * gap(index) + letter
  end

  def gap(index)
    index * 2 - 1
  end
end

