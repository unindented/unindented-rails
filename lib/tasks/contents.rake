require 'content_loader'

namespace :contents do
  desc 'Load all contents into the database'
  task :load => :environment do
    src = Rails.root.join('contents').to_s
    ContentLoader.new.load(src)
  end

  desc 'Reset the contents of the database'
  task :reset => ['db:migrate', 'db:reset', 'contents:load']
end

desc 'Alias for contents:reset'
task :contents => 'contents:reset'
