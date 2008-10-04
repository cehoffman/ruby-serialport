require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'

# as seen from 'amazon-ec2' gem packge on git-hub - read gemspec file, eval,
# and assign it to spec to keep DRY coding principles
spec = eval(IO.read("ruby-serialport.gemspec"))

Rake::GemPackageTask.new(spec) do |pkg|
#   pkg.need_tar = true
   pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{VER}}
end

task :clean do
  sh %{rm -rf pkg}
  Dir.chdir("ext/") { sh %{make clean && rm -f Makefile} }
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/*.rb")
  rd.rdoc_dir = 'doc'
  rd.options = spec.rdoc_options
end
