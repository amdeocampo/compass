*** Settings ***
Documentation  Sanity test for Overview module
Library  Selenium2Library
Resource  ../resources/resource.robot
Test Teardown    close browser

*** Test Cases ***
Verify Overview module page objects
    #Navigate to Compass > Overview
    Given compass page is opened
    When specific menu module is displayed  Overview
    Then specific menu is clicked  Overview
    #Verify widgets
    Given specific menu is active  Overview
    When specific page is displayed  Account Overview
    And linked pages dropdown is displayed
    And specific widget is displayed  Total Followers
    And specific widget is displayed  Total Likes
    And specific widget is displayed  Total Posts
    And specific widget is displayed  Total Post Engagements
    And specific widget is displayed  5 Recent Posts
    And specific widget is displayed  Most Trending Post
    And specific widget is displayed  Page Sentiment