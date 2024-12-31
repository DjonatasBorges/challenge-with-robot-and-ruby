*** Settings ***
Documentation        Base Test

Library    Browser
Library    String

Resource   actions/LoginActions.robot
Resource   actions/LogoutActions.robot
Resource   actions/AdminActions.robot

Resource   Helpers.robot


*** Variables ***
${URL_BASE}        https://opensource-demo.orangehrmlive.com

*** Keywords ***
Start Session
    New Browser          chromium        headless=False       slowMo=00:00:00
    New Page             ${URL_BASE}

    # Set Viewport Size    1280    768

After Test
    Take Screenshot    fullPage=true