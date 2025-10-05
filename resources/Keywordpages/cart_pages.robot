***Settings***
Library    SeleniumLibrary
Resource   ../locators/cart_locators.robot
Resource   ../../variables.robot

***Keywords***
Cart
    Click Element       ${CART_BUTTON}

Shadow root select all products
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('input[data-cart="cart-div0-div1-div0-label0-input0"]');
    ...    if (el && !el.checked) el.click();

Shadow root proceed to checkout
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-proceed"]');
    ...    if (el && !el.checked) el.click();


Shadow root add new address
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[data-testid="checkout-add-address-toggle"]');
    ...    if (el && !el.checked) el.click();
    ...    

Select all in cart
    Shadow root select all products

Proceed to checkout
    Shadow root proceed to checkout

Add new address
    Shadow root add new address
