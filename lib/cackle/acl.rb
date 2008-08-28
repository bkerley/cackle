module AccessControlLanguage
  include Treetop::Runtime

  def root
    @root || :file
  end

  def _nt_file
    start_index = index
    if node_cache[:file].has_key?(index)
      cached = node_cache[:file][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      r2 = _nt_selection
      if r2
        r1 = r2
      else
        r3 = _nt_whitespace
        if r3
          r1 = r3
        else
          self.index = i1
          r1 = nil
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = FileNode.new(input, i0...index, s0)

    node_cache[:file][start_index] = r0

    return r0
  end

  module Selection0
    def selector
      elements[0]
    end

    def block
      elements[2]
    end
  end

  def _nt_selection
    start_index = index
    if node_cache[:selection].has_key?(index)
      cached = node_cache[:selection][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_selector
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_whitespace
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = SyntaxNode.new(input, i2...index, s2)
      end
      s0 << r2
      if r2
        r4 = _nt_block
        s0 << r4
      end
    end
    if s0.last
      r0 = (SelectionNode).new(input, i0...index, s0)
      r0.extend(Selection0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:selection][start_index] = r0

    return r0
  end

  module Block0
  end

  def _nt_block
    start_index = index
    if node_cache[:block].has_key?(index)
      cached = node_cache[:block][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('{', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('{')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3 = index
        r4 = _nt_property
        if r4
          r3 = r4
        else
          r5 = _nt_selection
          if r5
            r3 = r5
          else
            r6 = _nt_whitespace
            if r6
              r3 = r6
            else
              self.index = i3
              r3 = nil
            end
          end
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = SyntaxNode.new(input, i2...index, s2)
      s0 << r2
      if r2
        if input.index('}', index) == index
          r7 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('}')
          r7 = nil
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = (BlockNode).new(input, i0...index, s0)
      r0.extend(Block0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:block][start_index] = r0

    return r0
  end

  module Property0
    def subject
      elements[1]
    end
  end

  module Property1
    def propertyname
      elements[0]
    end

  end

  def _nt_property
    start_index = index
    if node_cache[:property].has_key?(index)
      cached = node_cache[:property][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_propertyname
    s0 << r1
    if r1
      if input.index(':', index) == index
        r2 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r2 = nil
      end
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          i4, s4 = index, []
          s5, i5 = [], index
          loop do
            r6 = _nt_whitespace
            if r6
              s5 << r6
            else
              break
            end
          end
          if s5.empty?
            self.index = i5
            r5 = nil
          else
            r5 = SyntaxNode.new(input, i5...index, s5)
          end
          s4 << r5
          if r5
            r7 = _nt_subject
            s4 << r7
          end
          if s4.last
            r4 = (SyntaxNode).new(input, i4...index, s4)
            r4.extend(Property0)
          else
            self.index = i4
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        r3 = SyntaxNode.new(input, i3...index, s3)
        s0 << r3
        if r3
          s8, i8 = [], index
          loop do
            r9 = _nt_whitespace
            if r9
              s8 << r9
            else
              break
            end
          end
          r8 = SyntaxNode.new(input, i8...index, s8)
          s0 << r8
          if r8
            if input.index(';', index) == index
              r10 = (SyntaxNode).new(input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(';')
              r10 = nil
            end
            s0 << r10
          end
        end
      end
    end
    if s0.last
      r0 = (PropertyNode).new(input, i0...index, s0)
      r0.extend(Property1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:property][start_index] = r0

    return r0
  end

  def _nt_propertyname
    start_index = index
    if node_cache[:propertyname].has_key?(index)
      cached = node_cache[:propertyname][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_alphanum
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = PropertyNameNode.new(input, i0...index, s0)
    end

    node_cache[:propertyname][start_index] = r0

    return r0
  end

  module Subject0
  end

  def _nt_subject
    start_index = index
    if node_cache[:subject].has_key?(index)
      cached = node_cache[:subject][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('%', index) == index
      r2 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('%')
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = SyntaxNode.new(input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        i4 = index
        r5 = _nt_alphanum
        if r5
          r4 = r5
        else
          if input.index(Regexp.new('[-@]'), index) == index
            r6 = (SyntaxNode).new(input, index...(index + 1))
            @index += 1
          else
            r6 = nil
          end
          if r6
            r4 = r6
          else
            self.index = i4
            r4 = nil
          end
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = SyntaxNode.new(input, i3...index, s3)
      end
      s0 << r3
    end
    if s0.last
      r0 = (SubjectNode).new(input, i0...index, s0)
      r0.extend(Subject0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:subject][start_index] = r0

    return r0
  end

  module Selector0
  end

  def _nt_selector
    start_index = index
    if node_cache[:selector].has_key?(index)
      cached = node_cache[:selector][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      i2 = index
      r3 = _nt_alphanum
      if r3
        r2 = r3
      else
        if input.index(Regexp.new('[/:]'), index) == index
          r4 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r4 = nil
        end
        if r4
          r2 = r4
        else
          self.index = i2
          r2 = nil
        end
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      self.index = i1
      r1 = nil
    else
      r1 = SyntaxNode.new(input, i1...index, s1)
    end
    s0 << r1
    if r1
      if input.index('*', index) == index
        r6 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('*')
        r6 = nil
      end
      if r6
        r5 = r6
      else
        r5 = SyntaxNode.new(input, index...index)
      end
      s0 << r5
    end
    if s0.last
      r0 = (SelectorNode).new(input, i0...index, s0)
      r0.extend(Selector0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:selector][start_index] = r0

    return r0
  end

  def _nt_alphanum
    start_index = index
    if node_cache[:alphanum].has_key?(index)
      cached = node_cache[:alphanum][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_alpha
    if r1
      r0 = r1
    else
      r2 = _nt_num
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:alphanum][start_index] = r0

    return r0
  end

  def _nt_alpha
    start_index = index
    if node_cache[:alpha].has_key?(index)
      cached = node_cache[:alpha][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(Regexp.new('[A-Za-z]'), index) == index
      r0 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:alpha][start_index] = r0

    return r0
  end

  def _nt_num
    start_index = index
    if node_cache[:num].has_key?(index)
      cached = node_cache[:num][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(Regexp.new('[0-9]'), index) == index
      r0 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:num][start_index] = r0

    return r0
  end

  def _nt_whitespace
    start_index = index
    if node_cache[:whitespace].has_key?(index)
      cached = node_cache[:whitespace][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(Regexp.new('[ \\t\\n\\r\\v]'), index) == index
      r0 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:whitespace][start_index] = r0

    return r0
  end

end

class AccessControlLanguageParser < Treetop::Runtime::CompiledParser
  include AccessControlLanguage
end
