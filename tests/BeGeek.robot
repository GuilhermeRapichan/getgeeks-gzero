*Settings*
Documentation       Be Geek Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Session

*Test Cases*

Be a Geek
    [Tags]      smoke
    ${user}         Factory User    begeek

    Do Login  ${user}
    Go To Geek Form
    Fill Geek Form  ${user}
    Submit Geek Form
    Geek Form Should Be Success
