*** Settings ***
Library    AppiumLibrary

*** Variables ***
${btn_aceitar_notificacoes}    android=new UiSelector().resourceId("com.android.chrome:id/positive_button")
${btn_aceitar_preferencias}    xpath=//div[contains(text(),'Aceitar')]
${lbl_nome_produto_um}    xpath=//h3[contains(text(),'Ilustre Mini Orquídea Phalaenopsis Lilás')]
${lbl_preco_produto_um}    xpath=//body/form[@id='form1']/div[3]/main[1]/main[1]/section[2]/div[1]/main[1]/div[2]/div[1]/div[1]/div[1]/div[1]/a[1]/div[2]/span[2]
${img_produto_um}    xpath=//body/form[@id='form1']/div[3]/main[1]/main[1]/section[2]/div[1]/main[1]/div[2]/div[1]/div[1]/div[1]/div[1]/a[1]/div[1]/img[1]

*** Keywords ***
Aceitar notificacoes
    Click Element    ${btn_aceitar_notificacoes}

Aceitar cookies
    Click Element    ${btn_aceitar_preferencias}

Clicar no produto
    Click Element    ${img_produto_um}