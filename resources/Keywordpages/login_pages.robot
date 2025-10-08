*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/login_locators.robot    
Resource   ../../variables.robot    


*** Keywords ***

Shadow root email
    [Arguments]    ${email}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="signin-email"]');
    ...      el.value = "${email}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
Shadow root password
    [Arguments]    ${password}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="signin-password"]');
    ...      el.value = "${password}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));



Shadow root remember button
    [Arguments]    ${remember}
    Execute JavaScript
    ...    document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="signin-remember"]')
    ...      .click();
    ...   

Shadow root login button
    [Arguments]    ${login}
    Execute JavaScript
    ...    document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[id="btn-signin"]')
    ...      .click();
    ...   
    
Input_email_fill
       [Arguments]    ${EMAIL}
       Shadow root email     ${EMAIL}

Input_password_fill
       [Arguments]    ${PASSWORD}
       Shadow root password    ${PASSWORD}

Cick_remember_checkbox
       Shadow root remember button    ${LOGIN_REMEMBERME}

Cick_button_submit_login
       Shadow root login button    ${LOGIN_BUTTON}
