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

Search_on_product_fill
...    [Arguments]     ${SEARCH}
    Input Text    ${HOME_SEARCHBOX}    ${SEARCH}
    Wait Until Element Is Visible  ${WAITAUTOCOMPLETE}    ${TIMEOUT}

Wait_autocomplete_and_click
    Click Element    ${WAITAUTOCOMPLETE}

CLick_search_button
    Click Button    ${HOME_SEARCHBUTTON}




