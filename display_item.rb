class DisplayItem
  def initialize(type, plural_type, short_description, long_description, sub_step)
    @type = type
    @plural_type = plural_type
    @short_description = short_description
    @long_description = long_description
    @sub_step = sub_step
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

  def sub_step
    "#{@sub_step}"
  end

  def self.full_description(display_items)
    val = {}
    display_items.each do | di |
      val[di.type] = di.long_description
    end
    return val
  end

  def self.select_next(display_items)
    val = {}
    display_items.each do | di |
      val[di.type] = di.sub_step
    end
    return val
  end
end
