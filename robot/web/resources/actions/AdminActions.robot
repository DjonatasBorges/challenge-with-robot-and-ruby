*** Settings ***
Documentation        Admin Actions

Resource   ../Base.robot

*** Variables ***
${USERNAME}                    INIT
${ADMIN_MENU}                  css=a >> text=Admin
${SYSTEM_USERS_H5}             css=h5 >> text=System Users
${ADD_BUTTON}                  css=button >> text=Add
${SAVE_BUTTON}                 css=button[type="submit"] >> text= Save
${USERNAME_FIELD}              xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input
${SEARCH_BUTTON}               css=button[type="submit"] >> text= Search
${SEARCH_RESULT}               css=div[class='orangehrm-horizontal-padding orangehrm-vertical-padding'] span[class='oxd-text oxd-text--span']
${SUCCESS_MESSAGE}             css=div >> text=Successfully Saved
${PASSWORD_FIELD}              xpath=//div[@class='oxd-grid-item oxd-grid-item--gutters user-password-cell']//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@type='password']
${CONFIRM_PASSWORD_FIELD}      xpath=//div[@class='oxd-grid-item oxd-grid-item--gutters']//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@type='password']
${PASSWORD_MISMATCH_MESSAGE}   css=span >> text=Passwords do not match
${DELETE_BUTTON}               css=.oxd-icon.bi-trash
${CONFIRM_DELETE}              css=button >> text= Yes, Delete
${DELETE_SUCCESS}              css=div >> text=Successfully Deleted
${ERROR_MESSAGE}               xpath=//form[1]/div[1]/div[1]/div[1]/div[1]/span[1]

*** Keywords ***


E estou na tela de "Admin"
    ${RANDOM_PART}    Generate Random String    10    [LOWERCASE]
    Set Global Variable    ${USERNAME}    ${RANDOM_PART}
    Click    ${ADMIN_MENU}
    Wait For Elements State    ${SYSTEM_USERS_H5}    visible    5s

Quando eu adiciono um novo usuário com perfil “Admin” e status “Enabled”
    Click    ${ADD_BUTTON}
    Fill and Submit Form User

Então o sistema deve salvar o cadastro com sucesso
    Wait For Elements State    ${SUCCESS_MESSAGE}    visible    5s

E devo conseguir visualizar o novo usuário na lista de “System Users”
    Fill Text    ${USERNAME_FIELD}    ${USERNAME}
    Click        ${SEARCH_BUTTON}
    ${txt}    Get Text    ${SEARCH_RESULT}
    Should Be Equal As Strings    ${txt}    (1) Record Found
    Quando eu opto por excluir esse usuário

Quando eu tento cadastrar um usuário sem preencher campos obrigatórios
    Click    ${ADD_BUTTON}
    Click    ${SAVE_BUTTON}
    Wait For Elements State    ${ERROR_MESSAGE}    visible    10s

Então o sistema deve exibir mensagens de erro indicando quais campos são requeridos
    Wait For Elements State    ${ERROR_MESSAGE}    visible    10s

Quando tento cadastrar um usuário e preencho o "Password" e o "Confirm Password" de forma diferente
    Click        ${ADD_BUTTON}
    Fill Text    ${PASSWORD_FIELD}    Senha123!
    Fill Text    ${CONFIRM_PASSWORD_FIELD}    SenhaIncorreta!
    Wait For Elements State    ${PASSWORD_MISMATCH_MESSAGE}    visible    5s

Então o sistema deve exibir a mensagem de erro “Passwords do not match”
    Wait For Elements State    ${PASSWORD_MISMATCH_MESSAGE}    visible    5s

Quando eu pesquiso por um ADMIN já cadastrado
    Fill Text    ${USERNAME_FIELD}    ${USERNAME}
    Click        ${SEARCH_BUTTON}

Então o resultado da busca deve exibir o usuário correspondente
    Wait For Elements State    css=div >> text=${USERNAME}    visible    5s
    ${txt}    Get Text    ${SEARCH_RESULT}
    Should Be Equal As Strings    ${txt}    (1) Record Found
    Quando eu opto por excluir esse usuário

Quando eu pesquiso por um Username que não existe
    Fill Text    ${USERNAME_FIELD}    Undefined User
    Click        ${SEARCH_BUTTON}

Então o sistema deve indicar que nenhum registro foi encontrado
    ${txt}    Get Text    ${SEARCH_RESULT}
    Should Be Equal As Strings    ${txt}    No Records Found

E existe um usuário cadastrado
    E estou na tela de "Admin"
    Quando eu adiciono um novo usuário com perfil “Admin” e status “Enabled”
    Então o sistema deve salvar o cadastro com sucesso

Quando eu opto por excluir esse usuário
    Quando eu pesquiso por um ADMIN já cadastrado
    Click    ${DELETE_BUTTON}
    Click    ${CONFIRM_DELETE}

Então o sistema deve confirmar a remoção
    Wait For Elements State    ${DELETE_SUCCESS}    visible    5s

E o usuário não deve mais constar na lista
    Quando eu pesquiso por um ADMIN já cadastrado
    ${txt}    Get Text    ${SEARCH_RESULT}
    Should Be Equal As Strings    ${txt}    No Records Found

Fill and Submit Form User
    Fill User Role
    Fill Status
    Fill Employee name
    Fill Username
    Fill Password
    Fill Confirm Password
    Click    ${SAVE_BUTTON}

Fill User Role
    Click   css=div.oxd-layout-context > div > div > form > div:nth-child(1) > div > div:nth-child(1) > div > div:nth-child(2) > div > div
    Wait For Elements State    //span[contains(text(),'Admin')]    visible    5s
    Click   //span[contains(text(),'Admin')]

Fill Status
    Click   //div[contains (text(),'-- Select --')]
    Wait For Elements State    //span[contains(text(),"Enabled")]    visible    5s
    Click   //span[contains(text(),"Enabled")]

Fill Employee name
    Fill Text    xpath=//input[@placeholder='Type for hints...']    A
    Sleep    5s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter

Fill Username
    Wait For Elements State    xpath=//div[@class='oxd-form-row']//div[@class='oxd-grid-2 orangehrm-full-width-grid']//div[@class='oxd-grid-item oxd-grid-item--gutters']//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@class='oxd-input oxd-input--active']    visible    5s
    Fill Text    xpath=//div[@class='oxd-form-row']//div[@class='oxd-grid-2 orangehrm-full-width-grid']//div[@class='oxd-grid-item oxd-grid-item--gutters']//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@class='oxd-input oxd-input--active']  ${USERNAME}

Fill Password
    Fill Text    ${PASSWORD_FIELD}    Admin@123-
    Wait For Elements State    ${PASSWORD_FIELD}    visible    5s

Fill Confirm Password
    Fill Text    ${CONFIRM_PASSWORD_FIELD}    Admin@123-
    Wait For Elements State    ${CONFIRM_PASSWORD_FIELD}    visible    5s
