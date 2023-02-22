*** Settings ***
Library     Selenium2Library
Resource    ../Resouces/Signup_Signin_kw.robot
Variables   ../PageObject/Variable.py
Variables   ../PageObject/Data.py
*** Variables ***



*** Keywords ***

*** Test Cases ***
Signup-001:
TC-001:SigninPage UI Validation
    [Tags]  Validating page text and elements in signin page
    Signin_UI_Validation

TC-002:SigninPage UI Validation
    [Tags]  w/o username and password
    w/o_un_pwd

TC-003:SigninPage UI Validation
    [Tags]  Invalid Credentials validation
    Signin_FieldLevel_Validation        ${Signin_data}[invalid_un]   ${Signin_data}[invalid_pwd]
    sleep       5s
    page should contain      Username or password is invalid
    Signin_FieldLevel_Validation       ${Signin_data}[valid_un]   ${Signin_data}[invalid_pwd]
    sleep       5s
    page should contain      Username or password is invalid

TC-004:SigninPage UI Validation
    [Tags]  Valid Credentials validation
    Signin_FieldLevel_Validation      ${Signin_data}[valid_un]   ${Signin_data}[valid_pwd]
    verify_signin
TC-005:SigninPage UI Validation
    [Tags]  Valid Credentials validation
    Signin_FieldLevel_Validation_r      ${Signin_data}[valid_un]   ${Signin_data}[valid_pwd]
    verify_signin
