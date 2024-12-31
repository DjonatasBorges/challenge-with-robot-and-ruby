*** Settings ***
Resource         ../Base.robot

*** Variables ***
${REMOTE_URL}   http://localhost:4723/test/app
${platformName}   Android
${appium:platformVersion}   13
${appium:deviceName}    Pixel 4 API 33
${appium:automationName}    UiAutomator2

*** Keywords ***
Abrir App
    Open Application    
        ...    remote_url=${REMOTE_URL}
        ...    automationName=${appium:automationName}
        ...    platformName=${platformName}
        ...    deviceName=${appium:deviceName}
        ...    app=${CURDIR}${/}..${/}..${/}apk${/}app-debug.apk
        ...    disableIdLocatorAutocompletion=${True}

Fechar App
    Close Application

