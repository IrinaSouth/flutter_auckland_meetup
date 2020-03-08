Feature: sliders

  Scenario: sliding sliders should change box values
    When I slide slider 1 by 3
    And I slide slider 2 by 4
    Then box 1 should have value 3.0
    And box 2 should have value 4.0
    And box 3 should have value 3.0
    And box 4 should have value 6.0

  Scenario Outline: sliding sliders should change box values (examples table)
    When I slide slider 1 by <slider1>
    And I slide slider 2 by <slider2>
    Then box 1 should have value <box1>
    And box 2 should have value <box2>
    And box 3 should have value <box3>
    And box 4 should have value <box4>
    Examples:
      | slider1 | slider2 | box1 | box2 | box3 | box4 |
      | 4       | 2       | 4.0  | 5.0  | 1.0  | 8.0  |
      | 9       | 6       | 9.0  | 10.0 | 5.0  | 4.0  |

  Scenario: sliding sliders should change box values (data table)
    When I slide the sliders
      | slider 1 | slider 2 |
      | 5        | 9        |
    Then I should see
      | box 1 | box 2 | box 3 | box 4 |
      | 5.0   | 6.0   | 8.0   | 1.0   |


  Scenario: sliding sliders should change box values
    When I slide the sliders
      | slider 1 | slider 2 |
      | 5        | 9        |
    Then I should see
      | box 1 | box 2 | box 3 | box 4 |
      | 5.0   | 6.0   | 8.0   | 1.0   |


