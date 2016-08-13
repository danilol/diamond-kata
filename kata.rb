class Kata
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def run
    if valid_input?
      map_letters = ("A"..input.upcase).to_a
      lines = map_letters.each_with_index.map do |letter, index|
        build_line(letter, index, map_letters.size)
      end
      (lines + lines.reverse[1..-1]).join "\n"
    else
      "your input is invalid for this kata!"
    end
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

  def valid_input?
    return false unless input.is_a?(String)
    return false unless ("a".."z").include?(input)
    true
  end
end

