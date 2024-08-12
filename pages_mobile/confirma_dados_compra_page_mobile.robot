*** Settings ***
Library    AppiumLibrary

*** Variables ***
${lbl_nome_produto_tres}    css=div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.info_prod_basket:nth-child(2) span.prodBasket_nome:nth-child(1) > a:nth-child(1)
${lbl_preco_produto_tres}    css=div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.preco_prodBasket.preco-total-produto:nth-child(5) > span.precoPor_basket
${ico_continuar}    xpath=//a[@id='ContentSite_Basketcontrol1_rptBasket_imbFinalize_0']

*** Keywords *** 
Clicar no botao Continuar
    Click Element    ${ico_continuar}  