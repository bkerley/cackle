class RuleList
  def initialize(selection_array)
    @selections = selection_array.sort.reverse
    reorder_splats
    compile_regexes
  end
  
  def to_a
    @selections
  end
  
  def selections_for(url)
    @selections.select{|s| url =~ s.selector}
  end
  
  private
  def compile_regexes
    @selections.each{|s|s.compile_regex}
  end
  
  def reorder_splats
    yes_splat = splats
    no_splat = @selections - yes_splat
    @selections = yes_splat.reverse + no_splat
  end
  
  def splats
    @selections.select{|s|s.selector =~ /\*$/}
  end
end

class Selection
  attr_accessor :selector
  attr_accessor :properties
  
  def initialize(sel, prop)
    self.selector = sel
    self.properties = prop
  end
  
  def inspect
    "<Selection #{selector} #{properties.inspect} >"
  end
  
  def <=>(other)
    self.selector.length <=> other.selector.length
  end
  
  def compile_regex
    self.selector = Regexp.new(Regexp.escape(self.selector).gsub('\\*','.*'))
  end
end