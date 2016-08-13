class Kata
  attr_reader :input

  SEPARATOR = " "
  BASE      = "A"

  def initialize(input)
    @input = input
  end

  def run
    return   "your input is invalid for this kata!" unless valid_input?

    lines = diamond_chars.each_with_index.map do |letter, index|
      build_line(letter, index, diamond_chars.size)
    end

    (lines + lines.reverse[1..-1]).join "\n"
  end

  private

  def build_line(letter, index, size)
    space = size - index - 1
    return SEPARATOR * space + letter if index.zero?
    SEPARATOR * space + letter + SEPARATOR * gap(index) + letter
  end

  def gap(index)
    index * 2 - 1
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

