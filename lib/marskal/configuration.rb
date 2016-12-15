module Marskal

  # Helpful link http://lizabinante.com/blog/creating-a-configurable-ruby-gem/
  class Configuration
    attr_accessor :grab_version_options

    ##
    # TODO: DOCME TESTME
    def initialize
      @grab_version_options =  { file: 'CHANGELOG.md', pattern: '#### ', not_found_message: 'Unknown Version' }
    end

  end
end