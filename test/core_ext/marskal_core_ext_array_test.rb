require 'test_helper'

##
# == Test All core methods
#

##
# ==Array
class MarskalCoreExtArrayTest < Minitest::Test

  def setup
    @ary = ['hello','bye','yo','whats up']
    @no_brackets = @ary.to_string_no_brackets
    @no_brackets_or_quotes = @ary.to_string_no_brackets_or_quotes
    @prepare_for_sql_in_clause = @ary.prepare_for_sql_in_clause
  end

  ##
  # == Tests for method to_string_no_brackets
  begin
    def test_to_string_no_brackets_returns_string
      assert_kind_of String, @no_brackets
    end

    def test_to_string_no_brackets_returns_without_brackets
      assert_no_brackets(@no_brackets)
    end

    def test_to_string_no_brackets_returns_proper_length
      assert @no_brackets.length == (@ary.to_s.length - 2), "Result[Len: #{@no_brackets.length}] should be 2 characters less than original array to string[Len: #{@ary.to_s.length}]"
    end
  end

  ##
  # == Tests for method to_string_no_brackets_or_quotes
  begin
    def test_to_string_no_brackets_or_quotes_returns_string
      assert_kind_of String, @no_brackets_or_quotes
    end

    def test_to_string_no_brackets_or_quotes_without_brackets
      assert_no_brackets(@no_brackets_or_quotes)
    end

    def test_to_string_no_brackets_or_quotes_returns_proper_length
      l_expected_length = @ary.to_s.length - (@ary.to_s.count('"') + 2) #count quotes and brackets that will be erased in this example
      assert_equal l_expected_length,  @no_brackets_or_quotes.length
    end
  end

  ##
  # == Tests for method prepare_for_sql_in_clause
  begin
    def test_prepare_for_sql_in_clause_returns_string
      assert_kind_of String, @prepare_for_sql_in_clause
    end

    def test_prepare_for_sql_in_clause_returns_parenthesis
      assert_equal "#{@prepare_for_sql_in_clause[0..1]}#{@prepare_for_sql_in_clause[-2..-1]}", '("")', "Expected parenthesis around result, but result was:  ==> #{@prepare_for_sql_in_clause}"
    end

    def test_prepare_for_sql_in_clause_returns_proper_number_elements
      assert_equal @prepare_for_sql_in_clause.split(',').length,  @ary.length
    end
  end

  private

    def assert_no_brackets(p_str)
      assert (p_str[0] != '[' && p_str[-1] != ']'), "Expected no front or end brackets, but result was:  ==> #{p_str}"
    end


end


