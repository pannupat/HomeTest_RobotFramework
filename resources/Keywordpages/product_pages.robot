***Settings***
Library    SeleniumLibrary
Resource   ../locators/product_locators.robot
Resource    checkout_pages.robot

***Keywords***
Shadow root ceramic mug
    Shadow root apply coupon
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-view-11"]');
    ...    if (el && !el.checked) el.click();

Click ceramic mug
    Shadow root ceramic mug
   