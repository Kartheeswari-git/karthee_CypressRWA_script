*** Settings ***
Library     Selenium2Library


*** Variables ***


*** Keywords ***


Transaction_fieldvalidation
    click element       ${Transaction}[new_transact]
    search_for_contact      ${signup_data}[firstName2]
    validate_error_msg

Create_new_transaction
    input_to_transaction_page
    click element       ${Transaction}[pay]
    page should contain     Paid $2,000.00 for ${bank_transaction}[note]
    page should contain element     ${Transaction}[return_to_transactions]
    page should contain element     ${Transaction}[create_another_transaction]
create_another_transaction_as_a_request
    wait until page contains element        ${Transaction}[create_another_transaction]
    click element       ${Transaction}[create_another_transaction]
    search_for_contact      ${bankTransfer_data}[contact1]
    input_to_transaction_page
    click element       ${Transaction}[request]
    page should contain     Requested $2,000.00 for ${bank_transaction}[note]
    page should contain element     ${Transaction}[return_to_transactions]
    page should contain element     ${Transaction}[create_another_transaction]

return_to_transactions
    click element           ${Transaction}[return_to_transactions]
    wait until page contains element            ${Transaction}[amount_filter]       timeout=30s
    page should contain element         ${Transaction}[date_filter]

input_to_transaction_page
    wait until page contains element        ${Transaction}[amount]        timeout=40s
    input text      ${Transaction}[amount]      ${bankTransfer_data}[amount]
    input text      ${Transaction}[note]        ${bank_transaction}[note]
    wait until element is enabled           ${Transaction}[request]
    wait until element is enabled           ${Transaction}[pay]

search_for_contact
    [Arguments]         ${contact}
    wait until page contains element        ${Transaction}[search_transaction]      timeout=40s
    input text      ${Transaction}[search_transaction]              ${contact}
    click element       ${Transaction}[first_result]
validate_error_msg
    click element       ${Transaction}[note]
    page should contain     ${bank_transaction}[amount_invalid_input_msg]
    click element       ${Transaction}[amount]
    page should contain     ${bank_transaction}[note_invalid_input_msg]
    element should be disabled      ${Transaction}[request]
    element should be disabled      ${Transaction}[pay]

verify_the_paid_transaction
    sleep       2s
    click element       ${Transaction}[record2]
    wait until page contains        Transaction Detail      timeout=45s
#    page should contain      paid Arely Kertzmann
    page should contain     $2,000.00
#    page should contain element     //*[@data-test="sidenav-user-balance" and text()="$1,118.05"]

send_comment
    press keys      //input[contains(@data-test,"transaction-comment")]     Thanks for sending+ENTER
    wait until page contains element        //*[@data-test="comments-list"]//li//div//span[text()="Thanks for sending"]
    page should contain element     //*[@data-test="comments-list"]//li//div//span[text()="Thanks for sending"]

Hit_like
    click element   //*[contains(@data-test,"transaction-like-button")]
    ${like_count}=      get text        //div[contains(@data-test,"transaction-like-count")]
    should be equal     ${like_count}       1

verify_the_requested_transaction
    click element       ${Transaction}[record1]
    wait until page contains        Transaction Detail      timeout=45s
#    page should contain     requested Edgar Johns
    page should contain     $2,000.00
#    page should contain element     //*[@data-test="sidenav-user-balance" and text()="$1,118.05"]

accept_payment
    page should contain element     ${Transaction}[accept_payment]
    click element       ${Transaction}[accept_payment]


navigate_to_transaction
    click element       ${Transaction}[new_transaction_button]
Search_contacts
    [Arguments]     ${input_Data}
    input text      ${Transaction}[search_transaction]      ${input_Data}
    sleep       2s
    page should contain element     //*[@data-test="users-list"]//li[1]//span[contains(text(),'${input_Data}')]
    press keys      ${Transaction}[search_transaction]      CTRL+A+BACKSPACE


