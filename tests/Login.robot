*Settings*
Documentation           Login test Suit

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login

    ${user}     Factory User Login


    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Pass

    ${u}        Create Dictionary       email=guirapichan@gmail.com     password="sad123"

    Go To Login Page
    Fill Credentials  ${u}
    Submit Credentials
    Modal Content Should Be       Usuário e/ou senha inválidos.

User Not Found

    ${u}        Create Dictionary       email=guirapichan@kkkk.com     password="pwd123"

    Go To Login Page
    Fill Credentials  ${u}
    Submit Credentials
    Modal Content Should Be       Usuário e/ou senha inválidos.

Incorrect Email

    ${u}        Create Dictionary       email=guirapichankkkk.com     password="pwd123"

    Go To Login Page
    Fill Credentials  ${u}
    Submit Credentials
    Should Be Type Email

Email Is Obrigatory

    Go To Login Page
    Fill Only Field    ${INPUT_PASS}    pwd123
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório

Password Is Obrigatory
    [Tags]      pass_wrong


    Go To Login Page
    Fill Only Field    ${INPUT_EMAIL}    guirapichan@gmail.com
    Submit Credentials
    Alert Span Should Be  Senha obrigatória

All Fields Is Obrigatory

    @{List_Message}         Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go to Login Page
    Submit Credentials
    Alert Spans Should Be  ${List_Message}