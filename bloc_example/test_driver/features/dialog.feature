Feature: dialog

  @FlutterScreenshot
  Scenario: sliding sliders should change box values
    When I tap on button
    Then I should see a dialog with title "This is an AlerDialog"
