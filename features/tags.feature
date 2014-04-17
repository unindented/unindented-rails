Feature: Tags page
  In order to explore topics
  As a visitor
  I want to see a list of tags used on contents

  Scenario: Title shows what the section is about
    When I visit "/tags/"
    Then I should see the title "Tags"

  Scenario: Tags page shows a list of tags
    Given the following articles exist:
      | title      | tags             |
      | Article #1 | Ruby, JavaScript |
      | Article #2 | JavaScript       |
    And the following experiments exist:
      | title          | tags       |
      | Experiments #1 | Ruby       |
      | Experiments #2 | JavaScript |
    When I visit "/tags/"
    Then I should see the link "Ruby" pointing to "/tags/ruby/"
    And I should see the link "JavaScript" pointing to "/tags/javascript/"
