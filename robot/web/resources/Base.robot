*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py
Library    Utils.py
Library    String

Resource   actions/AuthActions.robot
Resource   actions/SignupActions.robot


*** Variables ***
${URL_BASE}        https://opensource-demo.orangehrmlive.com

*** Keywords ***
Start Session
    New Browser          chromium        headless=True       slowMo=00:00:00
    New Page             ${URL_BASE}

    Set Viewport Size    1280    768

After Test

    # ${shot_name}       Screenshot Name
    # Take Screenshot    fullPage=true    filename=${shot_name}