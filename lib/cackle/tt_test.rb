require 'rubygems'
require 'treetop'
require 'yaml'
require 'tt_rulelist.rb'
require 'tt_nodeflavors.rb'
require 'acl.rb'

parser = AccessControlLanguageParser.new
data = File.read('sample.acl')
result = parser.parse(data)

if result.nil?
  puts 'lose'
  exit(-1)
end


rules = RuleList.new(result.selection_array)
puts rules.to_a.map{|r|r.inspect}.join("\n")