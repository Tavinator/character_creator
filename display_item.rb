class DisplayItem
  def initialize(type, plural_type, short_description, long_description)
    @type = type
    @plural_type = plural_type
    @short_description = short_description
    @long_description = long_description
  end

  def type
    "#{@type}"
  end

  def plural_type
    "#{@plural_type}"
  end

  def short_selection
    "'#{@type}' : #{@short_description}"
  end

  def short_description
    "#{@short_description}"
  end

  def long_description
    "#{@long_description}"
  end
end
