Feature: jackpot

  Scenario Outline: sliding sliders should change box values (examples table)
    When I slide slider 1 by <slider1>
    And I slide slider 2 by <slider2>
    Then I should see jackpot message "You hit the jackpot of 12!"
    Examples:
      | slider1 | slider2 |
      | 10      | 2       |
      | 5       | 7       |
      | 6       | 6       |

  Scenario Outline: sliding sliders should change box values (examples table)
    When I slide slider 1 by <slider1>
    And I slide slider 2 by <slider2>
    Then I should not see jackpot message
    Examples:
      | slider1 | slider2 |
      | 10      | 1       |
      | 6       | 6       |
