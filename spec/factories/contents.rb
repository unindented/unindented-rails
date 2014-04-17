FactoryGirl.define do

  factory(:content) do
    title    { Faker::Lorem::words(Random.rand(4) + 4).join(' ') }
    author   { Faker::Name::name }
    body     { Faker::Lorem::paragraphs(Random.rand(5) + 5).join("\n\n") }

    category { %w{articles experiments}[Random.rand(2)] }
    date     { Date.today - Random.rand(3333) }

    path     { "#{category}/#{date}-#{(title || '').parameterize}" }
    locator  { "#{category}/#{(title || '').parameterize}" }
  end

end
