GEM       = "ruby-serialport"
VER       = "0.7.0"
AUTHOR    = ["Guillaume Pierronnet", "Alan Stern", "Daniel E. Shipton", "Chris Hoffman"]
EMAIL     = "cehoffman@gmail.com"
HOMEPAGE  = "http://github.com/chrishoffman/ruby-serialport/"
SUMMARY   = "Ruby/SerialPort is a Ruby library that provides a class for using RS-232 serial ports."

Gem::Specification.new do |s|
  s.name = GEM
  s.version = VER
  s.authors = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.summary = SUMMARY
  s.description = s.summary

  s.files = FileList["LICENSE", "CHANGELOG", "README", "lib/*.rb", "ext/*.{c,h,rb}", "test/*"].to_a
  s.test_files = FileList["test/*"].to_a
  s.extensions << 'ext/extconf.rb'
  s.has_rdoc = true
  s.extra_rdoc_files = ["LICENSE", "CHANGELOG", "README", "ext/serialport.c", "ext/serialport.h"]
  s.rdoc_options = [ "--main", "README" ]
end

