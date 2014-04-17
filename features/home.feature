Feature: Home page
  In order to check out what the site is about
  As a visitor
  I want to see a list of the latest articles and experiments

  Scenario: Title shows the name of the site
    Given the about page exists
    When I visit "/"
    Then I should see the title "Unindented"

  Scenario: Unpublished articles and experiments do not show up
    Given the about page exists
    And the following articles exist:
      | title      | published |
      | Article #1 | true      |
      | Article #2 | false     |
    And the following experiments exist:
      | title         | published |
      | Experiment #1 | true      |
      | Experiment #2 | false     |
    When I visit "/"
    Then I should see the link "Article #1"
    And I should see the link "Experiment #1"
    And I should not see the link "Article #2"
    And I should not see the link "Experiment #2"

  Scenario: Featured articles and experiments show up on top
    Given the about page exists
    And the following articles exist:
      | title      | published | featured |
      | Article #1 | true      | false    |
      | Article #2 | true      | true     |
    And the following experiments exist:
      | title         | published | featured |
      | Experiment #1 | true      | false    |
      | Experiment #2 | true      | true     |
    When I visit "/"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #2" before "Experiment #1"
    And I should see "Experiment #2" before "Article #1"

  Scenario: Most recent articles and experiments show up on top
    Given the about page exists
    And the following articles exist:
      | title      | date       | published | featured |
      | Article #1 | 2013-01-01 | true      | false    |
      | Article #2 | 2013-01-02 | true      | false    |
    And the following experiments exist:
      | title         | date       | published | featured |
      | Experiment #1 | 2013-01-03 | true      | false    |
      | Experiment #2 | 2013-01-04 | true      | false    |
    When I visit "/"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #2" before "Experiment #1"
    And I should see "Experiment #1" before "Article #2"
