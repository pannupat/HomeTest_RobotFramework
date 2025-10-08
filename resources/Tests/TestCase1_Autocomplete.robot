*** Settings ***
Library    SeleniumLibrary
Resource   ../keywordpages/login_pages.robot
Resource   ../keywordpages/home_pages.robot
Resource   ../keywordpages/product_detail_pages.robot
Resource   ../keywordpages/cart_pages.robot
Resource   ../keywordpages/checkout_pages.robot
Resource   ../../variables.robot
    
*** Test Cases ***
Test Case 1 Autocomplete
    Open Browser               ${WEB_URL}    #เปิดเว็บไซต์
    Set Selenium Timeout       ${TIMEOUT}
# Go to Login
    Account button                           #คลิกปุ่ม Account
    Nav account link                         #คลิก Element ไปที่หน้า Login
# Login
    Input_email_fill                      ${TEST_EMAIL}
    Input_password_fill                   ${TEST_PASSWORD}
    Sleep                        1
    Cick_remember_checkbox
    Cick_button_submit_login
    Sleep                        1
# SearchProduct
    Search_on_product_fill       mug
    Sleep                        1
    Wait_autocomplete_and_click
# AddProductToCart
    Select_product_color        Gray
    Input_product_quantity       3
    Click_add_to_cart_button
# Go to Cart
    Click_cart_icon
    Sleep                       1
# Go to Checkout 
    Click_select_all_checkbox
    Click_proceed_to_checkout_button

# Set Address
    CLick_add_new_address_button
    Input_first_name_fill        Morty
    Input_last_name_fill                    Smith
    Input_address_detail_fill               123 Khonkean University 
    Sleep                        1
    Select_province              Bangkok
    Sleep                        1
    Select_district              Phra Nakhon
    Sleep                        1
    Select_subdistrict           Bang Khun Phrom
    Sleep                        1
    Input_postcode_fill          10200
    Sleep                        1
    Click_set_as_default_checkbox
    Click_save_address_button
# Payment Method
    Input_to_select_radio_payment         qr
# Coupon
    Click_select_coupon_button    
    Sleep                        1
    Click_select_coupon_button
    Click_apply_coupon_button
    Sleep                        1
# Assertions
    Assertion

# PlaceOrder
    Click_place_order_button
    Sleep                        1

# Paid Confirm
    Click_paid_confirm_button
    Sleep                        1     
    Close Browser


