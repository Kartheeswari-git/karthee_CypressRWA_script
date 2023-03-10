Signin_data={
    'signin_url': 'http://localhost:3000/signin',
    'signup':'http://localhost:3000/signup',
    'base_url':'http://localhost:3001',
    'invalid_un':'iuyfx',
    'invalid_pwd':'ghbghjkj',
    'valid_un': 'kartheeswari1311@gmail.com',
    'valid_pwd':'Welcome123#',
    'get_data':"\n  query ListBankAccount {\n    listBankAccount {\n      id\n      uuid\n      userId\n      bankName\n      accountNumber\n      routingNumber\n      isDeleted\n      createdAt\n      modifiedAt\n    }\n  }\n",
    'create_ac':"\n  mutation CreateBankAccount($bankName: String!, $accountNumber: String!, $routingNumber: String!) {\n    createBankAccount(\n      bankName: $bankName\n      accountNumber: $accountNumber\n      routingNumber: $routingNumber\n    ) {\n      id\n      uuid\n      userId\n      bankName\n      accountNumber\n      routingNumber\n      isDeleted\n      createdAt\n    }\n  }\n",
    'del_ac':"\n  mutation DeleteBankAccount($id: ID!) {\n    deleteBankAccount(id: $id)\n  }\n"
}
bankTransfer_data={
    'amount':'2000',
    'description':'testing',
    'receiverId':'t45AiwidW',
    'senderId':'Pe7g0o-GC',
    'status':'complete',
    'transactionType':'payment',
    'comments':"Send you the share",
    'bankname_xpected':'Axis Bank',
    'bankname1': 'Canara Bank',
    'account_number_xpected':'975318642',
    'routing_number_xpected':'987654321',
    'contact1':'Kaylin',
    'contact1_un':'Allie2',
    'contact2_un':'Tavares_Barrows',


}
signup_data={
    'firstName':'Karthee1',
    'lastName':'S',
    'username':'kartheeswari1311@gmail.com',
    'password':'Welcome123#',
    'uname':'Katharina_Bernier',
    'pwd':'s3cret',
    'firstName1': 'Edgar',
    'lastName1': 'Johns',
    'firstName2':'Arely',
    'invalid_pwd':'ab'
}
Validation_msg={
    'fname_empty':'First Name is required',
    'lname_empty':'Last Name is required',
    'uname_empty':'Username is required',
    'pwd_invalid_msg':'Password must contain at least 4 characters',
    'pwd_empty':'Enter your password',
    'confirm_pwd_wrong':'Password does not match',
    'confirm_pwd_empty':'Confirm your password',
    'bank_name_empty':'Enter a bank name',
    'bank_invalid':'Must contain at least 5 characters',
    'routing_num_empty': 'Enter a valid bank routing number',
    'routing_num_invalid': 'Must contain a valid routing number',
    'acnum_name_empty': 'Enter a valid bank account number',
    'acnum_invalid': 'Must contain at least 9 digits',

}

bank_transaction={
    'amount_invalid_input_msg':'Please enter a valid amount',
    'note_invalid_input_msg':'Please enter a note',
    'note':'lunch share1',
    'Fname':'Arely',
    'Lname':'Kertzmann',
    'email':'Aniya_Powlowski36@hotmail.com',
    'phone_num':'537-041-4355',
}