*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Variables   ../PageObject/Data.py
Resource   ../Resouces/API_resources.robot

*** Variables ***


*** Test Cases ***
TR-001: Get_transactions_for_user
    [Tags]      TR-001: Gets a list of transactions for user
    login_api
    get_transactions

TR-002: Get_pending_request_transactions_for_user
    [Tags]      TR-002: Gets a list of pending request transactions for user
    get_pending_transactions

TR-003: Get_pending_request_transactions_for_a_time_range
    [Tags]     TR-003: Gets a list of pending request transactions for user between a time range
    get_pending_transactions_on_daterange

TR-004: Get_transactions_for_contacts_in_page_one
    [Tags]      TR-004: Gets a list of transactions for users list of contacts, page one
    get_contacts_data

TR-005: Get_transactions_for_contacts_in_page_two
    [Tags]      TR-005: Gets a list of transactions for users list of contacts, page two
    get_contacts_data_from_page2

TR-006: Get_public_transactions
    [Tags]      TR-006: Gets a list of public transactions
    get_public_transactions