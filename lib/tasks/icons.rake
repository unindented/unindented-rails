require 'icon_generator'

namespace :icons do
  namespace :favicon do
    desc 'Build favicon in SVG format'
    task :svg do
      src = Rails.root.join('app', 'assets', 'images', 'logo_stroked.svg')
      dst = Rails.root.join('public', 'favicon.svg')
      FileUtils.cp(src, dst)
    end

    desc 'Build favicon in PNG format'
    task :png => 'icons:favicon:svg' do
      src = Rails.root.join('public', 'favicon.svg')
      dst = Rails.root.join('public')
      sizes = {
          '48x48' => 48,
          '32x32' => 32,
          '24x24' => 24,
          '16x16' => 16,
          nil     => 32
      }

      IconGenerator.new.png(src, sizes: sizes) do |name, options|
        suffix = "-#{name}" if name.present?
        dst.join("favicon#{suffix}.png")
      end
    end

    desc 'Build favicon in ICO format'
    task :ico => 'icons:favicon:png' do
      src = Rails.root.join('public', 'favicon-48x48.png')
      dst = Rails.root.join('public')
      sizes = {
        nil => [48, 32, 24, 16]
      }

      IconGenerator.new.ico(src, sizes: sizes) do |name, options|
        suffix = "-#{name}" if name.present?
        dst.join("favicon#{suffix}.ico")
      end
    end
  end

  desc 'Build Apple icons'
  task :apple => 'icons:favicon:svg' do
    src = Rails.root.join('public', 'favicon.svg')
    dst = Rails.root.join('public')
    sizes = {
      '144x144-precomposed' => 144,
      '120x120-precomposed' => 120,
      '114x114-precomposed' => 114,
      '72x72-precomposed'   => 72,
      '57x57-precomposed'   => 57,
      'precomposed'         => 57,
      nil                   => 57
    }

    IconGenerator.new.png(src, sizes: sizes) do |name, options|
      suffix = "-#{name}" if name.present?
      dst.join("apple-touch-icon#{suffix}.png")
    end
  end

  desc 'Build Microsoft icons'
  task :microsoft => 'icons:favicon:svg' do
    src = Rails.root.join('public', 'favicon.svg')
    dst = Rails.root.join('public')
    sizes = {
      '558x558' => 558,
      '270x270' => 270,
      '128x128' => 128
    }

    IconGenerator.new.png(src, sizes: sizes) do |name, options|
      suffix = "-#{name}" if name.present?
      dst.join("ms-touch-icon#{suffix}.png")
    end
  end

  desc 'Build all icons'
  task :all => ['icons:favicon:png', 'icons:favicon:ico', 'icons:apple', 'icons:microsoft']
end

desc 'Alias for icons:all'
task :icons => 'icons:all'
