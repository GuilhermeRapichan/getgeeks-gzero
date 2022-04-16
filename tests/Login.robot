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

    ${u}        Create Dictionary       email=guirapichan@kkkk.com     password="rapichan13"

    Go To Login Page
    Fill Credentials  ${u}
    Submit Credentials
    Modal Content Should Be       Usuário e/ou senha inválidos.

Incorrect Email

    ${u}        Create Dictionary       email=guirapichankkkk.com     password="rapichan13"

    Go To Login Page
    Fill Credentials  ${u}
    Submit Credentials
    Should Be Type Email