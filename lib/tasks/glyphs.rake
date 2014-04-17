namespace :glyphs do
  desc 'Build all glyphs'
  task :all do
    puts %x(fontcustom compile)
  end
end

desc 'Alias for glyphs:all'
task :glyphs => 'glyphs:all'
