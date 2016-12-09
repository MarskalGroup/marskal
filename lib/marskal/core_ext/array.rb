##
# Array. Extends functionality to Ruby's +Array+ class
#
# ==== History
# * <tt>Created: 2013-ish</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
#
class Array

  ##
  # Tests to ensure a string does not have *"["* in from or a *"]"* at the end of the string
  #
  # ==== History
  # * <tt>Created: 2013-ish</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
  #
  # ==== Returns
  # <tt>(String)</tt> The Array as a string without brackets
  #
  # ==== Examples
  #   [1,2,3].to_string_no_brackets                 ==> #returns '1,2,3'
  #   ['one','two','three'].to_string_no_brackets   ==> #returns "\"one\", \"two\", \"three\""
  #
  def to_string_no_brackets
    self.to_s.gsub(/[\[\]]/,'')
  end


  # example:  <br>
  # [1,2,3].to_string_no_brackets  ==> #returns "1,2,3"
  def to_string_no_brackets_or_quotes
    self.to_s.gsub(/[\"\[\]]/,'')
  end

  # prepares an array for an mysql based in clause.
  # examnple:
  # [1,2,3,4].prepare_for_sql_in_clause returns "(1, 2, 3, 4)"
  def prepare_for_sql_in_clause
    "(#{self.to_string_no_brackets})"
  end

  # this formats json data for us in the high-charts javascript library functions
  # example:
  # [1,2,3,4,"1", "rr"].json_data_for_highcharts ==> "[1,2,3,4,1,rr]"
  def json_data_for_highcharts
    # self.to_json.gsub(/[\'\"]/,'')   #maybe add this as a parameter to include or exclude single quotes
    self.to_json.gsub(/[\"]/,'')       # but for now, we will allow single quotes a strings are allowed in json
  end

  # This method puts an IFNULL around each array element for use in mysql Select statment.
  # The value will be given as empty string if the field is null
  # Example:
  # ['fld1', 'fld2', 'fld3'].sql_null_to_blank ==> ["IFNULL(fld1, '')", "IFNULL(fld2, '')", "IFNULL(fld3, '')"]
  def sql_null_to_blank
    self.map {|v| "IFNULL(#{v}, '')" }
  end


end