class Kata
  attr_reader :input

  SEPARATOR = " "
  BASE      = "A"

  def initialize(input)
    @input = input
  end

  def run
    return "your input is invalid for this kata!" unless valid_input?

    lines = diamond_chars.each_with_index.map do |letter, index|
      build_line(letter, index)
    end

    (lines + lines.reverse[1..-1]).join "\n"
  end

  private

  def build_line(letter, index)
    space = size - index
    return SEPARATOR * space + letter + SEPARATOR * space if first_char?(letter)
    SEPARATOR * space + letter + SEPARATOR * gap(index) + letter + SEPARATOR * space
  end

  def first_char?(letter)
    (letter.ord - BASE.ord).zero?
  end

  def gap(index)
    index * 2 - 1
  end

  def size
    input.upcase.ord - BASE.ord
  end

  def valid_input?
    return false unless input.is_a?(String)
    return false unless ("a".."z").include?(input)
    true
  end

  def diamond_chars
    @diamond_chars ||= ("A"..input.upcase).to_a
  end
end

