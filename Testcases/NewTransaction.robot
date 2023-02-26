*** Settings ***
Library     Selenium2Library
Resource    ../Resouces/Signup_Signin_kw.robot
Resource    ../Resouces/bankaccounts_resources.robot
Resource    ../Resouces/Transaction_keywords.robot
Variables   ../PageObject/Variable.py
Variables   ../PageObject/Data.py
Suite Setup     Hit_url     ${Signin_data}[signin_url]
*** Variables ***



*** Keywords ***

*** Test Cases ***
BA-001:Transaction_fieldValidation_bankname
    [Tags]      BA-001:Transaction_fieldValidation_bankname
    Signin    ${signup_data}[uname]   ${signup_data}[pwd]
    Transaction_fieldvalidation

BA-002:Create_new_payment_transaction
    [Tags]      BA-002:Create_new_payment_transaction
    Create_new_transaction

BA-003:Create_new_payment_request
    [Tags]      BA-003:Create_new_payment_request
    create_another_transaction_as_a_request

BA-004:Validate_return_to_transactions_button
    [Tags]      BA-004:Bank_account_fieldValidation_bankname
    return_to_transactions
    close browser

BA-005:Verify_the_Paid_transaction
    [Tags]      BA-005:Verify_the_paid_transaction
    Hit_url     ${Signin_data}[signin_url]
    Signin    ${bankTransfer_data}[contact1_un]   ${signup_data}[pwd]
    verify_the_paid_transaction
    close browser

BA-006:Verify_the_Requested_transaction
    [Tags]      BA-006:Verify_the_Requested_transaction
    Hit_url     ${Signin_data}[signin_url]
    Signin    ${bankTransfer_data}[contact2_un]   ${signup_data}[pwd]
    verify_the_requested_transaction
    accept_payment

BA-007:Search_contacts_by_attributes
    [Tags]      BA-007:Search_contacts_by_attributes
    Hit_url     ${Signin_data}[signin_url]
    Signin    ${bankTransfer_data}[contact1_un]   ${signup_data}[pwd]
    navigate_to_transaction
    Search_contacts     ${bank_transaction}[Fname]
    Search_contacts     ${bank_transaction}[Lname]
    Search_contacts     ${bank_transaction}[email]
    Search_contacts     ${bank_transaction}[phone_num]
    Search_contacts     ${bankTransfer_data}[contact2_un]
    close browser