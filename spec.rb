require_relative "kata"
require "minitest/autorun"
require "minitest/spec"

class Kata::DiamondSpec < Minitest::Spec
  describe "#print" do
    describe "with invalid input" do
      let(:invalid_message) { "invalid input" }

      it "returns a message" do
        assert_equal(invalid_message, Kata::Diamond.new(nil).print)
        assert_equal(invalid_message, Kata::Diamond.new("").print)
        assert_equal(invalid_message, Kata::Diamond.new(123).print)
        assert_equal(invalid_message, Kata::Diamond.new("123").print)
        assert_equal(invalid_message, Kata::Diamond.new(false).print)
        assert_equal(invalid_message, Kata::Diamond.new("!!!").print)
        assert_equal(invalid_message, Kata::Diamond.new("Ç€^><ßÄ").print)
      end
    end

    describe "with valid input" do
      it "returns a message" do
        assert_equal(Kata::Diamond.new("a").print, "A")
        assert_equal(Kata::Diamond.new("b").print, " A \nB B\n A ")
        assert_equal(Kata::Diamond.new("c").print, "  A  \n B B \nC   C\n B B \n  A  ")
        assert_equal(Kata::Diamond.new("d").print, "   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   ")
        assert_equal(Kata::Diamond.new("D").print, "   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   ")
      end
    end
  end
end

class Kata::CanvasSpec < Minitest::Spec
  describe "#print" do
    it "prints the message" do
      assert_equal("", Kata::Diamond::Canvas.new(x: nil, y: nil).print)
      assert_equal("", Kata::Diamond::Canvas.new(x: "a", y: nil).print)
      assert_equal("", Kata::Diamond::Canvas.new(x: "a", y: "a").print)
    end
  end
end
