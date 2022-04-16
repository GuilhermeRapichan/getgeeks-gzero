*Settings*
Documentation       Shared Action



*Keywords*
Modal Content Should Be
    [Arguments]     ${expect_message}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State     ${title}                visible     5
    Get Text                    ${title}                equal       Oops...

    Wait for Elements State     ${content}      visible     5
    Get Text                    ${content}       equal       ${expect_message} 


Alert Span Should Be
    [Arguments]     ${expect_message} 

    ${error}        Set Variable       css=span[class=error] 

    Wait For Elements State     ${error} >> text=${expect_message}        visible     5     


Alert Spans Should Be

    [Arguments]     ${expect_message}

    @{got_alerts}       Create List   

    ${spans}        Get Elements        xpath=//span[@class="error"]  

    FOR         ${s}    IN      @{spans}

        ${text}             Get Text            ${s}
        Append To List      ${got_alerts}       ${text}

    END

    Lists Should Be Equal       ${expect_message}         ${got_alerts} 