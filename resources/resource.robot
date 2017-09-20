*** Variables ***
${browser}  firefox
${server}  http://compass-staging.eu-west-1.elasticbeanstalk.com
${COMPASS_LOGO}  xpath=*//div[@id='dashboard-page']//p[contains(., 'Compass')]
${WIDGET_DATERANGE_DROPDOWN}  xpath=*//div[@id='dashboard-page']//ul[@class='nav navbar-nav']/li[@class='dropdown']
...  /a[i/@class = 'fa fa-calendar']
${WIDGET_LINKEDPAGES_DROPDOWN}  xpath=*//div[@id='dashboard-page']//ul[@class='nav navbar-nav']/li[@class='dropdown']
...  /a[i/@class = 'fa fa-user']
${WIDGET_COMMENTSFEED_SENTIMENT}  id=comment-feed-sentiment-widget
${WIDGET_COMMENTSFEED}  xpath=*//div[@id='dashboard-page']//div[@class='panel panel-default panel-section'
...  and contains(./div, 'Comments Feed')]

*** Settings ***
Documentation  Keywords for Compass frontend
Library  Selenium2Library
Library  ../resources/utility_frontend.py

*** Keywords ***
compass page is opened
    open browser  ${server}  ${browser}
    compass logo is displayed

compass logo is displayed
   element should be visible  ${COMPASS_LOGO}

specific menu module is displayed
    [Arguments]  ${menu_name}
    element should be visible  xpath=*//div[@id='dashboard-page']//a[contains(., '${menu_name}')]

specific menu is clicked
    [Arguments]  ${menu_name}
    click element  xpath=*//div[@id='dashboard-page']//a[contains(., '${menu_name}')]

specific menu is active
    [Arguments]  ${menu_name}
    ${XPATH_VALUE}=  catenate  SEPARATOR=
    ...  *//div[@id='dashboard-page']//li[@class='active']/a[contains(.,'${menu_name}')]
    element should be visible  xpath=${XPATH_VALUE}

specific page is displayed
    [Arguments]  ${page_name}
    ${XPATH_VALUE}=  catenate  SEPARATOR=
    ...  *//div[@id='dashboard-page']//p[contains(@class, 'navbar-text') and starts-with(.,'${page_name}')]
    element should be visible  xpath=${XPATH_VALUE}

date range dropdown is displayed
    wait until element is visible  ${WIDGET_DATERANGE_DROPDOWN}  timeout=2
    element should be visible  ${WIDGET_DATERANGE_DROPDOWN}

linked pages dropdown is displayed
    wait until element is visible  ${WIDGET_LINKEDPAGES_DROPDOWN}  timeout=2
    element should be visible  ${WIDGET_LINKEDPAGES_DROPDOWN}

comments feed sentiment widget is displayed
    wait until element is visible  ${WIDGET_COMMENTSFEED_SENTIMENT}  timeout=2
    element should be visible  ${WIDGET_COMMENTSFEED_SENTIMENT}

comments feed widget is displayed
    wait until element is visible  ${WIDGET_COMMENTSFEED}  timeout=2
    element should be visible  ${WIDGET_COMMENTSFEED}

specific widget is displayed
    [Arguments]  ${widget_name}
    ${XPATH_VALUE}=  catenate  SEPARATOR=
    ...  *//div[@id='dashboard-page']//div[@class='panel panel-default panel-section'
    ...  and contains(.//div, '${widget_name}')]
    element should be visible  xpath=${XPATH_VALUE}



