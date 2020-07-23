Feature: dialog

  @FlutterScreenshot
  Scenario: dialog title is visible
    When I tap on button
    Then I should see a dialog with title "This is an AlerDialog"
