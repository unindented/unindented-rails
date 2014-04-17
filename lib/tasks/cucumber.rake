unless ARGV.any? {|a| a =~ /^gems/}

vendored_cucumber_bin = Dir["#{Rails.root}/vendor/{gems,plugins}/cucumber*/bin/cucumber"].first
$LOAD_PATH.unshift(File.dirname(vendored_cucumber_bin) + '/../lib') unless vendored_cucumber_bin.nil?

begin
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new(:ok, 'Run features that should pass') do |t|
      t.binary = vendored_cucumber_bin
      t.fork = true
      t.profile = 'default'
    end

    Cucumber::Rake::Task.new(:wip, 'Run features that are being worked on') do |t|
      t.binary = vendored_cucumber_bin
      t.fork = true
      t.profile = 'wip'
    end

    Cucumber::Rake::Task.new(:rerun, 'Record failing features and run only them if any exist') do |t|
      t.binary = vendored_cucumber_bin
      t.fork = true
      t.profile = 'rerun'
    end

    desc 'Run all features'
    task :all => [:ok, :wip]

    task :statsetup do
      require 'rails/code_statistics'
      ::STATS_DIRECTORIES << %w(Cucumber\ features features) if File.exist?('features')
      ::CodeStatistics::TEST_TYPES << "Cucumber features" if File.exist?('features')
    end
  end

  desc 'Alias for cucumber:ok'
  task :cucumber => 'cucumber:ok'

  task :stats => 'cucumber:statsetup'

  task :default => :cucumber

rescue LoadError
  desc 'Cucumber not installed'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin.'
  end
end

end
