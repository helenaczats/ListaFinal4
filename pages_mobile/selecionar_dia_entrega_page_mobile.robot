*** Settings ***
Library    AppiumLibrary

*** Variables ***
${lbl_nome_produto_dois}    xpath=//span[@id='ContentSite_lblProductDsName']
${lbl_preco_produto_dois}    xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[6]/span[2]
${btn_cep}    css=#placeholder-mobile
${cep_parte_um}    css=#ContentSite_txtZip
${cep_parte_dois}    css=#ContentSite_txtZipComplement
${btn_ok}    xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[14]/div[1]/div[1]/span[2]
${ico_dia}    xpath=//a[contains(text(),'HOJE')]
${ico_turno}    xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[10]/div[3]/div[6]/div[1]/ul[1]/li[7]/input[1]

*** Keywords ***
Preencher campo CEP                 
    Click Element    ${btn_cep}   

Preencher inicio do campo CEP
    [Arguments]    ${cep_um}                  
    Input Text    ${cep_parte_um}   ${cep_um}

Preencher prefixo do campo CEP
    [Arguments]    ${cep_dois}                  
    Input Text    ${cep_parte_dois}    ${cep_dois}

Clicar botao OK
    Click Element    ${btn_ok}   

Escolher Data de Entrega
    Click Element    ${ico_dia}

Confirmar Turno de Entrega 
    Click Element   ${ico_turno}     