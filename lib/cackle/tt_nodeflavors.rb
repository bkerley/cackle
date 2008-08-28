class Array
  def that_are(klass)
    select{|e| e.is_a? klass}
  end
  def children
    map{|e|e.elements}.flatten
  end
end
module AccessControlLanguage
  class ACLNode < Treetop::Runtime::SyntaxNode
    def children_that_are(klass)
      elements.select{|e| e.is_a? klass}
    end
    def first_child_that_is(klass)
      elements.detect{|e| e.is_a? klass}
    end
    alias :my_childrens :elements
  end

  class FileNode < ACLNode
    def selections
      return @sel if @sel
      
      @sel = children_that_are SelectionNode
      @sel += capture_subselections
      return @sel
    end
    
    def selection_array
      selections.map{|s| Selection.new(s.selector_text, s.block.to_h)}
    end
    
    def inspect
      selections.map{|s|s.inspect}.join("\n")
    end
    
    private
    def capture_subselections
      @sel.each{|s| s.tag_subselections}
      
      return @sel.map{|s|s.subselections}.flatten
    end
    
  end
  class SelectionNode < ACLNode
    attr_writer :selector_text
    
    def selector_text
      @selector_text ||= selector.text_value
    end
    
    def selector
      first_child_that_is SelectorNode
    end
    
    def block
      first_child_that_is BlockNode
    end
    
    def subselections
      return @subselections if @subselections
      @subselections = direct_subselections
      
      @subselections += direct_subselections.map{|ss| ss.subselections}.flatten
      
      return @subselections
    end
    
    def direct_subselections
      @direct_subselections ||= block.sub_selections
    end
    
    def tag_subselections
      direct_subselections.each do |ss|
        ss.selector_text = self.selector_text + ss.selector_text
        ss.tag_subselections
      end
    end
    
    def inspect
      "#{selector_text} #{block.inspect}"
    end
  end
  class SelectorNode < ACLNode
    def inspect
      text_value
    end
  end
  class BlockNode < ACLNode
    def inspect
      " {\n  " +
      properties.map{|s|s.inspect}.join("\n  ") +
      "\n}\n"
    end
    
    def properties
      my_childrens.children.that_are PropertyNode
    end
    
    def sub_selections
      my_childrens.children.that_are SelectionNode
    end
    
    def to_h
      properties.inject({}) do |memo, p|
        memo.merge p.to_h
      end
    end
  end
  class PropertyNode < ACLNode
    def inspect
      "#{property_name}: #{subjects.map{|s|s.inspect}.join(' ')}"
    end
    
    def property_name
      first_child_that_is(PropertyNameNode).text_value
    end
    
    def subjects
      @subjects ||=
        my_childrens.children.select{|e|!e.extension_modules.empty? rescue false}.children.that_are(SubjectNode)
    end
    
    def to_h
      {property_name => subjects.map{|s|s.text_value}}
    end
  end
  class SubjectNode < ACLNode
    def inspect
      text_value
    end
  end
  class PropertyNameNode < ACLNode
  end
end