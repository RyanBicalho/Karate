Feature: Atualizar Usuario
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas
    
Scenario: Atualizar Usuario por Nome e Email
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    And request {name: "Pao de batata", email: "paodebatata@email.com"}
    When method put
    Then status 200
    And match response contains {id:"#string", name:"Pao de batata", email:"paodebatata@email.com", createdAt:"#string", updatedAt:"#string"}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")

Scenario: Atualizar usuario por Id não existente
    Given url baseUrl
    And path "users", "d483cf67-6f87-4def-8f40-5e80316a115e"
    And request {name: "Pao de batata", email: "paodebatata@email.com"}
    When method put
    Then status 404

Scenario: Atualiza Usuraio com email inválido fora do padrao
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    And request {name : "Pao de batata", email : "paodebatataemail.com"}
    When method put
    Then status 400
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")
    
    
Scenario: Atualiza Usuario com mesmo email
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    And request {name : "Pao de batata", email : "paodealho@email.com"}
    When method put
    Then status 422
    And match response contains { error: "E-mail already in use."}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")
    

Scenario: Atualiza Usuario com mais de 100 caracteres, Nome
    Given url baseUrl
    And path "users", id.response.id
    And request {name : "PaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatataPaodebatata", email : "paodefarinha@email.com"}
    When method put
    Then status 400
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")
    

Scenario: Atualiza usuario com mais de 60 caracteres, Email
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    And request {name : "Pao de queijo", email : "paodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatatapaodebatata@email.com"}
    When method put
    Then status 400
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")
    


