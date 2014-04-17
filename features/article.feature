Feature: Article page
  In order to read an article
  As a visitor
  I want to see the content and metadata of the article

  Scenario: Title shows the title of the article
    Given the about page exists
    And the following articles exist:
      | title      |
      | Article #1 |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the title "Article #1"

  Scenario: Discovery link points to articles list
    Given the about page exists
    And the following articles exist:
      | title      |
      | Article #1 |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the head tag "link[@href='/articles/']"

  Scenario: Body shows the content of the article
    Given the about page exists
    And the following articles exist:
      | title      | body  |
      | Article #1 | What? |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the text "What?"

  Scenario: Body shows some metadata of the article
    Given the about page exists
    And the following articles exist:
      | title      | author | date       | tags             |
      | Article #1 | John   | 2013-01-01 | Ruby, JavaScript |
    When I visit "/"
    And I click on "Article #1"
    Then I should not see the text "John"
    And I should see the link "January 1st, 2013"
    And I should see the link "Ruby"
    And I should see the link "JavaScript"

  Scenario: Body shows link to tweet and email
    Given the about page exists
    And the following articles exist:
      | title      |
      | Article #1 |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the link "tweet" pointing to "https://twitter.com/intent/tweet?url=http%3A%2F%2Ftest.unindented.org%2Farticles%2Farticle-1%2F&via=unindented"
    And I should see the link "email" pointing to "mailto:daniel@unindented.org?subject=Article+%231"

  Scenario: Body shows link to related (next) article
    Given the about page exists
    And the following articles exist:
      | title      | date       |
      | Article #1 | 2013-01-01 |
      | Article #2 | 2013-01-02 |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the link "Article #2"

  Scenario: Body shows link to related (previous) article
    Given the about page exists
    And the following articles exist:
      | title      | date       |
      | Article #1 | 2013-01-01 |
      | Article #2 | 2013-01-02 |
    When I visit "/"
    And I click on "Article #2"
    Then I should see the link "Article #1"

  Scenario: Article without the MathJax extension doesn't load up MathJax
    Given the about page exists
    And the following articles exist:
      | title      |
      | Article #1 |
    When I visit "/"
    And I click on "Article #1"
    Then I should not see the script tag "script[contains(@src, 'MathJax')]"

  Scenario: Article with the MathJax extension loads up MathJax
    Given the about page exists
    And the following articles exist:
      | title      | extensions |
      | Article #1 | MathJax    |
    When I visit "/"
    And I click on "Article #1"
    Then I should see the script tag "script[contains(@src, 'MathJax')]"

  @javascript
  Scenario: Article without the MathJax extension doesn't load up MathJax
    Given the about page exists
    And the following articles exist:
      | title      |
      | Article #1 |
    When I visit "/"
    And I trigger "click" on "Article #1"
    Then I should not see the variable "MathJax"
