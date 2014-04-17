Feature: Experiment page
  In order to read an experiment
  As a visitor
  I want to see the content and metadata of the experiment

  Scenario: Title shows the title of the experiment
    Given the about page exists
    And the following experiments exist:
      | title         |
      | Experiment #1 |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the title "Experiment #1"

  Scenario: Discovery link points to experiments list
    Given the about page exists
    And the following experiments exist:
      | title         |
      | Experiment #1 |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the head tag "link[@href='/experiments/']"

  Scenario: Body shows the content of the experiment
    Given the about page exists
    And the following experiments exist:
      | title         | body  |
      | Experiment #1 | What? |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the text "What?"

  Scenario: Body shows some metadata of the experiment
    Given the about page exists
    And the following experiments exist:
      | title         | author | date       | tags             |
      | Experiment #1 | John   | 2013-01-01 | Ruby, JavaScript |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should not see the text "John"
    And I should see the text "January 1st, 2013"
    And I should see the link "Ruby"
    And I should see the link "JavaScript"

  Scenario: Body shows link to tweet and email
    Given the about page exists
    And the following experiments exist:
      | title         |
      | Experiment #1 |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the link "tweet" pointing to "https://twitter.com/intent/tweet?url=http%3A%2F%2Ftest.unindented.org%2Fexperiments%2Fexperiment-1%2F&via=unindented"
    And I should see the link "email" pointing to "mailto:daniel@unindented.org?subject=Experiment+%231"

  Scenario: Body shows link to related (next) experiment
    Given the about page exists
    And the following experiments exist:
      | title         | date       |
      | Experiment #1 | 2013-01-01 |
      | Experiment #2 | 2013-01-02 |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the text "Experiment #2"

  Scenario: Body shows link to related (previous) experiment
    Given the about page exists
    And the following experiments exist:
      | title         | date       |
      | Experiment #1 | 2013-01-01 |
      | Experiment #2 | 2013-01-02 |
    When I visit "/"
    And I click on "Experiment #2"
    Then I should see the text "Experiment #1"

  Scenario: Experiment without the MathJax extension doesn't load up MathJax
    Given the about page exists
    And the following experiments exist:
      | title         |
      | Experiment #1 |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should not see the script tag "script[contains(@src, 'MathJax')]"

  Scenario: Experiment with the MathJax extension loads up MathJax
    Given the about page exists
    And the following experiments exist:
      | title         | extensions |
      | Experiment #1 | MathJax    |
    When I visit "/"
    And I click on "Experiment #1"
    Then I should see the script tag "script[contains(@src, 'MathJax')]"

  @javascript
  Scenario: Experiment without the MathJax extension doesn't load up MathJax
    Given the about page exists
    And the following experiments exist:
      | title         |
      | Experiment #1 |
    When I visit "/"
    And I trigger "click" on "Experiment #1"
    Then I should not see the variable "MathJax"
