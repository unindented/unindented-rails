Feature: Tags page
  In order to explore a certain topic
  As a visitor
  I want to see a list of contents tagged with a certain term

  Scenario: Title shows the name of the tag
    Given the following contents exist:
      | title      | published | featured  | tags       |
      | Article #1 | true      | false     | JavaScript |
    When I visit "/tags/javascript/"
    Then I should see the title "Contents tagged with ‘JavaScript’"

  Scenario: Discovery link points to tags list
    Given the following contents exist:
      | title      | published | featured  | tags       |
      | Article #1 | true      | false     | JavaScript |
    When I visit "/tags/javascript/"
    Then I should see the head tag "link[@href='/tags/']"

  Scenario: Tag page shows published content for a specific tag
    Given the following articles exist:
      | title      | published | featured  | tags             |
      | Article #1 | true      | false     | Ruby, JavaScript |
      | Article #2 | true      | true      | JavaScript       |
    And the following experiments exist:
      | title          | published | featured  | tags       |
      | Experiments #1 | true      | false     | Ruby       |
      | Experiments #2 | false     | false     | JavaScript |
    When I visit "/tags/javascript/"
    Then I should see the link "Article #1"
    And I should see the link "Article #2"
    And I should not see the link "Experiment #1"
    And I should not see the link "Experiment #2"

  Scenario: Content pagination
    Given the following articles exist:
      | title      | tags       |
      | Article #1 | JavaScript |
      | Article #2 | JavaScript |
      | Article #3 | JavaScript |
      | Article #4 | JavaScript |
    And the following experiments exist:
      | title          | tags       |
      | Experiments #1 | JavaScript |
      | Experiments #2 | JavaScript |
      | Experiments #3 | JavaScript |
    When I visit "/tags/javascript/"
    Then I should see the link "Next"
    And I should not see the link "Prev"
