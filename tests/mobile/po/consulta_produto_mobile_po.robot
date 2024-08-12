*** Settings ***
Resource    ../../../pages_mobile/base_page_mobile.robot

*** Test Cases ***
Selecionar Flor
    #Escolher Produtos
    Wait Until Page Contains Element    ${btn_aceitar_notificacoes}   10000ms
    Aceitar notificacoes
    Switch To Context     CHROMIUM
    Aceitar cookies
    Wait Until Page Contains Element    ${lbl_nome_produto_um}   10000ms
    Element Text Should Be    ${lbl_nome_produto_um}    Ilustre Mini Orquídea Phalaenopsis Lilás
    Element Text Should Be    ${lbl_preco_produto_um}    R$ 59,90
    Wait Until Page Contains Element    ${img_produto_um}
    Clicar no produto

    #Escolher dia e turno entrega
    Wait Until Page Contains Element    ${lbl_nome_produto_dois}   10000ms
    Element Text Should Be    ${lbl_nome_produto_dois}    ILUSTRE MINI ORQUÍDEA PHALAENOPSIS LILÁS
    Element Text Should Be    ${lbl_preco_produto_dois}    R$ 59,90
    Preencher campo CEP
    Preencher inicio do campo CEP    04535
    Preencher prefixo do campo CEP    902
    Clicar botao OK
    Wait Until Page Contains Element    ${ico_dia}   10000ms
    Escolher Data de Entrega  
    Wait Until Page Contains Element    ${ico_turno}   10000ms   
    Confirmar Turno de Entrega 

    #Confirmar compra
    Wait Until Page Contains Element    ${lbl_nome_produto_tres}   20000ms
    Element Text Should Be    ${lbl_nome_produto_tres}    Ilustre Mini Orquídea Phalaenopsis Lilás
    Element Text Should Be    ${lbl_preco_produto_tres}    R$ 59,90
    Wait Until Page Contains Element    ${ico_continuar}   10000ms
    Clicar no botao Continuar

    #Digite seu e-mail ou CPF
    Wait Until Page Contains Element    ${txt_pg_quatro}   10000ms
    Element Text Should Be   ${txt_pg_quatro}    DIGITE SEU E-MAIL OU CPF   