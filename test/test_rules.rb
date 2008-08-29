require File.expand_path(File.dirname(__FILE__) + '/helper.rb')

class TestRules < Test::Unit::TestCase
  include Cackle

  context 'with a pretty complicated file' do
    setup do
      data = File.read(File.dirname(__FILE__) + '/sample.acl')
      @filenode = AccessControlLanguageParser.new.parse(data)
    end
    should 'actually be a filenode' do
      assert_kind_of AccessControlLanguage::FileNode, @filenode
    end
    
    should 'turn into a rulelist' do
      assert_kind_of RuleList, RuleList.new(@filenode.selection_array)
    end
  end
end