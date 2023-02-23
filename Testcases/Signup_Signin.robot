*** Settings ***
Library     Selenium2Library
Resource    ../Resouces/Signup_Signin_kw.robot
Variables   ../PageObject/Variable.py
Variables   ../PageObject/Data.py
*** Variables ***



*** Keywords ***

*** Test Cases ***
Signup-001:SignupValidation
    [Tags]      Signup-001:SignupValidation
    Hit_url     ${Signin_data}[signup]
    Signup_fieldLevel_Validation_empty        ${Signup}[fname]     ${signup_data}[firstName]      ${Validation_msg}[fname_empty]
    Signup_fieldLevel_Validation_empty        ${Signup}[lname]     ${signup_data}[lastName]      ${Validation_msg}[lname_empty]
    Signup_fieldLevel_Validation_empty        ${Signup}[uname]     ${signup_data}[username]      ${Validation_msg}[uname_empty]
    Signup_fieldLevel_Validation_empty        ${Signup}[pwd]     ${signup_data}[password]      ${Validation_msg}[pwd_empty]
    Signup_fieldLevel_Validation_empty        ${Signup}[confirm_pwd]     ${signup_data}[password]      ${Validation_msg}[confirm_pwd_empty]
    Signup_fieldLevel_Validation        ${Signup}[pwd]     ${signup_data}[invalid_pwd]      ${Validation_msg}[pwd_invalid_msg]
    Signup_fieldLevel_Validation        ${Signup}[confirm_pwd]     ${signup_data}[password]      ${Validation_msg}[confirm_pwd_wrong]
    close browser
Signup-002:CreateValidNewUSer
    [Tags]      Signup-002:CreateValidNewUSer
    Hit_url     ${Signin_data}[signup]
    SignupValidation
    close browser
Signin-001:SigninPage UI Validation
    [Tags]  Signin-001:Validating page text and elements in signin page
    Hit_url     ${Signin_data}[signin_url]
    Signin_UI_Validation

Signin-002:SigninPage Fieldlevel Validation
    [Tags]  Signin-002:SigninPage Fieldlevel validation
    w/o_un_pwd

Signin-003:SigninPage Credential Validation
    [Tags]  Signin-003:Invalid Credentials validation
    Signin        ${Signin_data}[invalid_un]   ${Signin_data}[invalid_pwd]
    sleep       5s
    page should contain      Username or password is invalid
    Signin       ${Signin_data}[valid_un]   ${Signin_data}[invalid_pwd]
    sleep       5s
    page should contain      Username or password is invalid

Signin-004:SigninPage Validation
    [Tags]  Signin-004:Valid Credentials validation
    Signin    ${signup_data}[firstName]   ${signup_data}[password]
    verify_signin
    close browser
