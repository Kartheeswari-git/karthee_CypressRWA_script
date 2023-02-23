from Data import bankTransfer_data
Signup={
    'fname':'//input[@id="firstName"]',
    'lname':'//input[@id="lastName"]',
    'uname':'//input[@id="username"]',
    'pwd':'//input[@id="password"]',
    'confirm_pwd':'//input[@id="confirmPassword"]',
    'signup_btn':'//*[@data-test="signup-submit"]',
    'signin_btn':'//*[@data-test="signup"]'
}
signin={
    'signin_title':'//h1[text()="Sign in"]',
    'cypress_logo':'//*[@href="https://cypress.io"]',
    'signup_txt':'//*[text()="Don\'t have an account? Sign Up"]',
    'signin_btn':'//*[@data-test="signin-submit"]'
}
bankaccount={
    'bankname':'//*[@id="bankaccount-bankName-input"]',
    'routing_num':'//*[@id="bankaccount-routingNumber-input"]',
    'ac_num':'//*[@id="bankaccount-accountNumber-input"]',
    'create_bank_ac':"//*[contains(text(),'Create Bank Account')]",
    'save':'//*[@data-test="bankaccount-submit"]',
    'create':'//*[@data-test="bankaccount-new"]',
    'delete': '//*[text()="{}"]/parent::div/parent::div/div[2]//button[@data-test="bankaccount-delete"]'.format(bankTransfer_data['bankname1'])

}
side_icons={
    'bank_ac':'//*[@data-test="sidenav-bankaccounts"]',
}