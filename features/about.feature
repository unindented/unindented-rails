Feature: About page
  In order to know more about the site
  As a visitor
  I want to read miscellaneous info about the author and the site

  Scenario: Title shows the title of the content
    Given the following contents exist:
      | title | locator | category |
      | About | about   | about    |
    When I visit "/about/"
    Then I should see the title "About"

  Scenario: About page shows info about the author
    Given the following contents exist:
      | title | body   | locator | category |
      | About | Hello! | about   | about    |
    When I visit "/about/"
    Then I should see the header "About"
    And I should see the text "Hello!"
