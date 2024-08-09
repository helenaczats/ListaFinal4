*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${name_flor}    xpath=//span[@id='ContentSite_lblProductDsName']
${price_flor}    css=div.container_full:nth-child(13) main.content-site:nth-child(4) div:nth-child(9) div.prod:nth-child(1) div.prod_col2 div.preco_prod:nth-child(7) > span.precoPor_prod:nth-child(3)
${txt_cep}    id=ContentSite_txtZip
${btn_ok_cep}    css=.jOpenShippingPopup
${btn_data}    css=.selectDate
${btn_confirma_data}    id=btConfirmShippingData
${btn_add_cart}    id=ContentSite_lbtBuy

*** Keywords ***
Preencher campo CEP
    [Arguments]    ${cep}                  
    Input Text    ${txt_cep}    ${cep}

Clicar botao OK
    Click Element    ${btn_ok_cep}   

Escolher data de entrega
    Click Element    ${btn_data}

Confirmar Data de Entrega 
    Click Element   ${btn_confirma_data}   

Adicionar produto ao carrinho
    Click Element    ${btn_add_cart}     