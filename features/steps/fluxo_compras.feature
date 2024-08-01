Feature: Fluxo de Compras


Scenario: Fluxo de compras do produto União das Belas Orquideas Brancas e Lilás
        Given que acesso o site Giuliana Flores
        When entro no menu da pagina inicial
        Then clico em login
        When preencho os campos de login com usuario igor_tiago_galvao@teadit.com.br e senha Andorinha123
        When resolvo um captcha
        Then clico em continuar 
        When clico no produto União das Belas Orquideas Brancas e Lilás
        When digito o CEP, data de entrega, periodo de entrega
        Then adiciono o produto no carrinho
        When digito o nome, tipo de endereco, numero da casa do destinatario e cartao em branco
        When removo o produto 
        Then verifico que o carrinho esta vazio 
        Then realizo logout


Scenario: Fluxo de compras do produto Dupla de Orquídeas Amarelas para Presente
        Given que acesso o site Giuliana Flores
        When entro no menu da pagina inicial
        Then clico em login
        When preencho os campos de login com usuario igor_tiago_galvao@teadit.com.br e senha Andorinha123
        When resolvo um captcha
        Then clico em continuar 
        When clico no produto Dupla de Orquídeas Amarelas para Presente
        When digito o CEP, data de entrega, periodo de entrega
        Then adiciono o produto no carrinho
        When digito o nome, tipo de endereco, numero da casa do destinatario e cartao em branco
        When removo o produto 
        Then verifico que o carrinho esta vazio 
        Then realizo logout

Scenario: Fluxo de compras do produto Orquídea Mini Rara Amarela no Box Grafismo
        Given que acesso o site Giuliana Flores
        When entro no menu da pagina inicial
        Then clico em login
        When preencho os campos de login com usuario igor_tiago_galvao@teadit.com.br e senha Andorinha123
        When resolvo um captcha
        Then clico em continuar 
        When clico no produto Orquídea Mini Rara Amarela no Box Grafismo
        When digito o CEP, data de entrega, periodo de entrega
        Then adiciono o produto no carrinho
        When digito o nome, tipo de endereco, numero da casa do destinatario e cartao em branco
        When removo o produto 
        Then verifico que o carrinho esta vazio 
        Then realizo logout
     