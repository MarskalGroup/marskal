require 'test_helper'

describe 'Marskal' do
  #---------------------------------------------------------
  # Define the variables to be used to test in this object
  #---------------------------------------------------------
  before do
    @version_file = 'test/support_files/test_version_grabber_file.md'
  end

  describe 'Test module Marskal' do

    it 'Has a version_number' do
      Marskal::VERSION.wont_be_nil
    end

  end

  describe 'Test module Marskal::Configuration' do

    it 'Resets properly' do
      skip 'test the configuration build and reset options'
    end

  end


end