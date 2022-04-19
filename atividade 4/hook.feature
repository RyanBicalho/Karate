Feature: Hook
   
@registrar
Scenario: Registrar usuario
    Given url baseUrl 
    And path "users"
    And request {name : "Pao de queijo", email : "paodequeijo@email.com"}
    When method post
    Then status 201

@delete
Scenario: Deletar usuario
    Given url baseUrl
    And path "users", paoDoce
    When method delete
    Then status 204
    