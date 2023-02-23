*** Settings ***
Library     Selenium2Library


*** Variables ***


*** Keywords ***
Signup_fieldLevel_Validation_empty
    [Arguments]      ${input_locator}     ${input_data}     ${msg}
    wait until page contains element        ${input_locator}        timeout=30s
    input text    ${input_locator}         ${input_data}
    sleep   2s
    press keys      ${input_locator}        CTRL+A+BACKSPACE
    click element       //*[@fill-rule="evenodd"]
    page should contain     ${msg}
    element should be disabled     ${Signup}[signup_btn]

Hit_url
    [Arguments]      ${url}
    open browser        ${url}      headlesschrome
    set selenium implicit wait  15s
    set window size    1920    1080

Signup_fieldLevel_Validation
    [Arguments]      ${input_locator}     ${input_data}     ${msg}
    input text    ${input_locator}        ${input_data}
    click element       //*[@fill-rule="evenodd"]
    page should contain     ${msg}
    element should be disabled     ${Signup}[signup_btn]

SignupValidation
    input text    ${Signup}[fname]      ${signup_data}[firstName]
    input text      ${Signup}[lname]        ${signup_data}[lastName1]
    input text      ${Signup}[uname]        ${signup_data}[firstName]
    input password      ${Signup}[pwd]      ${signup_data}[password]
    input password      ${Signup}[confirm_pwd]      ${signup_data}[password]
    click element       ${Signup}[signup_btn]
Signin_UI_Validation
    sleep       5s
    wait until page contains element        ${signin}[signin_title]      timeout=60s
    title should be     Cypress Real World App
    page should contain element     ${signin}[signin_title]
    page should contain element     ${Signup}[uname]
    page should contain element     ${Signup}[pwd]
    page should contain element     //*[@data-test="signin-remember-me"]/following::span[text()="Remember me"]
    page should contain element     ${Signup}[signup_btn]
    page should contain element     ${Signup}[signin_btn]
    page should contain element     ${signin}[signup_txt]
    page should contain element     ${signin}[cypress_logo]

w/o_un_pwd
   click element    ${signin}[signin_btn]
   page should contain element      //*[@data-test="signin-username"]//p[text()="Username is required"]

Signin
    [Arguments]     ${uname}        ${pwd}
   input text        //*[@id="username"]      ${uname}
   input password       //*[@id="password"]       ${pwd}
   click element     //*[@data-test="signin-submit"]

Signin_FieldLevel_Validation_r
    [Arguments]     ${uname}        ${pwd}
   input text        //*[@id="username"]      ${uname}
   input password       //*[@id="password"]       ${pwd}
   click element        //*[@data-test="signin-remember-me"]//span//input[@name="remember"]
   click element     //*[@data-test="signin-submit"]

verify_signin
    page should contain element     //*[@role="dialog"]
    page should contain     Get Started with Real World App
    page should contain     Real World App requires a Bank Account to perform transactions.
    click element       //*[@data-test="user-onboarding-next"]


