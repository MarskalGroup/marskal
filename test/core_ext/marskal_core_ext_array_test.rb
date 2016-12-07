require 'test_helper'

##
# == Test All core methods
#

##
# ==Array
class MarskalCoreExtArrayTest < Minitest::Test

  def setup
    @ary = [1,2,3,4]
    @no_brackets = @ary.to_string_no_brackets
  end

  def test_to_string_no_brackets_returns_string
    assert_kind_of String, @no_brackets
  end

  def test_to_string_no_brackets_returns_without_brackets
    assert (@no_brackets[0] != '[' && @no_brackets[-1] != ']'), "Expected no front or end brackets, but result was: #{@no_brackets}"
  end

  def test_to_string_no_brackets_returns_proper_length
    assert @no_brackets.length == (@ary.to_s.length - 2), "Result[Len: #{@no_brackets.length}] should be 2 characters less than original array to string[Len: #{@ary.to_s.length}]"
  end

end


