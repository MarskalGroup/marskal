require 'test_helper'

##
# This class defines all the tests all the extensions to Ruby's +Array+ class as
# defined in this gem.
# ==== History
# * <tt>Created: [2016-12-09]</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
#
# ==== Testing Framework
# * <b>Minitest[https://rubygems.org/gems/minitest]</b>
#
class MarskalCoreExtArrayTest < Minitest::Test
  GOT = 0
  EXPECTED = 1

  #---------------------------------------------------------
  # Define the variables to be used to test in this object
  #---------------------------------------------------------
  def setup
    puts "here I am"
    @ary = ['hello','bye','yo','whats up']
    @results = {
        no_brackets: [@ary.to_string_no_brackets, "'hello','bye','yo','whats up'"],
        no_brackets_or_quotes: [@ary.to_string_no_brackets_or_quotes, '"hello","bye","yo"","whats up"'],
        prepare_for_sql_in_clause: [@ary.prepare_for_sql_in_clause, 'xxxxx']
    }
    # @nxo_brackets = @ary.to_string_no_brackets
    # @nxo_brackets_or_quotes = @ary.to_string_no_brackets_or_quotes
    # @pxrepare_for_sql_in_clause = @ary.prepare_for_sql_in_clause
  end

  #---------------------------------------------------------
  # Tests for method: to_string_no_brackets
  #---------------------------------------------------------
  begin
    def test_to_string_no_brackets_returns_string
      assert_kind_of String, @results[:no_brackets][GOT]
    end

    def test_to_string_no_brackets_returns_without_brackets
      assert_no_brackets(@results[:no_brackets][GOT])
    end

    def test_to_string_no_brackets_returns_proper_length
      assert @results[:no_brackets][GOT].length == (@ary.to_s.length - 2), "Result[Len: #{@results[:no_brackets][GOT].length}] should be 2 characters less than original array to string[Len: #{@ary.to_s.length}]"
    end
  end

  #---------------------------------------------------------
  # Tests for method: to_string_no_brackets_or_quotes
  #---------------------------------------------------------
  begin
    def test_to_string_no_brackets_or_quotes_returns_string
      assert_kind_of String, @results[:no_brackets_or_quotes][GOT]
    end

    def test_to_string_no_brackets_or_quotes_without_brackets
      assert_no_brackets(@results[:no_brackets_or_quotes][GOT])
    end

    def test_to_string_no_brackets_or_quotes_returns_proper_length
      l_expected_length = @ary.to_s.length - (@ary.to_s.count('"') + 2) #count quotes and brackets that will be erased in this example
      assert_equal l_expected_length,  @results[:no_brackets_or_quotes][GOT].length
    end
  end

  #---------------------------------------------------------
  # Tests for method: prepare_for_sql_in_clause
  #---------------------------------------------------------
  begin
    def test_prepare_for_sql_in_clause_returns_string
      assert_kind_of String, @results[:prepare_for_sql_in_clause][GOT]
    end

    def test_prepare_for_sql_in_clause_returns_parenthesis
      assert_equal "#{@results[:prepare_for_sql_in_clause][GOT][0..1]}#{@results[:prepare_for_sql_in_clause][GOT][-2..-1]}", '("")', "Expected parenthesis around result, but result was:  ==> #{@results[:prepare_for_sql_in_clause][GOT]}"
    end

    def test_prepare_for_sql_in_clause_returns_proper_number_elements
      assert_equal @results[:prepare_for_sql_in_clause][GOT].split(',').length,  @ary.length
    end
  end

  private

  ##
  # Tests to ensure a string does not have *"["* in from or a *"]"* at the end of the string
  #
  # ==== History
  # * <tt>Created: [2015-10-06]</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
  #
  # ==== Params
  # * <tt>p_str(String):</tt> The string to be tested <br>
  #
  # ==== Returns
  # * If Successful: <tt>(TrueClass)</tt> true
  # * If Failed: Raises assertion error to be handled by the test framework
  #
  # ==== Examples
  #   assert_no_brackets("[1,2,3]")  ==> An error will be raised
  #   assert_no_brackets("1,2,3")    ==> Return True
  #
   def assert_no_brackets(p_str)
      assert (p_str[0] != '[' && p_str[-1] != ']'), "Expected no front or end brackets, but result was:  ==> #{p_str}"
   end

  def assert_got_what_expected(p_value_array)
    assert_equal p_value_array[GOT],  p_value_array[EXPECTED]
  end



end





