Feature: Retornar Usuario por ID
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

Scenario: Retornar usuario por Id
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    When method get
    Then status 200
    And match response contains {id: "#(id.response.id)"}
    * def paoDoce = id.response.id
    * def paoDeSal = call read("hook.feature@delete")

Scenario: Retornar usuario por Id não existente
    Given url baseUrl
    And path "users", "d483cf67-6f87-4def-8f40-5e80316a115e"
    When method get
    Then status 404
    
    
