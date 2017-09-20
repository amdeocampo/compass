*** Settings ***
Documentation  Sanity test for Listening module
Library  Selenium2Library
Resource  ../resources/resource.robot
Test Teardown    close browser

*** Test Cases ***
Verify and navigate menus
    When compass page is opened
    Then specific menu module is displayed  Overview
    And specific menu module is displayed  Listening
    #Navigate to Listening
    Given specific menu is clicked  Listening
    When specific menu is active  Listening
    Then specific page is displayed  Listening
    #Navigate to Overview
    Given specific menu is clicked  Overview
    When specific menu is active  Overview
    Then specific page is displayed  Account Overview

