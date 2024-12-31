*** Settings ***
Documentation        Logout Actions

Resource   ../Base.robot

*** Keywords ***
Quando clico sobre a foto e/ou nome do usuário para abrir o menu do usuário
    Click        css=div[class="oxd-topbar-header-userarea"] img[alt="profile picture"] 

E efetuo o "Logout"
    Click        css=li > a >> text=Logout

Então sou redirecionado a página de login
    Wait For Elements State    css=input[name="username"]    visible        5
