require 'rubygems'
require 'rake'
#require 'cucumber/rake/task'
require 'spec/rake/spectask'
require 'rcov'


# RSPEC
Spec::Rake::SpecTask.new(:spec) do |task|
  task.spec_opts = ['--options', "spec/support/spec.opts"]
end

# CUCUMBER
#Cucumber::Rake::Task.new(:features)

# RCOV
Spec::Rake::SpecTask.new(:rcov) do |task|
  task.spec_opts = ['--options', "spec/support/spec.opts"]
  task.spec_files = FileList['lib/*']
  task.rcov = true
  task.rcov_opts = lambda do
    IO.readlines('spec/support/rcov.opts').map { |line| line.chomp.split ' ' }.flatten
  end
end