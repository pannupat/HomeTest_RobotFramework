*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/register_locators.robot

*** Keywords ***
Full name
...    [Arguments]    ${FULLNAME}
    Input Text    ${REGISTER_FULLNAME}    ${FULLNAME}

Telephone
...    [Arguments]    ${PHONE}
    Input Text    ${REGISTER_TELEPHONE}    ${PHONE}

Email
...    [Arguments]    ${EMAIL}
    Input Text    ${REGISTER_EMAIL}    ${EMAIL}

Password
...    [Arguments]    ${PASSWORD}
    Input Text    ${REGISTER_PASSWORD}    ${PASSWORD}

Confirm password
...    [Arguments]    ${CONFIRMPASSWORD}
    Input Text    ${REGISTER_CONFIRMPASSWORD}    ${CONFIRMPASSWORD}

Submit register
    Click Button    ${REGISTER_BUTTON}