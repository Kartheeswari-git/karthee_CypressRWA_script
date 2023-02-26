*** Settings ***
Library     Selenium2Library


*** Variables ***


*** Keywords ***
Bank_account_validation
    [Arguments]     ${locator}      ${input}    ${msg}
    input text        ${locator}      ${input}
    press keys      ${locator}      CTRL+A+BACKSPACE
    click element       ${bankaccount}[create_bank_ac]
    page should contain      ${msg}
    element should be disabled          ${bankaccount}[save]
Bank_account_validation1
    [Arguments]     ${locator}      ${input}    ${msg}
    input text        ${locator}      ${input}
    click element       ${bankaccount}[create_bank_ac]
    page should contain      ${msg}
    element should be disabled          ${bankaccount}[save]

Create_Bank_account
    [Arguments]     ${data}
    wait until page contains element        ${bankaccount}[bankname]     timeout=30s
    input text        ${bankaccount}[bankname]     ${data}
    input text        ${bankaccount}[routing_num]     ${bankTransfer_data}[bankname_xpected]
    input text        ${bankaccount}[ac_num]     ${bankTransfer_data}[routing_number_xpected]
    click element       ${bankaccount}[save]

create_bank_ac_page_validation
    click element       ${side_icons}[bank_ac]
    wait until page contains element       ${bankaccount}[create]        timeout=30s
    click element       ${bankaccount}[create]
    page should contain     Create Bank Account

Delete_bank_ac
    click element           ${bankaccount}[delete]
    page should contain     (Deleted)