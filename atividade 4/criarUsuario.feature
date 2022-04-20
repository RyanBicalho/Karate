Feature: Criar Usuario
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

Scenario: Registrar Usuario
    Given url baseUrl
    And path "users"
    And request {name : "Pao de queijo", email : "#('paodequeijo' + java.util.UUID.randomUUID() + '@email.com')"}
    When method post
    Then status 201
    And match response contains { name:"Pao de queijo", email: "#(response.email)" }
    * def paoDoce = response.id
    * def paoDeSal = call read("hook.feature@delete")

Scenario: Criar Usuraio com email inválido
    Given url baseUrl
    And path "users"
    And request {name : "Pao de queijo", email : "paodequeijoemail.com"}
    When method post
    Then status 400

Scenario: Criar Usuario com mesmo email
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users"
    And request {name : "Pao de queijo", email : "paodequeijo@email.com"}
    When method post
    Then status 422
    And match response contains {error: "User already exists."}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")

Scenario: Criar Usuario com mais de 100 caracteres, Nome
    Given url baseUrl
    And path "users"
    And request {name : "PaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijoPaodequeijo", email : "paodefarinha@email.com"}
    When method post
    Then status 400

Scenario: Criar usuario com mais de 60 caracteres, Email
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
    And path "users"
    And request {name : "Pao de queijo", email : "paodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijopaodequeijo@email.com"}
    When method post
    Then status 400
    

    
    
    
