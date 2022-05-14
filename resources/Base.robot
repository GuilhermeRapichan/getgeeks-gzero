*Settings*
Documentation       Base Test

Library     Browser
Library     factories/Users.py
Library     Collections
Library     Utils.py

Resource        Helpers.robot
Resource        actions/BeGeekActions.robot
Resource        actions/_SharedActions.robot
Resource        actions/SignupActions.robot
Resource        actions/AuthActions.robot
Resource        Database.robot

*Variables*
${BASE_URL}     https://getgeeks-guirapichan.herokuapp.com

*Keywords*

Start Session
    New Browser     ${BROWSER}        headless=${HEADLESS}     #slowMo=00:00:00.5
    New Page        ${BASE_URL}
    Set Viewport Size       1280        720

After Session
    ${shot_name}        Screenshot Name
    Take Screenshot     fullPage=True       filename=${shot_name}