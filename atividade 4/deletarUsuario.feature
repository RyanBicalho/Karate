Feature: Remover Usuario
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

Scenario: Deletar Usuario
    * def id = call read("hook.feature@registrar")
    Given url baseUrl
    And path "users", id.response.id
    When method delete
    Then status 204
    
    

    
Scenario: Deletar Usuario com Id não encontrado
    Given url baseUrl
    And path "users", "d483cf67-6f87-4def-8f40-5e80316a115e"
    When method delete
    Then status 204
