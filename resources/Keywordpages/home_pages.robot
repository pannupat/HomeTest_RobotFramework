*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/home_locators.robot
Resource   ../locators/login_locators.robot
Resource   ../../variables.robot

*** Keywords ***

Account button
    Click Button    ${HOME_ACCOUNTBUTTON}

Nav account link
    Click Element    ${NAVACCOUNTMENU} 

Search product
...    [Arguments]     ${SEARCH}
    Input Text    ${HOME_SEARCHBOX}    ${SEARCH}
    Wait Until Element Is Visible  ${WAITAUTOCOMPLETE}    ${TIMEOUT}

Click autocomplete
    Click Element    ${WAITAUTOCOMPLETE}

Search button
    Click Button    ${HOME_SEARCHBUTTON}




