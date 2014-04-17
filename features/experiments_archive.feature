Feature: Experiments page for a specific date
  In order to check out experiments for a specific date
  As a visitor
  I want to see a list of the experiments published in the specified date range

  Scenario: Title shows the year
    When I visit "/experiments/2013/"
    Then I should see the title "Experiments for 2013"

  Scenario: Discovery link points to parent archive
    When I visit "/experiments/2013/"
    Then I should see the head tag "link[@href='/experiments/']"

  Scenario: Experiments for a specific year
    Given the following experiments exist:
      | title         | date       | published |
      | Experiment #1 | 2012-01-01 | true      |
      | Experiment #2 | 2013-01-01 | true      |
      | Experiment #3 | 2013-01-01 | false     |
    When I visit "/experiments/2013/"
    Then I should see the link "Experiment #2"
    And I should not see the link "Experiment #1"
    And I should not see the link "Experiment #3"

  Scenario: Title shows the year and month
    When I visit "/experiments/2013/02/"
    Then I should see the title "Experiments for February, 2013"

  Scenario: Discovery link points to parent year
    When I visit "/experiments/2013/02/"
    Then I should see the head tag "link[@href='/experiments/2013/']"

  Scenario: Experiments for a specific year and month
    Given the following experiments exist:
      | title         | date       | published |
      | Experiment #1 | 2013-01-01 | true      |
      | Experiment #2 | 2013-02-01 | true      |
      | Experiment #3 | 2013-03-01 | false     |
    When I visit "/experiments/2013/02/"
    Then I should see the link "Experiment #2"
    And I should not see the link "Experiment #1"
    And I should not see the link "Experiment #3"

  Scenario: Title shows the year, month and day
    When I visit "/experiments/2013/01/02/"
    Then I should see the title "Experiments for January 2nd, 2013"

  Scenario: Discovery link points to parent month
    When I visit "/experiments/2013/01/02/"
    Then I should see the head tag "link[@href='/experiments/2013/01/']"

  Scenario: Experiments for a specific year and month
    Given the following experiments exist:
      | title         | date       | published |
      | Experiment #1 | 2013-01-01 | true      |
      | Experiment #2 | 2013-01-02 | true      |
      | Experiment #3 | 2013-01-03 | false     |
    When I visit "/experiments/2013/01/02/"
    Then I should see the link "Experiment #2"
    And I should not see the link "Experiment #1"
    And I should not see the link "Experiment #3"

  Scenario: Experiment pagination
    Given that 7 experiments exist
    When I visit "/experiments/"
    Then I should see the link "Next"
    And I should not see the link "Prev"
