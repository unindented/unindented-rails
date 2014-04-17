Feature: 500 error page
  In order to know what went wrong
  As a visitor
  I want to read a descriptive 500 error page

  Scenario: Title shows the type of error
    When I visit "/errors/500/"
    Then I should see the title "Internal Server Error (500)"

  Scenario: Header describes the error
    When I visit "/errors/500/"
    Then I should see the header "Something went wrong :'("
