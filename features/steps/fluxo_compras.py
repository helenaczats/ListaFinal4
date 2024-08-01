import pytest
import time
import json
from behave import given, when, then
from selenium import webdriver
from selenium.webdriver.common.by import By

@given(u'que acesso o site Giuliana Flores')
def step_impl(context):
  context.driver = webdriver.Chrome()   
  context.driver.maximize_window()      
  context.driver.implicitly_wait(10)    
  context.driver.get("https://www.giulianaflores.com.br/")
    
@when(u'entro no menu da pagina inicial')
def step_impl(context):
  context.driver.find_element(By.CSS_SELECTOR, "#perfil-hidden > img").click()
  
@then(u'clico em login')
def step_impl(context):
  context.driver.find_element(By.CSS_SELECTOR, "#UrlLogin > a").click()
  
@when(u'preencho os campos de login com usuario igor_tiago_galvao@teadit.com.br e senha Andorinha123')
def step_impl(context):
  context.driver.find_element(By.ID, "ContentSite_txtEmail").click()
  context.driver.find_element(By.ID, "ContentSite_txtEmail").send_keys("igor_tiago_galvao@teadit.com.br")
  context.driver.find_element(By.ID, "ContentSite_txtPassword").click()
  context.driver.find_element(By.ID, "ContentSite_txtPassword").send_keys("Andorinha123")
  context.driver.find_element(By.ID, "ContentSite_ibtContinue").click()
  context.driver.find_element(By.ID, "ContentSite_txtPassword").click()
  context.driver.find_element(By.ID, "ContentSite_txtPassword").send_keys("Andorinha123")
  
@when(u'resolvo um captcha')
def step_impl(context):
  context.driver.find_element(By.ID, "adopt-accept-all-button").click()
  time.sleep(30) #resolver manualmente 1)permitir notificações e 2)captcha

@then(u'clico em continuar')
def step_impl(context):
  context.driver.find_element(By.ID, "ContentSite_ibtContinue").click()
    
### Teste Produto Script ###
@when(u'clico no produto União das Belas Orquideas Brancas e Lilás')
def step_impl(context):
    context.driver.execute_script("window.scrollTo(0,900)")
    assert context.driver.find_element(By.XPATH, "//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')]").text == "União das Belas Orquideas Brancas e Lilás"
    assert context.driver.find_element(By.CSS_SELECTOR, "div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(2) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(1) div.product-item a.list-carousel div.price > span.actual-price").text == "R$ 209,90"
    context.driver.find_element(By.XPATH, "//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')]").click() 

### Teste Produto 1 ###
@when(u'clico no produto Dupla de Orquídeas Amarelas para Presente')
def step_impl(context):
    context.driver.execute_script("window.scrollTo(0,900)")
    assert context.driver.find_element(By.XPATH, "//h3[contains(text(),'Dupla de Orquídeas Amarelas para Presente')]").text == "Dupla de Orquídeas Amarelas para Presente"
    assert context.driver.find_element(By.XPATH, "//span[contains(text(),'R$ 199,90')]").text == "R$ 199,90"
    context.driver.find_element(By.XPATH, "//h3[contains(text(),'Dupla de Orquídeas Amarelas para Presente')]").click() 

###Teste Produto 2 ###
@when(u'clico no produto Orquídea Mini Rara Amarela no Box Grafismo')
def step_impl(context):
    context.driver.execute_script("window.scrollTo(0,900)")
    assert context.driver.find_element(By.XPATH, "//h3[contains(text(),'Orquídea Mini Rara Amarela no Box Grafismo')]").text == "Orquídea Mini Rara Amarela no Box Grafismo"
    assert context.driver.find_element(By.CSS_SELECTOR, "div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(2) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(3) div.product-item a.list-carousel div.price > span.actual-price").text == "R$ 159,90"
    context.driver.find_element(By.XPATH, "//h3[contains(text(),'Orquídea Mini Rara Amarela no Box Grafismo')]").click() 
    
@when(u'digito o CEP, data de entrega, periodo de entrega')
def step_impl(context):
    context.driver.find_element(By.ID, "ContentSite_txtZip").click() 
    context.driver.find_element(By.ID, "ContentSite_txtZip").send_keys("04535902")
    context.driver.find_element(By.CSS_SELECTOR, ".jOpenShippingPopup").click()
    context.driver.find_element(By.CSS_SELECTOR, ".selectDate").click() 
    context.driver.find_element(By.ID, "ContentSite_txtZip").send_keys("2024.07.31")
    context.driver.find_element(By.XPATH, "//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[10]/div[3]/div[6]/div[1]/ul[1]/li[3]/input[1]").click() 
    context.driver.find_element(By.ID, "btConfirmShippingData").click() 
    context.driver.find_element(By.ID, "ContentSite_lbtBuy").click() 

@then(u'adiciono o produto no carrinho')
def step_impl(context):
    context.driver.find_element(By.ID, "ContentSite_Basketcontrol1_rptBasket_imbFinalize_0").click() 
     
@when(u'digito o nome, tipo de endereco, numero da casa do destinatario e cartao em branco')
def step_impl(context):
    context.driver.find_element(By.ID, "txtDsDestinationName").click() 
    context.driver.find_element(By.ID, "txtDsDestinationName").send_keys("Cristina")
    
    context.driver.find_element(By.ID, "ContentSite_rptDeliveryAddress_rbtFgPersonalAddress_0_1_0").click() 
    
    context.driver.find_element(By.ID, "txtDsNumber").click() 
    context.driver.find_element(By.ID, "txtDsNumber").send_keys("70")
    
    context.driver.find_element(By.ID, "rbBlankGiftCard").click() 
    
    context.driver.find_element(By.ID, "btnContinue").click()
    time.sleep(10)

@when(u'removo o produto')
def step_impl(context):
    context.driver.back() 
    context.driver.back()
    
    context.driver.find_element(By.ID, "ContentSite_Basketcontrol1_rptBasket_rptBasketItems_0_lbtRemoveProduct_0").click() 
    
@then(u'verifico que o carrinho esta vazio')
def step_impl(context):
    numero_carrinho = context.driver.find_elements(By.CSS_SELECTOR, ".bg_carrinho jBasketLink")
    assert len(numero_carrinho) == 0  
   
@then(u'realizo logout')
def step_impl(context):
    context.driver.find_element(By.CSS_SELECTOR, "#perfil-hidden > img").click() 
    context.driver.find_element(By.CSS_SELECTOR, "li:nth-child(11) > a:nth-child(2)").click() 