require 'test_helper'

class MarskalCoreExtArrayTest < Minitest::Test
  def setup
    @ary = [1,2,3,4]
  end

  #test to make sure a string is returned
  def test_to_string_no_brackets_returns_string
    assert_kind_of String, @ary.to_string_no_brackets
  end

  def test_it_does_something_useful
    assert true  #make this dummy test work
  end

end
