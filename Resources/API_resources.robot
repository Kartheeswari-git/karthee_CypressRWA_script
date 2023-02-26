*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Variables   ../PageObject/Data.py


*** Variables ***
${random_num}=      Generate random string      9       [NUMBERS]

*** Keywords ***
Signup_api
    ${body}     Create Dictionary          username=${signup_data}[username]       password=${signup_data}[password]       confirmPassword=${signup_data}[password]         firstName=${signup_data}[firstName]     lastName=${signup_data}[lastName]
    Create session     session1      ${Signin_data}[base_url]      verify=true
    ${signup}=      post on session     session1       users       data=${body}

login_api
    ${body}     Create Dictionary          username=${signup_data}[username]         password=${signup_data}[password]       type=LOGIN
    Create session     session2      ${Signin_data}[base_url]      verify=true
    ${header}       Create dictionary           Content-Type=application/json;charset=utf-8
    ${loginresponse}=         post on session           session2             login                  data=${body}
    log to console      ${loginresponse}

login_api1
    ${body}     Create Dictionary          username=${signup_data}[uname]         password=${signup_data}[pwd]       type=LOGIN
    Create session     session2      ${Signin_data}[base_url]      verify=true
    ${header}       Create dictionary           Content-Type=application/json;charset=utf-8
    ${loginresponse}=         post on session           session2             login                  data=${body}
    log to console      ${loginresponse}

get_all_bank_a/cs
    ${get_all}=     get on session      session2       bankAccounts
    Set Global Variable     ${get_all}
    ${bank_name}=       set Variable        ${get_all.json()['results'][0]['bankName']}
    Should be equal         ${bank_name}        ${bankTransfer_data}[bankname_xpected]
    ${account_number}=       set Variable        ${get_all.json()['results'][0]['accountNumber']}
    Should be equal         ${account_number}        ${random_num}
    ${routing_number}=       set Variable        ${get_all.json()['results'][0]['routingNumber']}
    Should be equal         ${routing_number}        ${bankTransfer_data}[routing_number_xpected]

create_bank_a/c
    ${bank_details}=        create dictionary       accountNumber=${random_num}         bankName=${bankTransfer_data}[bankname_xpected]        routingNumber=${bankTransfer_data}[routing_number_xpected]     userId=mGYhLxOKD
    ${create_back_ac}=      post on session           session2       bankAccounts      data=${bank_details}

delete_bank_a/c
    ${total}=       Get Length          ${get_all.json()['results']}
    FOR        ${i}     IN RANGE    0   ${total}
        IF   "${get_all.json()['results'][${i}]['accountNumber']}"=="${random_num}"
            ${to_be_deleted_id}=     set variable   ${get_all.json()['results'][${i}]['id']}
            Set Global Variable      ${to_be_deleted_id}
            BREAK
        ELSE
            CONTINUE
        END
    END
    ${get_all}=     delete on session      session2       bankAccounts/${to_be_deleted_id}
    ${get_all}=     get on session      session2       bankAccounts
    ${total}=       Get Length          ${get_all.json()['results']}
    FOR        ${i}     IN RANGE    0   ${total}
        IF   "${get_all.json()['results'][${i}]['id']}"=="${to_be_deleted_id}"
            Evaluate    "${get_all.json()['results'][${i}]['isDeleted']}"=="True"
            BREAK
        ELSE
            CONTINUE
        END
    END


get_all_bank_a/cs_graphql
        ${body}     Create Dictionary          query=${Signin_data}[get_data]
    ${get_all}=     post on session      session2       graphql     data=${body}
    Set Global Variable     ${get_all}
    ${bank_name}=       set Variable        ${get_all.json()['data']['listBankAccount'][0]['bankName']}
    Should be equal         ${bank_name}        ${bankTransfer_data}[bankname_xpected]
    ${account_number}=       set Variable        ${get_all.json()['data']['listBankAccount'][0]['accountNumber']}
    Should be equal         ${account_number}        ${random_num}
    ${routing_number}=       set Variable        ${get_all.json()['data']['listBankAccount'][0]['routingNumber']}
    Should be equal         ${routing_number}        ${bankTransfer_data}[routing_number_xpected]

create_bank_a/c_graphql
    ${bank_details}=        create dictionary       accountNumber=${random_num}         bankName=${bankTransfer_data}[bankname_xpected]        routingNumber=${bankTransfer_data}[routing_number_xpected]     query=${Signin_data}[get_data]
    ${create_back_ac}=      post on session           session2      graphql      data=${bank_details}

delete_bank_a/c_graphql
    ${total}=       Get Length          ${get_all.json()['data']['listBankAccount']}
    FOR        ${i}     IN RANGE    0   ${total}
        IF   "${get_all.json()['data']['listBankAccount'][${i}]['accountNumber']}"=="${random_num}"
            ${to_be_deleted_id}=     set variable   ${get_all.json()['data']['listBankAccount'][${i}]}
            Set Global Variable      ${to_be_deleted_id}
            BREAK
        ELSE
            CONTINUE
        END
    END

    ${del_param}=       Create dictionary         ID=${to_be_deleted_id}[id]       query=${Signin_data}[del_ac]
    ${del_ac}=     post on session      session2       graphql      data=${del_param}
    ${body}     Create Dictionary          query=${Signin_data}[get_data]
    ${get_all1}=     post on session      session2       graphql     data=${body}
    ${total}=       Get Length          ${get_all1.json()['data']['listBankAccount']}
    FOR        ${i}     IN RANGE    0   ${total}
        IF   "${get_all1.json()['data']['listBankAccount'][${i}]['id']}"=="${to_be_deleted_id}"
            Evaluate    "${get_all1.json()['data']['listBankAccount'][${i}]['isDeleted']}"=="True"
            BREAK
        ELSE
            CONTINUE
        END
    END

create_banktransfer
    ${data}=        Create dictionary       amount=${bankTransfer_data}[amount]     description=${bankTransfer_data}[description]      receiverId=${bankTransfer_data}[receiverId]        senderId=${bankTransfer_data}[senderId]     transactionType=${bankTransfer_data}[transactionType]
    ${create_bank_transfer}=        post on session      session2      transactions        data=${data}

    ${bank_transfer_id}=    set variable    ${create_bank_transfer.json()['transaction']['id']}
    Set Global Variable     ${bank_transfer_id}
    Evaluate        "${create_bank_transfer.json()['transaction']['status']}"=="${bankTransfer_data}[status]"
    Evaluate        "${create_bank_transfer.json()['transaction']['amount']}"=="${bankTransfer_data}[amount]"
    Evaluate        "${create_bank_transfer.json()['transaction']['description']}"=="${bankTransfer_data}[description]"
    Evaluate        "${create_bank_transfer.json()['transaction']['receiverId']}"=="${bankTransfer_data}[receiverId]"
    Evaluate        "${create_bank_transfer.json()['transaction']['senderId']}"=="${bankTransfer_data}[senderId]"


get_bankTransfer
    ${get_bank_transfer}=        get on session      session2      transactions
    ${total_transfers}=     Get length       ${get_bank_transfer.json()['results']}
    FOR   ${i}  IN RANGE    0   ${total_transfers}
        IF      "${get_bank_transfer.json()['results'][${i}]['id']}"=="${bank_transfer_id}"
            Evaluate        "${get_bank_transfer.json()['results'][${i}]['amount']}"=="${bankTransfer_data}[amount]"
            Evaluate        "${get_bank_transfer.json()['results'][${i}]['description']}"=="${bankTransfer_data}[description]"
            BREAK
        ELSE
            CONTINUE
        END
    END

post_comments
    ${body}     Create Dictionary       content=${bankTransfer_data}[comments]      transactionId=${bank_transfer_id}
    ${post_comments}=        post on session      session2      comments/${bank_transfer_id}       data=${body}
    request should be successful

get_comments
    ${get_comments}=        get on session      session2      comments/${bank_transfer_id}
    Evaluate      '${get_comments.json()['comments'][0]['content']}'=='${bankTransfer_data}[comments]'

post_Likes
    ${body}     Create Dictionary             transactionId=${bank_transfer_id}
    ${post_like}=        post on session      session2      likes/${bank_transfer_id}       data=${body}
    request should be successful

Get_Likes
    ${get_likes}=        get on session      session2      likes/${bank_transfer_id}
    request should be successful

get_notifications
    ${get_notification}=        get on session      session2     notifications
    request should be successful
    ${total_notification}=      Get length      ${get_notification.json()['results']}
    Evaluate        ${total_notification}>0

get_mockdata
    [Arguments]     ${relative_URL}
    ${get_response}=        get on session      session2      testData/${relative_URL}
    request should be successful
     ${total_data}=      Get length      ${get_response.json()['results']}
    Evaluate        ${total_data}>0

get_transactions
    ${get_transactions}=        get on session      session2      transactions
    ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_pending_transactions
    ${get_transactions}=        get on session      session2      transactions     params=requestStatus=pending
        ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_pending_transactions_on_daterange
    ${get_transactions}=        get on session      session2      transactions         params=requestStatus=pending&dateRangeStart=Mon%20Jan%2001%202018%2000%3A00%3A00%20GMT%2B0530%20(India%20Standard%20Time)&dateRangeEnd=Thu%20Dec%2005%202030%2000%3A00%3A00%20GMT%2B0530%20(India%20Standard%20Time)
        ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_contacts_data
    ${get_transactions}=        get on session      session2      transactions/contacts
        ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_contacts_data_from_page2
    ${get_transactions}=        get on session      session2      transactions/contacts        params=page=2
        ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_public_transactions
    ${get_transactions}=        get on session      session2      transactions/public
        ${total_data}=      Get length      ${get_transactions.json()['results']}
    Evaluate        ${total_data}>0

get_all_users
    ${get_all_user}=        get on session      session2      users
        ${total_data}=      Get length      ${get_all_user.json()['results']}
    Evaluate        ${total_data}>0

get_a_user
    ${get_a_user}=        get on session      session2      users/t45AiwidW
    ${total_data}=      Get length      ${get_a_user.json()['user']}
    Evaluate        ${total_data}==1

get_invalid_user
    TRY
        ${get_a_user}=        get on session      session2      users/jdgjhfjgh
    EXCEPT
        status should be        401
    END

get_profile_by_username
    ${get_a_user}=        get on session      session2      users/profile/Katharina_Bernier
    Evaluate        '${get_a_user.json()['user']['firstName']}'=='${signup_data}[firstName1]'
    Evaluate        '${get_a_user.json()['user']['lastName']}'=='${signup_data}[lastName1]'

get_user_upon_search_params
    [Arguments]     ${searchdata}
    ${get_a_user_by_search}=        get on session      session2      users/search    params=q=${searchdata}
    Evaluate        '${get_a_user_by_search.json()['results'][0]['firstName']}'=='${signup_data}[firstName2]'

