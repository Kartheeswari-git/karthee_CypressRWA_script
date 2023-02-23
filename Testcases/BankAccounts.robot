*** Settings ***
Library     Selenium2Library
Resource    ../Resouces/Signup_Signin_kw.robot
Resource    ../Resouces/bankaccounts_resources.robot

Variables   ../PageObject/Variable.py
Variables   ../PageObject/Data.py
Suite Setup     Hit_url     ${Signin_data}[signin_url]
*** Variables ***



*** Keywords ***

*** Test Cases ***
BA-001:Bank_account_fieldValidation_bankname
    [Tags]      BA-001:Bank_account_fieldValidation_bankname
    Signin    ${signup_data}[firstName]   ${signup_data}[password]
    create_bank_ac_page_validation
    Bank_account_validation     ${bankaccount}[bankname]    ${bankTransfer_data}[bankname_xpected]      ${Validation_msg}[bank_name_empty]
    Bank_account_validation1     ${bankaccount}[bankname]    ${signup_data}[lastName]     ${Validation_msg}[bank_invalid]

BA-002:Bank_account_fieldValidation_RoutingNumber
    [Tags]      BA-002:Bank_account_fieldValidation_RoutingNumber
    Bank_account_validation     ${bankaccount}[routing_num]    ${bankTransfer_data}[bankname_xpected]      ${Validation_msg}[routing_num_empty]
    Bank_account_validation1     ${bankaccount}[routing_num]    ${signup_data}[lastName]     ${Validation_msg}[routing_num_invalid]

BA-003:Bank_account_fieldValidation_AccountNumber
    [Tags]      BA-003:Bank_account_fieldValidation_AccountNumber
    Bank_account_validation     ${bankaccount}[ac_num]    ${bankTransfer_data}[bankname_xpected]      ${Validation_msg}[acnum_name_empty]
    Bank_account_validation1     ${bankaccount}[ac_num]    ${signup_data}[lastName]      ${Validation_msg}[acnum_invalid]

BA-004:Create_new_Bank_account
    [Tags]      BA-004:Create_new_Bank_account
    reload page
    Create_Bank_account     ${bankTransfer_data}[bankname1]

BA-005:Delete_bank_account
    [Tags]      BA-005:Delete_bank_account
    Delete_bank_ac