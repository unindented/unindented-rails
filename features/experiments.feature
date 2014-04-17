Feature: Experiments page
  In order to check out experiments in the site
  As a visitor
  I want to see a list of the latest experiments

  Scenario: Title shows what the section is about
    When I visit "/experiments/"
    Then I should see the title "Experiments"

  Scenario: Unpublished experiments do not show up
    Given the following experiments exist:
      | title         | published |
      | Experiment #1 | true      |
      | Experiment #2 | false     |
    When I visit "/experiments/"
    Then I should see the link "Experiment #1"
    And I should not see the link "Experiment #2"

  Scenario: Featured experiments do not show up on top
    Given the following experiments exist:
      | title         | date       | published | featured |
      | Experiment #1 | 2013-01-01 | true      | true     |
      | Experiment #2 | 2013-01-02 | true      | false    |
    When I visit "/experiments/"
    Then I should see "Experiment #2" before "Experiment #1"

  Scenario: Most recent experiments show up on top
    Given the following experiments exist:
      | title         | date       | published | featured |
      | Experiment #1 | 2013-01-01 | true      | false    |
      | Experiment #2 | 2013-01-02 | true      | false    |
    When I visit "/experiments/"
    Then I should see "Experiment #2" before "Experiment #1"
