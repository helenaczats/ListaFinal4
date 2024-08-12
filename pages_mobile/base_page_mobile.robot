*** Settings ***

#Library    SeleniumLibrary
Library    AppiumLibrary

Resource    login_page_mobile.robot
Resource    confirma_dados_compra_page_mobile.robot
Resource    selecionar_dia_entrega_page_mobile.robot
Resource    selecionar_produto_page_mobile.robot

*** Variables ***

${timeout}    5000ms
${REMOTE_URL}    https://helenaczats4:c9a2238f-ba4e-4016-bbf7-b1b1800b4615@ondemand.eu-central-1.saucelabs.com:443/wd/hub 

*** Keywords ***
 Abrir Application       
    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    appium:platformVersion=9.0
    ...    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator
    ...    browserName=chrome    
    ...    appium:automationName=uiautomator2   
    ...    appium:ensureWebviewsHavePages=${True}   
    ...    appium:url=https://www.giulianaflores.com.br/    
    ...    appium:nativeWebScreenshot=${True}     
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True} 
    Go To Url    https://www.giulianaflores.com.br/ 

    # Verifique os contextos disponíveis
    ${contexts}=    Get Contexts
    Log    ${contexts}
    Log To Console    ${contexts}

    # Troque para o contexto nativo
    Switch To Context    NATIVE_APP

Fechar Application  
    Close All Applications