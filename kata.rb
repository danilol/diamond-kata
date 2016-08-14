class Kata
  class Diamond
    attr_reader :input, :output

    SEPARATOR = " "
    BASE_A    = "A".ord

    def initialize(input)
      @input  = input
      @output = valid_input? ? build_diamond : []
    end

    def print
      return "invalid input" if output.empty?
      Canvas.new(x: output, y: output.reverse[1..-1]).print
    end

    private

    def build_diamond
      diamond_chars.each.map { |letter| build_line(letter) }
    end

    def build_line(letter)
      index = letter.ord - BASE_A
      space = size - index

      return build_filler(space) + letter + build_filler(space) if first_letter?(letter)

      build_filler(space) + letter + build_gap(index) + letter + build_filler(space)
    end

    def first_letter?(letter)
      (letter.ord - BASE_A).zero?
    end

    def gap(index)
      index * 2 - 1
    end

    def size
      input.ord - BASE_A
    end

    def build_filler(space)
      SEPARATOR * space
    end

    def build_gap(index)
      SEPARATOR * gap(index)
    end

    def valid_input?
      return false unless input
      return false unless input.is_a?(String)
      @input = input.upcase
      return false unless valid_letter?
      true
    end
    def valid_letter?
      ("A".."Z").include?(input)
    end

    def diamond_chars
      @diamond_chars ||= ("A"..input).to_a
    end

    class Canvas
      def initialize(x:, y:)
        @x, @y = x, y
      end

      def print
        return "" if !@x.is_a?(Array) or !@y.is_a?(Array)
        (@x + @y).join "\n"
      end
    end
  end
end

