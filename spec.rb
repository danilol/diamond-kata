require_relative "kata"
require "minitest/autorun"
require "minitest/spec"

class KataSpec < Minitest::Spec
  let(:result) { Kata.new(input).run }

  describe "a" do
    let(:input) { "a" }

    it "returns upcase 'a'" do
      assert_equal("A", result)
    end
  end

  describe "b" do
    let(:input) { "b" }

    it "returns 'ab' diamond" do
      expected_output = " A\nB B\n A"

      assert_equal(expected_output, result)
    end
  end

  describe "c" do
    let(:input) { "c" }

    it "returns 'abc' diamond" do
      expected_output = "  A\n B B\nC   C\n B B\n  A"

      assert_equal(expected_output, result)
    end
  end

  describe "d" do
    let(:input) { "d" }

    it "returns 'abcd' diamond" do
      expected_output = "   A\n  B B\n C   C\nD     D\n C   C\n  B B\n   A"

      assert_equal(expected_output, result)
    end
  end
end
