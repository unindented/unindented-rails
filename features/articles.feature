Feature: Articles page
  In order to check out articles in the site
  As a visitor
  I want to see a list of the latest articles

  Scenario: Title shows what the section is about
    When I visit "/articles/"
    Then I should see the title "Articles"

  Scenario: Unpublished articles do not show up
    Given the following articles exist:
      | title      | published |
      | Article #1 | true      |
      | Article #2 | false     |
    When I visit "/articles/"
    Then I should see the link "Article #1"
    And I should not see the link "Article #2"

  Scenario: Featured articles do not show up on top
    Given the following articles exist:
      | title      | date       | published | featured |
      | Article #1 | 2013-01-01 | true      | true     |
      | Article #2 | 2013-01-02 | true      | false    |
    When I visit "/articles/"
    Then I should see "Article #2" before "Article #1"

  Scenario: Most recent articles show up on top
    Given the following articles exist:
      | title      | date       | published | featured |
      | Article #1 | 2013-01-01 | true      | false    |
      | Article #2 | 2013-01-02 | true      | false    |
    When I visit "/articles/"
    Then I should see "Article #2" before "Article #1"
