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
Test Teardown     Close Application


*** Variables ***
${REMOTE_URL}    https://helenaczats4:c9a2238f-ba4e-4016-bbf7-b1b1800b4615@ondemand.eu-central-1.saucelabs.com:443/wd/hub 
${btn_aceitar_notificacoes}    android=new UiSelector().resourceId("com.android.chrome:id/positive_button")
${btn_aceitar_preferencias}    xpath=//div[contains(text(),'Aceitar')]
${lbl_nome_produto_um}    xpath=//h3[contains(text(),'Dupla de Orquídeas Amarelas para Presente')]
${lbl_preco_produto_um}    css=div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(3) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(1) div.product-item a.list-carousel div.price > span.actual-price
${img_produto_um}    css=div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(3) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(1) div.product-item a.list-carousel div.image-content > img:nth-child(1)
${lbl_nome_produto_dois}    xpath=//span[@id='ContentSite_lblProductDsName']
${lbl_preco_produto_dois}    css=div.container_full:nth-child(13) main.content-site:nth-child(4) div:nth-child(9) div.prod:nth-child(1) div.prod_col2 div.preco_prod:nth-child(7) > span.precoPor_prod:nth-child(3)
${btn_cep}    css=#placeholder-mobile
${cep_parte_um}    css=#ContentSite_txtZip
${cep_parte_dois}    css=#ContentSite_txtZipComplement
${btn_ok}    xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[14]/div[1]/div[1]/span[2]
${ico_dia}    xpath=//a[contains(text(),'HOJE')]
${ico_turno}    xpath=//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[10]/div[3]/div[6]/div[1]/ul[1]/li[1]/input[1]

${lbl_nome_produto_tres}    css=div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.info_prod_basket:nth-child(2) span.prodBasket_nome:nth-child(1) > a:nth-child(1)
${lbl_preco_produto_tres}    xpath=//body/form[@id='form1']/div[2]/div[3]/div[5]/div[3]/div[1]/div[2]/ul[2]/li[1]/div[4]/span[2]
${ico_continuar}    xpath=//a[@id='ContentSite_Basketcontrol1_rptBasket_imbFinalize_0']

${txt_login}    xpath=//span[contains(text(),'DIGITE SEU E-MAIL OU CPF')]

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

    # Verifique os contextos disponíveis
    ${contexts}=    Get Contexts
    Log    ${contexts}
    Log To Console    ${contexts}

    # Troque para o contexto nativo
    Switch To Context    NATIVE_APP
  
    #Escolher Produtos
    Wait Until Page Contains Element    ${btn_aceitar_notificacoes}   10000ms
    
    Click Element    ${btn_aceitar_notificacoes}
    Switch To Context     CHROMIUM
    Click Element    ${btn_aceitar_preferencias}

    Wait Until Page Contains Element    ${lbl_nome_produto_um}   10000ms
    Element Text Should Be    ${lbl_nome_produto_um}    Dupla de Orquídeas Amarelas para Presente
    Element Text Should Be    ${lbl_preco_produto_um}    R$ 199,90
    
    Wait Until Page Contains Element    ${img_produto_um}
    Click Element    ${img_produto_um}

    #Escolher dia e turno entrega
    Wait Until Page Contains Element    ${lbl_nome_produto_dois}   10000ms
    Element Text Should Be    ${lbl_nome_produto_dois}    DUPLA DE ORQUÍDEAS AMARELAS PARA PRESENTE
    Element Text Should Be    ${lbl_preco_produto_dois}    R$ 199,90
    
    Click Element    ${btn_cep} 
    Input Text    ${cep_parte_um}    04535
    Input Text    ${cep_parte_dois}    902

    Click Element    ${btn_ok}
    
    Wait Until Page Contains Element    ${ico_dia}   10000ms
    Click Element    ${ico_dia}   
   
    Wait Until Page Contains Element    ${ico_turno}   10000ms   
    Click Element    ${ico_turno}

    #Confirmar compra
    Wait Until Page Contains Element    ${lbl_nome_produto_tres}   20000ms
    Element Text Should Be    ${lbl_nome_produto_tres}    Dupla de Orquídeas Amarelas para Presente
    Element Text Should Be    ${lbl_preco_produto_tres}    R$ 199,90

    Wait Until Page Contains Element    ${ico_continuar}   10000ms
    Click Element    ${ico_continuar}

    #Digite seu e-mail ou CPF
    Wait Until Page Contains Element    ${txt_login}   10000ms
    Element Text Should Be   ${txt_login}    DIGITE SEU E-MAIL OU CPF    