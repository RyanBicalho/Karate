Feature: Listar Usuarios
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

Scenario: Lista de usuarios
    Given url baseUrl
    And path "users"
    When method get
    Then status 200
    And match response == "#array"
    And match response contains [{id: "#string",name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string" }]
    