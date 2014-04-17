require 'open3'

namespace :build do
  desc 'Generate a mirror of the site'
  task :mirror => :environment do
    env       = Rails.env
    port      = SETTINGS.build.port
    rails_cmd = "RAILS_ENV=#{env} rails server --port #{port}"
    rm_cmd    = "rm -rf build/localhost:#{port}/"
    wget_cmd  = "wget --content-on-error --mirror --directory-prefix=build localhost:#{port}"
    cp_cmd    = "cp -r public/ build/localhost:#{port}/"

    puts "Starting up server..."
    Open3.popen2e(rails_cmd) do |rails_in, rails_oe, rails_wait|
      rails_oe.each do |line|
        if line.include?('WEBrick::HTTPServer#start:')
          Thread.new do
            puts "Cleaning up build folder..."
            puts %x(#{rm_cmd})
            puts "Mirroring site..."
            puts %x(#{wget_cmd})
            puts "Killing server..."
            Process.kill('TERM', rails_wait.pid)
          end
        end
      end
    end

    puts "Copying misc files..."
    puts %x(#{cp_cmd})
  end

  desc 'Deploy the site to the destination'
  task :deploy => :environment do
    port      = SETTINGS.build.port
    src       = "./build/localhost:#{port}/"
    dst       = SETTINGS.build.destination
    rsync_cmd = "rsync --archive --compress --delete --verbose #{src} #{dst}"

    puts "Deploying from #{src} to #{dst}..."
    puts %x(#{rsync_cmd})
  end
end

desc 'Build and deploy the site'
task :build => ['contents:reset', 'build:mirror', 'build:deploy']
