$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'treetop'
require 'cackle/rule_list'
require 'cackle/node_flavors'
require 'cackle/acl_parser'

module Cackle
  VERSION = '1.0.0'
end