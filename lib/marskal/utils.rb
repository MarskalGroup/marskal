module Marskal



  ##
  # This module contains various handy methods to be used by any application or gem the includes it
  #
  # ==== History
  # * <tt>Created: 2016-12-14</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
  #
  module Utils

    ##
    # This private method simply pulls the current configuration from the parent module
    #
    # ==== History
    # * <tt>Created: 2016-12-11</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
    #
    # ==== Returns
    # * <tt>(Hash)</tt> The current configuration
    #
    # ==== Examples
    # latest_config = config
    #
    private_class_method def self.config
          Marskal.configuration
    end


    ##
    # This method will pull a version number from the CHANGELOG.md file by default.
    # It expects a particular patter as well. The defaults are stored in
    # [Marskal::Configuration](lib/marskal/configuration.rb).
    #
    # ==== Configuration
    # * The default config values can be overridden. See documentation on Marskal & Marskal::Configuration modules for the most upto date examples.
    # * They can also be overridden simply by passing them to this method. See examples below.
    #
    # ==== History
    # * <tt>Created: 2016-12-11</tt> <b>Mike Urban</b> <mike@marskalgroup.com>
    #
    # ==== Params
    # * <tt>p_options(Hash)(_defaults_ to: Marskal.configuration ):</tt> The options to use to process as desired
    #   * <tt>:file(String)(_defaults_ to: 'CHANGELOG.md' ):</tt> File where the version history is stored
    #   * <tt>:pattern(String)(_defaults_ to: '#### '):</tt> The first time this pattern is encountered, it assumes the version number is follwing the pattern and space.
    #   * <tt>:not_found_message(String)(_defaults_ to: Version Unknown'):</tt> The message to be returned if the version number pattern is not found.
    #
    # ==== Returns
    # * <tt>(String)</tt> The version number or a not found message
    #
    # ==== Examples
    #   #Note: The results of these examples are from actual testing with this current version of source
    #   # when it was written 2016-12-14
    #
    #   Marskal::Utils.grab_version_number        #=> "0.1.5.wip"
    #
    #   @version_file = 'test/support_files/test_version_grabber_file.md'   #file used for testing
    #
    #   Marskal::Utils.grab_version_number(file: @version_file)             #=> "0.6.4"
    #
    #   #custom patter used to define version number location
    #   Marskal::Utils.grab_version_number(file: @version_file, pattern: '~VERSION_TEST~')  #=> v0.9.7
    #
    #   #Invalid Pattern with default Message
    #   Marskal::Utils.grab_version_number(pattern: 'BAD PATTERN')          #=> "Unknown Version"
    #
    #
    #   #Invalid Pattern with custom Message
    #   Marskal::Utils.grab_version_number(pattern: 'BAD PATTERN', not_found_message: 'NOT FOUND!') #=> "NOT FOUND!"
    #
    # ---
    def self.grab_version_number(p_options = nil)
      p_options = config.grab_version_options.merge(p_options||{})      #grab the current configuration

      l_version_number = ''                                             #initialize variable
      File.open(p_options[:file], 'r').each_line do |line|              #open file and begin to read through the lines
        if line.start_with?(p_options[:pattern])                        #search for pattern
          l_line_parts = line.split(' ').reject { |v| v.blank?}         #split the line by spaces
          l_version_number = l_line_parts.empty? ? '' : l_line_parts[1] #the first item after the sapce is assumed to be the version number
        end
        break unless l_version_number.blank?                            #once we have the version number we can exit the loop
      end
      l_version_number.blank? ? p_options[:not_found_message] : l_version_number
    end

  end
end

