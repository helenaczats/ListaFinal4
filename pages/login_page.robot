*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_login}    id=perfil-hidden
${btn_login}    id=UrlLogin
${titulo_login}    css=.titulo-dept
${aceitar_pop_up}    id=adopt-accept-all-button
${txt_usuario}    id=ContentSite_txtEmail
${txt_senha}    id=ContentSite_txtPassword
${btn_continue_login}    id=ContentSite_ibtContinue

*** Keywords ***
Clicar no Menu 
    Click Element    ${menu_login}   

Clicar em Login
    Click Element    ${btn_login}
    
Preencher usuario
    [Arguments]    ${usuario}
    Input Text    ${txt_usuario}    ${usuario}

Preencher senha
    [Arguments]    ${senha}
    Input Password    ${txt_senha}    ${senha}

Aceitar Pop Up
    Click Element    ${aceitar_pop_up}

Clicar no botao Login
    Click Element    ${btn_continue_login}    