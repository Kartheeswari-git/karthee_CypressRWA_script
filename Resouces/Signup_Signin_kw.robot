*** Settings ***
Library     Selenium2Library


*** Variables ***


*** Keywords ***
Signin_UI_Validation
    open browser        http://localhost:3000/      chrome
    sleep       5s
    wait until page contains element        //h1[text()="Sign in"]      timeout=60s
    title should be     Cypress Real World App
    page should contain element     //h1[text()="Sign in"]
    page should contain element     //*[@id="username"]
    page should contain element     //*[@id="password"]
    page should contain element     //*[@data-test="signin-remember-me"]/following::span[text()="Remember me"]
    page should contain element      //*[@data-test="signin-submit"]
    page should contain element     //*[@data-test="signup"]
    page should contain element     //*[text()="Don't have an account? Sign Up"]
    page should contain element     //*[@href="https://cypress.io"]

w/o_un_pwd
   click element    //*[@data-test="signin-submit"]
   page should contain element      //*[@data-test="signin-username"]//p[text()="Username is required"]

Signin_FieldLevel_Validation
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

Signup
