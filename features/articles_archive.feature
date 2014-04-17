Feature: Articles page for a specific date
  In order to check out articles for a specific date
  As a visitor
  I want to see a list of the articles published in the specified date range

  Scenario: Title shows the year
    When I visit "/articles/2013/"
    Then I should see the title "Articles for 2013"

  Scenario: Discovery link points to parent archive
    When I visit "/articles/2013/"
    Then I should see the head tag "link[@href='/articles/']"

  Scenario: Articles for a specific year
    Given the following articles exist:
      | title      | date       | published |
      | Article #1 | 2012-01-01 | true      |
      | Article #2 | 2013-01-01 | true      |
      | Article #3 | 2013-01-01 | false     |
    When I visit "/articles/2013/"
    Then I should see the link "Article #2"
    And I should not see the link "Article #1"
    And I should not see the link "Article #3"

  Scenario: Title shows the year and month
    When I visit "/articles/2013/02/"
    Then I should see the title "Articles for February, 2013"

  Scenario: Discovery link points to parent year
    When I visit "/articles/2013/02/"
    Then I should see the head tag "link[@href='/articles/2013/']"

  Scenario: Articles for a specific year and month
    Given the following articles exist:
      | title      | date       | published |
      | Article #1 | 2013-01-01 | true      |
      | Article #2 | 2013-02-01 | true      |
      | Article #3 | 2013-03-01 | false     |
    When I visit "/articles/2013/02/"
    Then I should see the link "Article #2"
    And I should not see the link "Article #1"
    And I should not see the link "Article #3"

  Scenario: Title shows the year, month and day
    When I visit "/articles/2013/01/02/"
    Then I should see the title "Articles for January 2nd, 2013"

  Scenario: Discovery link points to parent month
    When I visit "/articles/2013/01/02/"
    Then I should see the head tag "link[@href='/articles/2013/01/']"

  Scenario: Articles for a specific year, month and day
    Given the following articles exist:
      | title      | date       | published |
      | Article #1 | 2013-01-01 | true      |
      | Article #2 | 2013-01-02 | true      |
      | Article #3 | 2013-01-03 | false     |
    When I visit "/articles/2013/01/02/"
    Then I should see the link "Article #2"
    And I should not see the link "Article #1"
    And I should not see the link "Article #3"

  Scenario: Article pagination
    Given that 7 articles exist
    When I visit "/articles/"
    Then I should see the link "Next"
    And I should not see the link "Prev"
