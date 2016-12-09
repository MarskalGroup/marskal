require 'test_helper'

class TestArray <  Minitest::Test
  def test_array_can_be_created_with_no_arguments
    assert_instance_of Array, Array.new
  end

  def test_array_of_specific_length_can_be_created
    assert_equal 10, Array.new(10).size
  end

  def test_fail_for_sure
    assert false
  end
end


describe Array do
  it "can be created with no arguments" do
    Array.new.must_be_instance_of Array
  end

  it "can be created with a specific size" do
    Array.new(10).size.must_equal 10
  end

  it "must fail for sure" do
    assert false
  end
end





