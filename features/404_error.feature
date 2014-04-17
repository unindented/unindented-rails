Feature: 404 error page
  In order to know what went wrong
  As a visitor
  I want to read a descriptive 404 error page

  Scenario: Title shows the type of error
    When I visit "/errors/404"
    Then I should see the title "Page Not Found (404)"

  Scenario: Header describes the error
    When I visit "/errors/404"
    Then I should see the header "Couldn’t find it :("
