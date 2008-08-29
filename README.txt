= cackle

* FIX (url) NO URL YET I'LL FIX YOUR FACE IF YOU WHINE

== DESCRIPTION:

Cackle compiles CSS-like access control lists into an easily usable ruby data structure.

== FEATURES/PROBLEMS:

* parses acls
* does not support comments

== SYNOPSIS:

1) make .acl file (see test/sample.acl)
2) load .acl file (see bin/cackle)
3) query acl (see test/test_rules.rb)
4) receive bacon

== REQUIREMENTS:

* Treetop to generate the parser from the included grammar
* Shoulda for testing

== INSTALL:

* gem sources -a http://gems.github.com (you only have to do this once)
* sudo gem install bkerley-cackle

== LICENSE:

FIX