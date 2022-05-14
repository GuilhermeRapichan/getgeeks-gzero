*Settings*
Documentation           Actions about Authentication of system

*Variables*
${INPUT_EMAIL}          id=email
${INPUT_PASS}           id=password

*Keywords*
Go To Login Page

    Go To           ${BASE_URL}
    Wait For Elements State     css=.login-form         visible     5

Fill Credentials

    [Arguments]     ${user}

    Fill Text       ${INPUT_EMAIL}            ${user}[email]
    Fill Text       ${INPUT_PASS}         ${user}[password]

Submit Credentials
    Click       css=.submit-button >> text=Entrar

User Should Be Logged In

    [Arguments]     ${user}

    ${fullname}     Set Variable        ${user}[name] ${user}[lastname]
    ${css_profile}      Set Variable        css=a[href="/profile"]

    Wait For Elements State         ${css_profile}      visible     10
    Get Text                        ${css_profile}      equal       ${fullname}     

Should Be Type Email

    GET PROPERTY       css=input[type="email"][id="email"]     type        equal       email

Fill Only Field        
    [Arguments]     ${field}        ${pass}

    Fill Text       ${field}    ${pass}        