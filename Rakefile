# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/cackle.rb'

Hoe.new('cackle', Cackle::VERSION) do |p|
  # p.rubyforge_name = 'cacklex' # if different than lowercase project name
  p.developer('Bryce Kerley', 'bryce@worldmedia.net')
end

# vim: syntax=Ruby

file 'lib/cackle/acl.rb' => ['lib/cackle/acl.treetop'] do |t|
	sh "tt #{t.prerequisites.first} -o #{t.name}"
end

task :test => ['lib/cackle/acl.rb']