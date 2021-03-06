*Settings*
Documentation      Be Geek Actions


*Keywords*

Go To Geek Form

    Click       css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State      css=.be-geek-form      visible     5

Fill Geek Form

    [Arguments]     ${geek}
    Reset Geek Form
    Fill Text       id=whatsapp     ${geek}[geek_profile][whats]
    Fill Text       id=desc         ${geek}[geek_profile][desc]

    IF      '[geek_profile][printer_repair]'
        Select Options By       id=printer_repair       text           ${geek}[geek_profile][printer_repair]

    END
    IF      '[geek_profile][work]'

        Select Options By       id=work                 text           ${geek}[geek_profile][work]
    END

    Fill Text       id=cost         ${geek}[geek_profile][cost]

Submit Geek Form

    Click       css=button >> text=Quero ser um Geek

Geek Form Should Be Success

    ${expected_message}     Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${expected_message}     visible     10
Reset Geek Form
    Execute JavaScript      document.getElementsByClassName("be-geek-form")[0].reset();