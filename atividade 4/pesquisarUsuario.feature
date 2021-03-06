Feature: Pesquisar Usuario
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

Scenario: Pesquisar usuario, Nome
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "search"
    And param value = id.response.name
    When method get 
    Then status 200
    And match response == "#array"
    And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")

    Scenario: Pesquisar usuario, Email
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "search"
    And param value = id.response.email
    When method get 
    Then status 200
    And match response == "#array"
    And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")
    