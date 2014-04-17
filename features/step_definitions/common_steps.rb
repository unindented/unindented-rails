Transform /^(\d+)$/ do |number|
  number.to_i
end

Transform(/^table:.+$/) do |table|
  table.map_headers! do |header|
    header.underscore.to_sym
  end
  table.map_column!(:tags, false) do |tags|
    tags.split(/\s*,\s*/).map do |tag_name|
      Tag.find_or_create_by!(name: tag_name)
    end
  end
  table.map_column!(:extensions, false) do |extensions|
    extensions.split(/\s*,\s*/).map do |ext_name|
      Extension.find_or_create_by!(name: ext_name)
    end
  end
  table
end

Given(/^the (about) page exists$/) do |locator|
  FactoryGirl.create(:content, locator: locator)
end

Given(/^the following contents exist:$/) do |contents|
  contents.hashes.each do |content|
    FactoryGirl.create(:content, content)
  end
end

Given(/^the following (articles|experiments) exist:$/) do |category, contents|
  contents.hashes.each do |content|
    FactoryGirl.create(:content, content.merge(category: category))
  end
end

Given(/^that (\d+) (articles|experiments) exist$/) do |number, category|
  FactoryGirl.create_list(:content, number, category: category)
end

When(/^I visit "([^"]+)"$/) do |route|
  visit route
end

When(/^I click on "([^"]+)"$/) do |text|
  find_link(text).click
end

When(/^I trigger "([^"]+)" on "([^"]+)"$/) do |event, text|
  find_link(text).trigger(event)
end

Then(/^I should (not )?see the title "([^"]+)"$/) do |negate, text|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_title(text))
end

Then(/^I should (not )?see the header "([^"]+)"$/) do |negate, text|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_selector('h1', text: text))
end

Then(/^I should (not )?see the link "([^"]+)"(?: pointing to "([^"]+)")?$/) do |negate, text, href|
  method = negate.present? ? 'to_not' : 'to'
  opts = { href: href } if href.present?
  expect(page).send(method, have_link(text, opts))
end

Then(/^I should (not )?see the text "([^"]*)"$/) do |negate, text|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_text(text))
end

Then(/^I should (not )?see "([^"]*)" before "([^"]*)"$/) do |negate, text1, text2|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_before(text1, text2))
end

Then(/^I should (not )?see the tag "([^"]*)"(?: with the value "([^"]*)")?$/) do |negate, xpath, value|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_xpath("//#{xpath}", text: value))
end

Then(/^I should (not )?see the (?:head|script) tag "([^"]*)"(?: with the value "([^"]*)")?$/) do |negate, xpath, value|
  method = negate.present? ? 'to_not' : 'to'
  expect(page).send(method, have_xpath("//#{xpath}", text: value, visible: false))
end
