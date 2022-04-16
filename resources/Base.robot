*Settings*
Documentation       Base Test

Library     Browser
Library     factories/Users.py
Library     Collections

Resource        Helpers.robot
Resource        actions/_SharedActions.robot
Resource        actions/SignupActions.robot
Resource        actions/AuthActions.robot
Resource        Database.robot

*Variables*
${BASE_URL}     https://getgeeks-guirapichan.herokuapp.com

*Keywords*

Start Session
    New Browser     chromium        headless=False      #slowMo=00:00:00.5
    New Page        ${BASE_URL}

Finish Session
    Take Screenshot