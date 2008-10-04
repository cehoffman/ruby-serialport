GEM       = "ruby-serialport"
VER       = "0.7.0"
AUTHORS    = ["Guillaume Pierronnet", "Alan Stern", "Daniel E. Shipton", "Chris Hoffman"]
EMAIL     = "cehoffman@gmail.com"
HOMEPAGE  = "http://github.com/chrishoffman/ruby-serialport/"
SUMMARY   = "Ruby/SerialPort is a Ruby library that provides a class for using RS-232 serial ports."

Gem::Specification.new do |s|
  s.name = GEM
  s.version = VER
  s.authors = AUTHORS
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.summary = SUMMARY
  s.description = s.summary

  s.files = ["LICENSE", "CHANGELOG", "README.rdoc", "lib/serialport.rb", "ext/extconf.rb", "ext/serialport.c", "ext/serialport.h", "ext/posix_serialport_impl.c", "ext/win_serialport_impl.c", "test/miniterm.rb"]
  s.test_files = ["test/miniterm.rb"]
  s.extensions = ['ext/extconf.rb']
  s.has_rdoc = true
  s.extra_rdoc_files = ["LICENSE", "CHANGELOG", "README.rdoc"]
  s.rdoc_options = [ "--main", "README.rdoc" ]
end

