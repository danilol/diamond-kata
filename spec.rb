require_relative "kata"
require "minitest/autorun"
require "minitest/spec"

class KataSpec < Minitest::Spec
  let(:result) { Kata.new(input).run }

  describe "#run" do
    describe "invalid input" do
      it "returns a message" do
        invalid_message = "your input is invalid for this kata!"

        assert_equal(invalid_message, Kata.new(123).run)
        assert_equal(invalid_message, Kata.new("123").run)
        assert_equal(invalid_message, Kata.new(false).run)
        assert_equal(invalid_message, Kata.new("!!!").run)
        assert_equal(invalid_message, Kata.new("Ç€^><ßÄ").run)
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
        expected_output = " A\nB B\n A"

        assert_equal(expected_output, result)
      end
    end

    describe "c" do
      let(:input) { "c" }

      it "returns 'ABC' diamond" do
        expected_output = "  A\n B B\nC   C\n B B\n  A"

        assert_equal(expected_output, result)
      end
    end

    describe "d" do
      let(:input) { "d" }

      it "returns 'ABCD' diamond" do
        expected_output = "   A\n  B B\n C   C\nD     D\n C   C\n  B B\n   A"

        assert_equal(expected_output, result)
      end
    end
  end
end
