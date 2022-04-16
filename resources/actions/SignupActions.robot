*Settings*
Documentation      Signup Actions

*Keywords*
Go to Signup Form
    Go to    ${BASE_URL}/signup

    Wait For Elements State     css=.signup-form    visible     5

Fill Signup Form
    [Arguments]     ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit Signup Form
    Click         css=.submit-button >> text=Cadastrar

User Should Be Registered

    ${expect_message}       Set Variable        css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State    ${expect_message}      visible     5




Alert Span Should Be
    [Arguments]     ${mensagemesperada} 

    ${error}        Set Variable       css=span[class=error] 

    Wait For Elements State     ${error} >> text=${mensagemesperada}        visible     5     


Alert Spans Should Be

    [Arguments]     ${alertasesperados}

    @{got_alerts}       Create List   

    ${spans}        Get Elements        xpath=//span[@class="error"]  

    FOR         ${s}    IN      @{spans}

        ${text}             Get Text            ${s}
        Append To List      ${got_alerts}       ${text}

    END

    Lists Should Be Equal       ${alertasesperados}         ${got_alerts} 

