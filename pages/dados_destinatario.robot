*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${txt_name_destinatario}    id=txtDsDestinationName    
${choose_type_adress}    id=ContentSite_rptDeliveryAddress_rbtFgPersonalAddress_0_1_0     
${txt_number_adress}    id=txtDsNumber  
${choose_type_card}    id=rbBlankGiftCard    
${btn_continue_check-out}    id=btnContinue

*** Keywords ***

Preencher campo Nome do Destinatário
    [Arguments]    ${name_destinatario}                  
    Input Text    ${txt_name_destinatario}    ${name_destinatario}

Escolher Tipo do Endereco
    Click Element    ${choose_type_adress}

Preencher Numero do Endereco
    [Arguments]    ${number_adress}                  
    Input Text    ${txt_number_adress}    ${number_adress} 

Escolher Tipo do Cartao
    Click Element    ${choose_type_card}    

Clicar no botao Check Out
    Click Element    ${btn_continue_check-out} 