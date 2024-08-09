*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${name_orquidea}    xpath=//a[contains(text(),'União das Belas Orquideas Brancas e Lilás')]
${price_orquidea}    css=div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.preco_prodBasket.preco-subtotal-produto:nth-child(6) > span.precoPor_basket:nth-child(3)
${btn_continue_compra}    id=ContentSite_Basketcontrol1_rptBasket_imbFinalize_0

*** Keywords *** 
Clicar no botao Continuar
    Click Element    ${btn_continue_compra}   