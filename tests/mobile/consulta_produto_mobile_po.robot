# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Library    ../../.venv/lib/python3.12/site-packages/robot/libraries/OperatingSystem.py
Test Teardown     Close Application

*** Variables ***
${REMOTE_URL}    https://helenaczats4:c9a2238f-ba4e-4016-bbf7-b1b1800b4615@ondemand.eu-central-1.saucelabs.com:443/wd/hub
${txt_pg_1}    xpath=//h2[contains(text(),'Escolha o seu Presente')]  
${btn_aceitar_notificacoes}    xpath=//android.widget.Button[@resource-id="com.android.chrome:id/positive_button"]
${btn_aceitar_preferencias}    xpath=//div[contains(text(),'Aceitar')]
${lbl_nome_produto_pg_1}    xpath=//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')] 
${lbl_preco_produto_pg_1}    android=new UiSelector().text("R$ 209,90")

*** Test Cases ***
Selecionar Orquidea
    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    appium:platformVersion=9.0
    ...    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator
    ...    browserName=chrome   
    #...    browserVersion=126   
    ...    appium:automationName=uiautomator2   
    ...    appium:ensureWebviewsHavePages=${True}   
    ...    appium:url=https://www.giulianaflores.com.br/    
    ...    appium:nativeWebScreenshot=${True}   
    #...    sauce:options=[object Object]   
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}
    
    Go To Url    https://www.giulianaflores.com.br/ 

    #Escolher Produtos

    #Click Element    ${btn_aceitar_notificacoes}
    #Swipe    ${446}    ${1884}    ${629}    ${1003}
    #${el1} =    Set Variable     id=com.android.chrome:id/positive_button
    #Click Element    ${el1}

    #Click Element    ${btn_aceitar_preferencias}
    #Swipe    ${542}    ${1514}    ${629}    ${1034}
    #${el2} =    Set Variable     android=new UiSelector().className("android.view.View").instance(55)
    #Click Element    ${el2}
   
    Swipe    ${496}    ${1751}    ${656}    ${1038}
    Swipe    ${496}    ${1697}    ${526}    ${793}
    Swipe    ${515}    ${1560}    ${542}    ${717}
    Swipe    ${553}    ${1697}    ${591}    ${908}
    Wait Until Page Contains Element    ${lbl_nome_produto_pg_1}   10000ms
    Element Text Should Be    ${lbl_nome_produto_pg_1}    União das Belas Orquideas Brancas e Lilás
    Wait Until Page Contains Element    ${lbl_nome_produto_pg_1}   10000ms
    Element Text Should Be    ${lbl_preco_produto_pg_1}    R$ 209,90

    Click Element    ${lbl_nome_produto_pg_1}

    #Escolher dia e turno entrega
    ${lbl_nome_produto_pg_2} =    Set Variable    xpath=//android.view.View[@text="MINI ORQUÍDEA CHUVA DE OURO"]
    Element Text Should Be    ${lbl_nome_produto_pg_2}    MINI ORQUÍDEA CHUVA DE OURO
    ${lbl_preco_produto_pg_2} =    Set Variable    xpath=//android.widget.TextView[@text="R$ 69,90"]
    Element Text Should Be    ${lbl_preco_produto_pg2}    R$ 69,90
    
    ${cep_parte_1} =    Set Variable    xpath=//android.widget.EditText[@resource-id="ContentSite_txtZip"]
    Input Text    ${cep_parte_1}    04535
    ${cep_parte_2} =    Set Variable    xpath=//android.widget.EditText[@resource-id="ContentSite_txtZipComplement"]
    Input Text    ${cep_parte_2}    902
    ${btn_ok} =    Set Variable    xpath=//android.widget.TextView[@text="ok"]
    Click Element    ${btn_ok}
    
    ${ico_dia} =    Set Variable    xpath=//android.widget.TextView[@text="HOJE"]
    Click Element    ${ico_dia}   
    ${ico_turno} =    Set Variable    xpath=//android.view.View[@resource-id="jShippingPeriod"]/android.widget.ListView/android.view.View[2]/android.widget.RadioButton
    Click Element    ${ico_turno}

    ${ico_adicionar_carrinho} =    Set Variable    xpath=//android.view.View[@content-desc="ADICIONAR AO CARRINHO "]
    Click Element    ${ico_adicionar_carrinho}

    #Confirmar compra
    ${lbl_nome_produto_pg_3} =    Set Variable    xpath=//android.webkit.WebView[@text="Mini Orquídea Chuva de Ouro | Giuliana Flores"]
    Element Text Should Be    ${lbl_nome_produto_pg_3}    MINI ORQUÍDEA CHUVA DE OURO
    ${lbl_preco_produto_pg_3} =    Set Variable    css=div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.preco_prodBasket.preco-total-produto:nth-child(5) > span.precoPor_basket
    Element Text Should Be    ${lbl_preco_produto_pg_3}    R$ 69,90
    ${ico_continuar} =    Set Variable    xpath=//android.widget.FrameLayout[@resource-id="com.android.chrome:id/bottom_container"]
    Click Element    ${ico_continuar}

    #Digite seu e-mail ou CPF
    ${txt_login} =    Set Variable    xpath=//android.widget.TextView[@text="DIGITE SEU E-MAIL OU CPF"]
    Element Text Should Be   ${txt_login}    DIGITE SEU E-MAIL OU CPF   