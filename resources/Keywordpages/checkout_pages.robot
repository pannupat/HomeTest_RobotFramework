***Settings***
Library    SeleniumLibrary
Resource   ../locators/checkout_locators.robot

***Keywords***

Shadow root first name
    [Arguments]    ${firstname}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-first-name"]');
    ...      el.value = "${firstname}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
    ...    
Shadow root last name
    [Arguments]    ${lastname}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-last-name"]');
    ...      el.value = "${lastname}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
    ...    
Shadow root address details
    [Arguments]    ${addressdetail}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-detail"]');
    ...      el.value = "${addressdetail}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
    ...   

Shadow root select province
    [Arguments]    ${province}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-province"]'); 
    ...       if (el) {
    ...    el.value = "${province}";
    ...    el.dispatchEvent(new Event('change', { bubbles: true }));
    ...    
    ...    } else {
    ...    throw new Error("Province input not found!");
    ...  
    ...    }
    ...    
Shadow root select district
    [Arguments]    ${district}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-district"]'); 
    ...       if (el) {
    ...    el.value = "${district}";
    ...    el.dispatchEvent(new Event('change', { bubbles: true }));
    ...    
    ...    } else {
    ...    throw new Error("District input not found!");
    ...  
    ...    }
    ...    

Shadow root select subdistrict
    [Arguments]    ${subdistrict}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-subdistrict"]'); 
    ...       if (el) {
    ...    el.value = "${subdistrict}";
    ...    el.dispatchEvent(new Event('change', { bubbles: true }));
    ...    
    ...    } else {
    ...    throw new Error("SubDistrict input not found!");
    ...  
    ...    }
    ...    
Shadow root postcode
    [Arguments]    ${postalcode}
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-form-postal"]');
    ...      el.value = "${postalcode}";
    ...      el.dispatchEvent(new Event('input', { bubbles: true }));
    ... 
Shadow root set as default
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('input[data-testid="checkout-form-default"]');
    ...    if (el && !el.checked) el.click();

Shadow root save address
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-save-address"]');
    ...    if (el && !el.checked) el.click();
    ...    


Shadow root click payment
    [Arguments]    ${PAYMENT}
    ${js}=    Catenate
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector(`[data-testid="checkout-pay-${PAYMENT}"]`);
    ...    if (el) el.click(); else throw new Error("Payment Radio not found!");
    Execute JavaScript    ${js}



Shadow root coupon
    Execute JavaScript
    ...    const btn = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-coupon-toggle"]');
    ...    if (btn) {
    ...      btn.dispatchEvent(new MouseEvent('click', { bubbles: true }));
    ...    } else {
    ...      throw new Error("Coupon dropdown button not found!");
    ...    }

Select coupon name
    Execute JavaScript
    ...    const btn = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('[data-testid="checkout-coupon-item-General12345"]');
    ...    if (btn) {
    ...      btn.dispatchEvent(new MouseEvent('click', { bubbles: true }));
    ...    } else {
    ...      throw new Error("Coupon dropdown button not found!");
    ...    }

Shadow root apply coupon
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-apply-coupon"]');
    ...    if (el && !el.checked) el.click();
    ...    
Shadow root place order
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-place-order"]');
    ...    if (el && !el.checked) el.click();
    ...    


Assertion
    ${subtotal_text}=    Execute JavaScript    return document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#checkout-root [data-testid="checkout-subtotal"]')?.innerText || '0';
    ${shipping_text}=    Execute JavaScript    return document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#checkout-root [data-testid="checkout-shipping"]')?.innerText || '0';
    ${discount_text}=    Execute JavaScript    return document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#checkout-root [data-testid="checkout-discount"]')?.innerText || '0';
    ${vat_text}=         Execute JavaScript    return document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#checkout-root [data-testid="checkout-vat"]')?.innerText || '0';
    ${total_text}=       Execute JavaScript    return document.querySelector('[data-testid="shadow-host"]').shadowRoot.querySelector('#checkout-root [data-testid="checkout-total"]')?.innerText || '0';

    ${subtotal}=    Evaluate    float(re.sub(r'[^0-9.]', '', '''${subtotal_text}'''))
    ${shipping}=    Evaluate    float(re.sub(r'[^0-9.]', '', '''${shipping_text}'''))
    ${discount}=    Evaluate    float(re.sub(r'[^0-9.-]', '', '''${discount_text}''')) if '${discount_text}'!='0' else 0
    ${vat}=         Evaluate    float(re.sub(r'[^0-9.]', '', '''${vat_text}'''))
    ${total}=       Evaluate    float(re.sub(r'[^0-9.]', '', '''${total_text}'''))

    ${expected}=    Evaluate    round(${subtotal} - ${discount} + ${shipping} + ${vat}, 2)
    Log To Console    Subtotal=${subtotal}, Shipping=${shipping}, VAT=${vat}, Discount=${discount}, Total=${total}, Expected=${expected}
    Should Be Equal As Numbers    ${total}    ${expected}


Shadow root paid qr
    Execute JavaScript
    ...    const el = document.querySelector('[data-testid="shadow-host"]')
    ...      .shadowRoot.querySelector('button[id="btn-confirm-qr"]');
    ...    if (el && !el.checked) el.click();

First name
    [Arguments]    ${FIRSTNAME}
    Shadow root first name    ${FIRSTNAME}

Last name
    [Arguments]    ${LASTNAME}
    Shadow root last name    ${LASTNAME}

Address detail
    [Arguments]    ${ADDRESSDETAIL}
    Shadow root address details    ${ADDRESSDETAIL}

Select province
    [Arguments]    ${PROVINCE}
    Shadow root select province    ${PROVINCE}

Select district
    [Arguments]    ${DISTRICT}
    Shadow root select district    ${DISTRICT}

Select subdistrict
    [Arguments]    ${SUBDISTRICT}
    Shadow root select subdistrict    ${SUBDISTRICT}

Postcode
    [Arguments]    ${POSTALCODE}
    Shadow root postcode    ${POSTALCODE}

Set as default
    Shadow root set as default

Save address
    Shadow root save address

Payment
    [Arguments]    ${PAYMENT}
    Wait Until Keyword Succeeds    10x    0.5s    Shadow root click payment    ${PAYMENT}

Coupon
    Shadow root coupon


Apply coupon
    Shadow root apply coupon


Select coupon
    Select coupon name
   

Place order
    Shadow root place order

Paid confirm
    Shadow root paid qr




