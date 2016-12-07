class Hash

  # raises an argument error if the given Hash is missing a required key
  def assert_require_keys(*p_valid_keys)
    l_missing_keys = []
    p_valid_keys.flatten!
    p_valid_keys.each do |k|
      l_missing_keys << k  unless self.has_key?(k)
    end

    unless l_missing_keys.empty?
      raise ArgumentError.new("Missing required key(s): #{l_missing_keys.map(&:inspect).join(', ')}")
    end

  end


end