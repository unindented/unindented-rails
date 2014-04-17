RSpec::Matchers.define(:have_before) do |earlier_content, later_content|
  match do |page|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end
