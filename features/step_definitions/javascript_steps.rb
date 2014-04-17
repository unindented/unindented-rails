Then(/^I should (not )?see the variable "([^"]*)"(?: with the value "([^"]*)")?$/) do |negate, variable, value|
  if value.present?
    script  = variable
    matcher = eq(value)
    method  = negate.present? ? 'to_not' : 'to'
  else
    script  = "typeof #{variable}"
    matcher = eq('undefined')
    method  = negate.present? ? 'to' : 'to_not'
  end
  expect(page.evaluate_script(script)).send(method, matcher)
end
