require "logstash/devutils/rake"

task :build do
  system "gem build logstash-filter-jsonrehasher.gemspec"
end

# unpacks it all
task :unpack do
  system "find ./ -name '*.gem' -maxdepth 1 -exec rm {} +"
  system "[ -e ./temp ] && rm -R ./temp"
  system "[ ! -e ./temp ] && mkdir ./temp"
  Rake::Task["build"].invoke
  system "cp *.gem temp/"
  system "cd temp; gem unpack *.gem"
  system "cd temp; find ./"
end

# cleans up this project's directories
task :clean do
  system "find ./ -name '*.gem' -maxdepth 1 -exec rm {} +"
  system "[ -e ./temp ] && rm -R ./temp"
end
