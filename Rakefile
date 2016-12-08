require "bundler/gem_tasks"
require "rake/testtask"
load 'tasks/build_docs.rake'

#Note: Unless installing from a gem server like rubygems, you Have to rebuild gems and install from command line to get this to work properly
#Otherwise it wont find the right gem
#ex: gem install --local 'C:\Users\mikeu\_ASource\Marskal\Gems\marskal-rdoc\marskal-rdoc-0.1.1.wip.gem'
# @marskal_rdoc_dir = Gem::Specification.find_by_name("marskal-rdoc")
# unless @marskal_rdoc_dir.nil?
#   puts "Loading Rake Task..................#{@marskal_rdoc_dir.gem_dir}"
#   load "#{@marskal_rdoc_dir.gem_dir}/lib/tasks/build_docs.rake"
# end


Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test





