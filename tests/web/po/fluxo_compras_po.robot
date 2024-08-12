*** Settings ***
Resource    ../../../pages_web/base_page.robot

*** Test Cases ***
Comprar Mini Orquidea Lilas
    #Home
    Sleep    20s      #Resolver aviso navegador        
    Clicar no Menu   
    Clicar em Login
    Element Text Should Be    ${titulo_login}    IDENTIFICAÇÃO 
    
    #Login
    Aceitar Pop Up
    Preencher usuario    igor_tiago_galvao@teadit.com.br             
    Clicar no botao Login  
    Sleep    30s       #resolver manualmente 1)permitir notificações e 2)captcha
    Preencher senha    Andorinha123 
    Clicar no botao Login
    
    #Escolher Produto
    Element Text Should Be    ${item_product_name}    União das Belas Orquideas Brancas e Lilás    
    Element Text Should Be    ${item_product_price}    R$ 209,90   
    Sleep    5s
    Tirar Screenshot    1-Página Selecionar Produto
    Selecionar Produto na Home

    #Escolher Data de Entrega
    Element Text Should Be    ${name_flor}    UNIÃO DAS BELAS ORQUIDEAS BRANCAS E LILÁS  
    Element Text Should Be    ${price_flor}    R$ 209,90
    Tirar Screenshot    2-Página Selecionar Dia da Entrega
    Preencher campo CEP    04535902
    Sleep    5s  
    Clicar botao OK
    Escolher data de entrega 
    Sleep    10s          
    Confirmar Data de Entrega   
    Adicionar produto ao carrinho 
    
    #Confirma Dados da Compra
    Sleep    5s 
    Element Text Should Be    ${name_orquidea}    União das Belas Orquideas Brancas e Lilás 
    Element Text Should Be    ${price_orquidea}    R$ 209,90
    Sleep    5s 
    Tirar Screenshot    3-Página Confirma Dados Compra
    Clicar no botao Continuar
    
    #Dados Destinatário
    Preencher campo Nome do Destinatário    Cristina
    #Sleep    5s 
    Escolher Tipo do Endereco         
    Preencher Numero do Endereco    70  
    Tirar Screenshot    4- Dados do Destinatario Preenchido
    Escolher Tipo do Cartao 
    Sleep    5s   
    Clicar no botao Check Out
    
    Realizar Logout  