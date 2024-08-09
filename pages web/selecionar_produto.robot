*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${item_product_name}    xpath=//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')]
${item_product_price}    css=div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(2) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(1) div.product-item a.list-carousel div.price > span.actual-price
*** Keywords ***
Selecionar Produto na Home
    Click Element    ${item_product_name}