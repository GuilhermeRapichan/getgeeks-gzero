*Settings*
Documentation       Shared Action



*Keywords*
Modal Content Should Be
    [Arguments]     ${mensagemesperada}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State     ${title}                visible     5
    Get Text                    ${title}                equal       Oops...

    Wait for Elements State     ${content}      visible     5
    Get Text                    ${content}       equal       ${mensagemesperada} 