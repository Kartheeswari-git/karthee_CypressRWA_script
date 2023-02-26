*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Variables   ../PageObject/Data.py
Resource   ../Resources/API_resources.robot

*** Test Cases ***
AU-001: Get_Users_List
    [Tags]      AU-001: Gets a list of users
    login_api1
    get_all_users

AU_002: Error on invalid user
    [Tags]      AU-002: Error on invalid user
    get_invalid_user

AU-003: Get_a_user_details
    [Tags]      AU-003: Get a user details
    get_a_user

AU-004: Get_user_profile_by_username
    [Tags]  AU-004: Get user profile by username
    get_profile_by_username

AU-005: Get_user_profile_by_email
    [Tags]  AU-005: Get user profile by email
    get_user_upon_search_params     Aniya_Powlowski36%40hotmail.com

AU-006: Get_user_profile_by_phone_num
    [Tags]  AU-006: Get user profile by phone_num
    get_user_upon_search_params     537-041-4355

AU-007: Get_users_profile_by_username
    [Tags]  AU-007: Get users profile by username
    get_user_upon_search_params     Tavares_Barrows




