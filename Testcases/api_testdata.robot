*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Variables   ../PageObject/Data.py
Resource   ../Resouces/API_resources.robot

*** Variables ***

*** Test Cases ***
TD-001: Get_remote_mock_data_for_users
    [Tags]      TD-001: Gets remote mock data for users
    login_api
    get_mockdata        users

TD-002: Get_remote_mock_data_for_contacts
    [Tags]      TD-002: Gets remote mock data for contacts
    get_mockdata        contacts

TC-003: Get_remote_mock_data_for_bankaccounts
    [Tags]      TD-003: Gets remote mock data for bankaccounts
    get_mockdata        bankaccounts

TC-004: Get_remote_mock_data_for_notifications
    [Tags]      TD-004: Gets remote mock data for notifications
    get_mockdata        notifications

TC-005: Get_remote_mock_data_for_transactions
    [Tags]      TD-005: Gets remote mock data for transactions
    get_mockdata        transactions

TC-006: Get_remote_mock_data_for_likes
    [Tags]      TD-006: Gets remote mock data for likes
    get_mockdata        likes

TC-007: Get_remote_mock_data_for_comments
    [Tags]      TD-007: Gets remote mock data for comments
    get_mockdata        comments

TC-008: Get_remote_mock_data_for_banktransfers
    [Tags]      TD-008: Gets remote mock data for banktransfers
    get_mockdata        banktransfers
