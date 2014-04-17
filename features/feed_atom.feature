Feature: Atom feed page
  In order to receive the latest updates through my feed reader
  As a visitor
  I want to have an Atom feed with the latest articles and experiments

  Scenario: Discovery link points to Atom feed
    Given the about page exists
    When I visit "/"
    Then I should see the head tag "link[@href='/feed.atom' and @type='application/atom+xml']"

  Scenario: Feed shows the title and subtitle for the site
    When I visit "/feed.atom"
    Then I should see the tag "feed/title" with the value "Unindented"
    And I should see the tag "feed/subtitle" with the value "Home of Daniel Perez Alvarez"

  Scenario: Feed shows the author and copyright for the site
    When I visit "/feed.atom"
    Then I should see the tag "feed/author/name" with the value "Daniel Perez Alvarez"
    And I should see the tag "feed/rights" with the value "All content by Daniel Perez Alvarez unless otherwise noted. Some rights reserved."

  Scenario: Feed shows the date when the site was last updated
    Given the following articles exist:
      | title      | date       | published |
      | Article #1 | 2013-01-01 | true      |
      | Article #2 | 2013-01-02 | true      |
    And the following experiments exist:
      | title         | date       | published |
      | Experiment #1 | 2013-01-03 | true      |
      | Experiment #2 | 2013-01-04 | false     |
    When I visit "/feed.atom"
    Then I should see the tag "feed/updated" with the value "2013-01-03T00:00:00+00:00"

  Scenario: Unpublished articles and experiments do not show up
    Given the following articles exist:
      | title      | published |
      | Article #1 | true      |
      | Article #2 | false     |
    And the following experiments exist:
      | title         | published |
      | Experiment #1 | true      |
      | Experiment #2 | false     |
    When I visit "/feed.atom"
    Then I should see the text "Article #1"
    And I should see the text "Experiment #1"
    And I should not see the text "Article #2"
    And I should not see the text "Experiment #2"

  Scenario: Featured articles and experiments do not show up on top
    Given the following articles exist:
      | title      | date       | featured |
      | Article #1 | 2013-01-01 | true     |
      | Article #2 | 2013-01-02 | false    |
    And the following experiments exist:
      | title         | date       | featured |
      | Experiment #1 | 2013-01-03 | true     |
      | Experiment #2 | 2013-01-04 | false    |
    When I visit "/feed.atom"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #1" before "Article #2"
    And I should see "Experiment #2" before "Experiment #1"

  Scenario: Most recent articles and experiments show up on top
    Given the following articles exist:
      | title      | date       |
      | Article #1 | 2013-01-01 |
      | Article #2 | 2013-01-02 |
    And the following experiments exist:
      | title         | date       |
      | Experiment #1 | 2013-01-03 |
      | Experiment #2 | 2013-01-04 |
    When I visit "/feed.atom"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #1" before "Article #2"
    And I should see "Experiment #2" before "Experiment #1"
