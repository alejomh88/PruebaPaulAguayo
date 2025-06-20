@REQ_HU111 @HU111 @delete_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU111 Eliminar un personaje existente (microservicio para gestión de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * def headers = { 'Content-Type': 'application/json' }
  @id:1 @eliminarPersonaje @eliminacionExitosa204
  Scenario: T-API-HU111-CA13-Eliminar personaje exitosamente 204 - karate
    * def characterId = 1
    Given path 'characters', characterId
    And headers headers
    When method DELETE
    Then status 204
  @id:2 @eliminarPersonaje @personajeNoEncontrado404
  Scenario: T-API-HU111-CA14-Personaje no encontrado al eliminar 404 - karate
    * def characterId = 99999
    Given path 'characters', characterId
    And headers headers
    When method DELETE
    Then status 404
    # And match response.error == '#string'
    # And match response == { error: '#string' }
  @id:3 @eliminarPersonaje @errorInterno500
  Scenario: T-API-HU111-CA15-Error interno al eliminar personaje 500 - karate
    * def characterId = 1
    Given path 'characters', characterId
    And headers headers
    When method DELETE
    Then status 500
    # And match response.error == '#string'
    # And match response == { error: '#string' }
