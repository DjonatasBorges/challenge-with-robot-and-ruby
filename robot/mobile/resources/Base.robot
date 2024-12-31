*** Settings ***
Library         AppiumLibrary    timeout=30

Resource    utils/App.robot

Resource    actions/CadastroActions.robot
Resource    actions/LoginActions.robot

*** Variables ***
${EMAIL_VALIDO}       valid.email@test.com
${SENHA_VALIDA}       senha123-