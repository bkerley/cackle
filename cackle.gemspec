Gem::Specification.new do |s|
  s.name = %q{cackle}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryce Kerley"]
  s.date = %q{2008-08-29}
  s.default_executable = %q{cackle}
  s.description = %q{Cackle compiles CSS-like access control lists into an easily usable ruby data structure.}
  s.email = ["bryce@worldmedia.net"]
  s.executables = ["cackle"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt", "vendor/shoulda/Manifest.txt", "vendor/shoulda/README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/cackle", "lib/cackle.rb", "lib/cackle/acl_parser.rb", "lib/cackle/acl_parser.treetop", "lib/cackle/node_flavors.rb", "lib/cackle/rule_list.rb", "test/helper.rb", "test/sample.acl", "test/test_parser.rb", "test/test_rules.rb", "vendor/shoulda/Manifest.txt", "vendor/shoulda/README.txt", "vendor/shoulda/Rakefile", "vendor/shoulda/bin/convert_file_to_shoulda", "vendor/shoulda/lib/proc_extensions.rb", "vendor/shoulda/lib/shoulda.rb", "vendor/shoulda/shoulda-gem.gemspec", "vendor/shoulda/test/test_shoulda.rb"]
  s.has_rdoc = true
  s.homepage = %q{FIX (url) NO URL YET I'LL FIX YOUR FACE IF YOU WHINE}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cackle}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Cackle compiles CSS-like access control lists into an easily usable ruby data structure.}
  s.test_files = ["test/test_parser.rb", "test/test_rules.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<treetop>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<treetop>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<treetop>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
