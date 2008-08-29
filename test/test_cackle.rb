require File.expand_path(File.dirname(__FILE__) + '/helper.rb')

class TestParser < Test::Unit::TestCase
  include Cackle
  
  context 'a fresh parser' do
    setup do
      @parser = AccessControlLanguageParser.new
    end
  
    should 'accept a string to parse' do
      assert_not_nil @parser.parse('acl://test {}')
    end
    
    should 'return nil on an unparseable string' do
      ['acl://*dd {}', 'acl:// {', 'acl://serious {xxx}'].each do |str|
        assert_nil @parser.parse(str)
      end
    end
    
    should 'return a FileNode' do
      assert_kind_of AccessControlLanguage::FileNode, @parser.parse('acl://test {}')
    end
  end
end