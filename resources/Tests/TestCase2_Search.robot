*** Settings ***
Library    SeleniumLibrary
Resource   ../keywordpages/login_pages.robot
Resource   ../keywordpages/home_pages.robot
Resource   ../keywordpages/product_detail_pages.robot
Resource   ../keywordpages/cart_pages.robot
Resource   ../keywordpages/checkout_pages.robot
Resource   ../keywordpages/product_pages.robot
Resource   ../../variables.robot
    
*** Test Cases ***
Test Case 1_Autocomplete
    Open Browser               ${WEB_URL}    #เปิดเว็บไซต์
    Set Selenium Timeout       ${TIMEOUT}
# Go to Login
    Account button                           #คลิกปุ่ม Account
    Nav account link                         #คลิก Element ไปที่หน้า Login
# Login
    Email                      ${TEST_EMAIL}
    Password                   ${TEST_PASSWORD}
    Sleep                        1
    Remember
    Submit login
    Sleep                        1
# SearchProduct
    SearchProduct               Ceramic Mug
    Sleep                       1
    SearchButton
    Sleep                       1
    ClickCeramicMug
# AddProductToCart
    Select product color        Gray
    Shadow root input qty       3
    Add to cart button
# Go to Cart
    Cart
    Sleep                       1
# Go to Checkout 
    Select all in cart
    Proceed to checkout
# Set Address
    Add new address
    First name                   Morty
    Last name                    Smith
    Address detail               123 Khonkean University 
    Sleep                        1
    Select province              Bangkok
    Sleep                        1
    Select district              Phra Nakhon
    Sleep                        1
    Select subdistrict           Bang Khun Phrom
    Sleep                        1
    Postcode                     10200
    Sleep                        1
    Set as default
    Save address
# Payment Method
    Payment                      qr
# Coupon
    Coupon    
    Sleep                        1
    Select coupon
    Apply coupon
    Sleep                        1
# Assertions
    Assertion

# PlaceOrder
    Place order
    Sleep                        1

# Paid Confirm
    Paid confirm
    Sleep                        1   
    Close Browser

