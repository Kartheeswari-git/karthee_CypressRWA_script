*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Variables   ../PageObject/Data.py
Resource   ../Resouces/API_resources.robot

*** Variables ***


*** Test Cases ***
BT-001: Signup_RWA
    [Tags]      BT-001: Create new user
    Signup_api

BT-002: Create_Bank_account
    [Tags]     BT-002: Create_Bank_account
    login_api
    create_bank_a/c

BT-003: Get_Bank_account_details
    [Tags]     BT-003: Get_Bank_account_details
    get_all_bank_a/cs

BT-004: Delete_Bank_account
    [Tags]     BT-004: Delete_Bank_account
    delete_bank_a/c

BT-005: Create_Bank_account_graphql
    [Tags]       BT-005: Create_Bank_account_graphql
    login_api
    create_bank_a/c_graphql

BT-006: Get_Bank_account_graphql
    [Tags]       BT-006: Get_Bank_account_graphql
    get_all_bank_a/cs_graphql

BT-007: CreateBankTransfer
    [Tags]      BT-007: Create a new bank transfer
    login_api
    create_banktransfer
BT-008: GetTransferAPI
    [Tags]      BT-008: Gets a list of bank transfers for user
    get_bankTransfer

BT-009: Post_Comments
    [Tags]      BT-009: Posting comments to the bank transfer
    post_comments

BT-010: Get_Comments
    [Tags]      BT-010: Getting comments from the bank transfer
    get_comments
BT-011: Post_Likes
    [Tags]      BT-011: Posting likes to the bank transfer
    post_Likes

BT-012: Get_Likes
    [Tags]    BT-012: Getting likes from the bank transfer
    Get_Likes

BT-013: get_notifications
    [Tags]     BT-013: get_notifications
    get_notifications


