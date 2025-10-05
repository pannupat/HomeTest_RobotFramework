***Settings***
Library    SeleniumLibrary
Resource   ../locators/product_locators.robot

***Keywords***
Shadow root ceramic mug
    ShadowRootApplyCoupon
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-view-11"]');
    ...    if (el && !el.checked) el.click();

Click ceramic mug
    Shadow root ceramic mug
   