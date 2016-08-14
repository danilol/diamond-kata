require_relative "kata"
require "minitest/autorun"
require "minitest/spec"

class KataSpec < Minitest::Spec
  let(:result) { Kata::Diamond.new(input).print}

  describe "#build_diamond" do
    describe "invalid input" do
      it "returns a message" do
        invalid_message = "invalid input"

        assert_equal(invalid_message, Kata::Diamond.new(123).print)
        assert_equal(invalid_message, Kata::Diamond.new("123").print)
        assert_equal(invalid_message, Kata::Diamond.new(false).print)
        assert_equal(invalid_message, Kata::Diamond.new("!!!").print)
        assert_equal(invalid_message, Kata::Diamond.new("Ç€^><ßÄ").print)
      end
    end

    describe  "a" do
      let(:input) { "a" }

      it "returns 'A'" do
        assert_equal("A", result)
      end
    end

    describe "b" do
      let(:input) { "b" }

      it "returns 'AB' diamond" do
        expected_output = " A \nB B\n A "

        assert_equal(expected_output, result)
      end
    end

    describe "c" do
      let(:input) { "c" }

      it "returns 'ABC' diamond" do
        expected_output = "  A  \n B B \nC   C\n B B \n  A  "

        assert_equal(expected_output, result)
      end
    end

    describe "d" do
      let(:input) { "d" }

      it "returns 'ABCD' diamond" do
        expected_output = "   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   "

        assert_equal(expected_output, result)
      end
    end

    describe "D" do
      let(:input) { "D" }

      it "returns 'ABCD' diamond" do
        expected_output = "   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   "

        assert_equal(expected_output, result)
      end
    end
  end
end
