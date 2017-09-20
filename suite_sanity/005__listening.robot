*** Settings ***
Documentation  Sanity test for Listening module
Library  Selenium2Library
Resource  ../resources/resource.robot
Test Teardown    close browser

*** Test Cases ***
Verify Listening module page objects
    #Navigate to Compass > Listening
    Given compass page is opened
    When specific menu module is displayed  Listening
    Then specific menu is clicked  Listening
    #Verify widgets
    Given specific menu is active  Listening
    When specific page is displayed  Listening
    Then linked pages dropdown is displayed
    And comments feed sentiment widget is displayed
    And comments feed widget is displayed
    And specific widget is displayed  Posts Reactions Summary
    And specific widget is displayed  Post Type Engagements
    And specific widget is displayed  Top 5 Page Mentions
    And specific widget is displayed  Top 5 Active User Accounts
    And specific widget is displayed  Top Words