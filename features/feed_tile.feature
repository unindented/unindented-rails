Feature: Tile feed page
  In order to receive the latest updates through my Surface
  As a visitor
  I want to have a live tile with the latest articles and experiments

  Scenario: Discovery link points to Atom feed
    Given the about page exists
    When I visit "/"
    Then I should see the head tag "link[@href='/feed.tile' and @type='application/xml']"

  Scenario: Feed renders correctly
    When I visit "/feed.tile"
    Then I should see the tag "tile/visual"

  Scenario: Unpublished articles and experiments do not show up
    Given the following articles exist:
      | title      | published |
      | Article #1 | true      |
      | Article #2 | false     |
    And the following experiments exist:
      | title         | published |
      | Experiment #1 | true      |
    When I visit "/feed.tile"
    Then I should see the text "Article #1"
    And I should see the text "Experiment #1"
    And I should not see the text "Article #2"

  Scenario: Featured articles and experiments do not show up on top
    Given the following articles exist:
      | title      | date       | featured |
      | Article #1 | 2013-01-01 | true     |
      | Article #2 | 2013-01-02 | false    |
    And the following experiments exist:
      | title         | date       | featured |
      | Experiment #1 | 2013-01-03 | false    |
    When I visit "/feed.tile"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #1" before "Article #2"

  Scenario: Most recent articles and experiments show up on top
    Given the following articles exist:
      | title      | date       |
      | Article #1 | 2013-01-01 |
      | Article #2 | 2013-01-02 |
    And the following experiments exist:
      | title         | date       |
      | Experiment #1 | 2013-01-03 |
    When I visit "/feed.tile"
    Then I should see "Article #2" before "Article #1"
    And I should see "Experiment #1" before "Article #2"
