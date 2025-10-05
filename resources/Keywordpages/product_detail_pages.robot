***Settings***
Library    SeleniumLibrary
Resource   ../locators/product_detail_locators.robot  

***Keywords***

Shadow root color button
    [Arguments]    ${COLOR}
    Wait Until Keyword Succeeds    10x    0.5s    Shadow root click button    ${COLOR}

Shadow root click button
    [Arguments]    ${COLOR}
    ${js}=    Catenate
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector(`[data-testid="pd-opt-color-${COLOR}"]`);
    ...    if (el) el.click(); else throw new Error("Color button not found!");
    Execute JavaScript    ${js}

Shadow root decrease qty
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="pd-qty-btn-minus"]');
    ...    if (el) el.click(); else throw new Error("Minus button not found!");


Shadow root increase qty
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="pd-qty-btn-plus"]');
    ...    if (el) el.click(); else throw new Error("Plus button not found!");


Shadow root input qty
    [Arguments]    ${VALUE}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="pd-qty-input"]');
    ...    if (el) {
    ...      el.value = "${VALUE}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
    ...    } else {
    ...      throw new Error("Quantity input not found!");
    ...    }


Shadow root add to cart button
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[id="btn-add-to-cart"]');
    ...    if (el) el.click(); else throw new Error("Add to cart button not found!");
    ...    

Select product color
    [Arguments]    ${COLOR}
    Shadow root color button    ${COLOR}

Input product quantity
    [Arguments]    ${VALUE}
    Shadow root input qty       ${VALUE}


Add to cart button
    ShadowRootAddToCartButton

