*** Settings ***

Library    SeleniumLibrary
Library    DateTime

Resource    login_page.robot
Resource    selecionar_produto.robot
Resource    selecionar_dia_entrega.robot
Resource    confirma_dados_compra.robot
Resource    dados_destinatario.robot

*** Variables ***

${timeout}    5000ms
${url}    https://www.giulianaflores.com.br/
${browser}    Chrome
${date}
${remove_produtos}    id=ContentSite_Basketcontrol1_rptBasket_rptBasketItems_0_lbtRemoveProduct_0
${menu_logout}    css=#perfil-hidden > img
${btn_logout}    css=li:nth-child(11) > a:nth-child(2)

*** Keywords ***

Abrir navegador

    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10s  

Fechar navegador

    Sleep    500ms      
    Close Browser

Obter Data e hora

    ${date}=    Get Current Date  
    ${date}=    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}

Tirar Screenshot    

     [Arguments]    ${screenshot_name}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    Capture Page Screenshot    screenshots/giuliana/${date}/${TEST_NAME}/${screenshot_name}.jpg

Realizar Logout
    Go Back
    Go Back
    Click Element    ${remove_produtos}
    Click Element    ${menu_logout}
    Click Element    ${btn_logout}