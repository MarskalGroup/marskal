require 'test_helper'

include TestHelper  # variables/methods stored here for common testing needs


describe 'Marskal::Utils' do
  #---------------------------------------------------------
  # Define the variables to be used to test in this object
  #---------------------------------------------------------
  before do
    @version_file = 'test/support_files/test_version_grabber_file.md'
  end

  describe 'Tests Class method => grab_version_number' do
      it 'Returns a string' do
        Marskal::Utils.grab_version_number(file: @version_file).must_be_kind_of String
      end

      it 'Called w/defaults returns a version candidate' do
        l_version = Marskal::Utils.grab_version_number
        version_number_candidate?(l_version).must_equal false
      end

      it 'Returns the expected version' do
        Marskal::Utils.grab_version_number(file: @version_file).must_equal '0.6.4'
      end

      it 'Custom Pattern Returns the expected version' do
        Marskal::Utils.grab_version_number(file: @version_file, pattern: '~VERSION_TEST~').must_equal 'v0.9.7'
      end

      it 'Returns the default not found msg' do
        Marskal.configure do |config|
          config.grab_version_options[:file] = @version_file
          config.grab_version_options[:pattern] = GARBAGE
        end

        Marskal::Utils.grab_version_number.must_equal Marskal.configuration.grab_version_options[:not_found_message]
      end

      it 'Returns the custom not found msg' do
        l_custom_message = '~~NOTFOUN~~'
        Marskal::Utils.grab_version_number(file: @version_file, pattern: GARBAGE, not_found_message: l_custom_message).must_equal l_custom_message
      end

    after do
      Marskal.reset
    end

  end

  private


  ##
  # This test to determine if the string fits the expected format of a version number.
  # its a light weight test, but good enough for now. It simply checks that the version only has integers
  # and allows the letter 'v'
  #
  # ==== History
  # * <tt>Created: 2016-12-14</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
  #
  # ==== Params
  # * <tt>p_version(String):</tt> The string to test as a version number
  #
  # ==== Returns
  # * <tt>(Boolean)</tt> True if it it seems to be legit, false if not
  #
  # ==== Examples
  #  version_number_candidate?("Not a version number")   => false
  #  version_number_candidate?("1.2.3.4")   => true
  #  version_number_candidate?("v1.2.3.4")  => true
  # ---
  def version_number_candidate?(p_version)
    p_version.gsub(/[.v]/i, '').is_integer?
  end



end





