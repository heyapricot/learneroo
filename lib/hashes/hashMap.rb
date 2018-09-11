class HashMap
  attr_reader :keys

  def initialize()
    @keys = Array.new
  end

  def store(key)
    map = key.abs % 11
    @keys[map].nil? ? @keys[map] = [key] : @keys[map] << key
  end

end