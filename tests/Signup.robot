*Settings*
Documentation       Signup Test Suit

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user

    ${user}     Factory User

    Go to Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user
    [Tags]      attempt_signup

    ${user}                     Factory User
    Add User From Database      ${user}

    Go to Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Modal Content Should Be  Já temos um usuário com o e-mail informado.

Email is incorrect
    [Tags]      attempt_signup

    ${user}     Factory Wrong Email

    Go to Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be     O email está estranho

Required Fields
    [Tags]      attempt_signup      x

    @{alertasesperados}      Create List
    ...                      Cadê o seu nome?
    ...                      E o sobrenome?
    ...                      O email é importante também!
    ...                      Agora só falta a senha!
    Go to Signup Form
    Submit Signup Form
    Alert Spans Should Be   ${alertasesperados}
    

Short Password
    [Tags]      attempt_signup      short_pass
    [Template]      Signup With Short Password    
    1
    12
    123
    1234
    12345
    a   
    a2
    ab3
    ab3c
    a23bc
    -1
*Keywords*

Signup With Short Password
    [Arguments]         ${short_pass}
    
    
    ${user}     Create Dictionary
    ...         name=Guilherme              lastname=Rapichan
    ...         email=papito@gmail.com      password=${short_pass}

    Go to Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be     Informe uma senha com pelo menos 6 caracteres