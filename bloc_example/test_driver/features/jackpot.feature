Feature: jackpot

  Scenario: sliding sliders should change box values
    When I slide the sliders
      | slider 1 | slider 2 |
      | 5        | 9        |
    Then I should see
      | box 1 | box 2 | box 3 | box 4 |
      | 5.0   | 6.0   | 8.0   | 1.0   |
