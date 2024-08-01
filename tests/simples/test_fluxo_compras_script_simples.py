import pytest
import time
import json
from selenium import webdriver
from selenium.webdriver.common.by import By

class Test_Fluxo_Compras():
  
  url = "https://www.giulianaflores.com.br"
  
  def setup_method(self, method):
    self.driver = webdriver.Chrome()
    self.driver.implicitly_wait(10)
    self.driver.set_window_size(1440, 900)
    
  def teardown_method(self, method):
    self.driver.quit()
  
  def test_fluxocomprasbanner(self):
        self.driver.get(self.url)
        self.driver.find_element(By.ID, "perfil-hidden").click()   
        self.driver.find_element(By.ID, "UrlLogin").click()

        assert self.driver.find_element(By.CSS_SELECTOR, ".titulo-dept").text == "IDENTIFICAÇÃO"
        
        self.driver.find_element(By.ID, "adopt-accept-all-button").click()
        self.driver.find_element(By.ID, "ContentSite_txtEmail").click()
        self.driver.find_element(By.ID, "ContentSite_txtEmail").send_keys("igor_tiago_galvao@teadit.com.br")
        self.driver.find_element(By.ID, "ContentSite_txtPassword").click()
        self.driver.find_element(By.ID, "ContentSite_txtPassword").send_keys("Andorinha123")
        self.driver.find_element(By.ID, "ContentSite_ibtContinue").click()
        self.driver.find_element(By.ID, "ContentSite_txtPassword").click()
        self.driver.find_element(By.ID, "ContentSite_txtPassword").send_keys("Andorinha123")
        
        time.sleep(10) #resolver manualmente 1)permitir notificações e 2)captcha
        self.driver.find_element(By.ID, "ContentSite_ibtContinue").click() 
        
        self.driver.execute_script("window.scrollTo(0,900)")  #rola a tela até o produto
        
        #Assert Tela 1   
        assert self.driver.find_element(By.XPATH, "//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')]").text == "União das Belas Orquideas Brancas e Lilás"
        time.sleep(5)
        assert self.driver.find_element(By.CSS_SELECTOR, "div.container_full:nth-child(11) main.content-site:nth-child(8) main.main:nth-child(3) section.product-container:nth-child(2) div.product-container-left main.slider.content-left div.carousel-position-left.banner-product.owl-carousel.owl-theme div.owl-wrapper-outer div.owl-wrapper div.owl-item:nth-child(1) div.product-item a.list-carousel div.price > span.actual-price").text == "R$ 209,90"
        
        self.driver.find_element(By.XPATH, "//h3[contains(text(),'União das Belas Orquideas Brancas e Lilás')]").click() #clica no produto
        
        #Assert Tela 2
        assert self.driver.find_element(By.XPATH, "//span[@id='ContentSite_lblProductDsName']").text == "UNIÃO DAS BELAS ORQUIDEAS BRANCAS E LILÁS"
        assert self.driver.find_element(By.CSS_SELECTOR, "div.container_full:nth-child(13) main.content-site:nth-child(4) div:nth-child(9) div.prod:nth-child(1) div.prod_col2 div.preco_prod:nth-child(7) > span.precoPor_prod:nth-child(3)").text == "R$ 209,90"
        
        self.driver.execute_script("window.scrollTo(0,139.5)") #rola a tela
    
        self.driver.find_element(By.ID, "ContentSite_txtZip").click() #digitar CEP
        self.driver.find_element(By.ID, "ContentSite_txtZip").send_keys("04535902")
        self.driver.find_element(By.CSS_SELECTOR, ".jOpenShippingPopup").click()
        
        self.driver.find_element(By.CSS_SELECTOR, ".selectDate").click() #selecionar data de entrega
        self.driver.find_element(By.ID, "ContentSite_txtZip").send_keys("2024.07.31")
        self.driver.find_element(By.XPATH, "//body/form[@id='form1']/div[3]/main[1]/div[6]/div[1]/div[2]/div[10]/div[3]/div[6]/div[1]/ul[1]/li[3]/input[1]").click() #selecionar período do dia da entrega
        self.driver.find_element(By.ID, "btConfirmShippingData").click() #botão OK
        
        self.driver.find_element(By.ID, "ContentSite_lbtBuy").click() #adicionar produto ao carrinho
       
        #Assert Tela 3
        assert self.driver.find_element(By.XPATH, "//a[contains(text(),'União das Belas Orquideas Brancas e Lilás')]").text == "União das Belas Orquideas Brancas e Lilás"
        assert self.driver.find_element(By.CSS_SELECTOR, "div.giuliana2013:nth-child(13) div.content_checkout div.content_basket:nth-child(5) div.upnBasket:nth-child(4) div.box_basket:nth-child(2) div.basket:nth-child(2) ul.prods_basket li:nth-child(1) div.preco_prodBasket.preco-subtotal-produto:nth-child(6) > span.precoPor_basket:nth-child(3)").text == "R$ 209,90"
        self.driver.find_element(By.ID, "ContentSite_Basketcontrol1_rptBasket_imbFinalize_0").click() #botão continuar
         
        #Tela 4
        self.driver.find_element(By.ID, "txtDsDestinationName").click() #nome do destinatário
        self.driver.find_element(By.ID, "txtDsDestinationName").send_keys("Cristina")
    
        self.driver.find_element(By.ID, "ContentSite_rptDeliveryAddress_rbtFgPersonalAddress_0_1_0").click() #tipo de endereço
    
        self.driver.find_element(By.ID, "txtDsNumber").click() #número da casa
        self.driver.find_element(By.ID, "txtDsNumber").send_keys("70")
    
        self.driver.find_element(By.ID, "rbBlankGiftCard").click() #botão cartão em branco
    
        self.driver.find_element(By.ID, "btnContinue").click() #botão continue
        time.sleep(10)

        self.driver.back() #retorna  1 página
        self.driver.back()
    
        self.driver.find_element(By.ID, "ContentSite_Basketcontrol1_rptBasket_rptBasketItems_0_lbtRemoveProduct_0").click() #remover produtos do carrinho
    
        numero_carrinho = self.driver.find_elements(By.CSS_SELECTOR, ".bg_carrinho jBasketLink")
        
        assert len(numero_carrinho) == 0 #valida quantidade   
   
        self.driver.find_element(By.CSS_SELECTOR, "#perfil-hidden > img").click() #menu
        self.driver.find_element(By.CSS_SELECTOR, "li:nth-child(11) > a:nth-child(2)").click() #logout