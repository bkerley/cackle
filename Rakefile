# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/cackle.rb'

h = Hoe.new('cackle', Cackle::VERSION) do |p|
  # p.rubyforge_name = 'cacklex' # if different than lowercase project name
  p.developer('Bryce Kerley', 'bryce@worldmedia.net')
	p.extra_deps = ['treetop']
end

# vim: syntax=Ruby

file 'lib/cackle/acl_parser.rb' => ['lib/cackle/acl_parser.treetop'] do |t|
	sh "tt #{t.prerequisites.first} -o #{t.name}"
end

task :test => ['lib/cackle/acl_parser.rb']

task :gemspec do |t|
	File.open('cackle.gemspec', 'w') do |f|
		f.write h.spec.to_ruby
	end
end