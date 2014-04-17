FactoryGirl.define do

  factory(:partial_date) do
    ignore do
      date { Date.today - Random.rand(3333) }
    end

    category { %w{articles experiments}[Random.rand(2)] }
    year     { date.year }
  end

end

