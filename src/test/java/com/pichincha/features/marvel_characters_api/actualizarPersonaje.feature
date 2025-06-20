@REQ_HU111 @HU111 @update_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU111 Actualizar un personaje existente (microservicio para gestión de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * def headers = { 'Content-Type': 'application/json' }
  @id:1 @actualizarPersonaje @actualizacionExitosa200
  Scenario: T-API-HU111-CA09-Actualizar personaje exitosamente 200 - karate
    * def characterId = 1
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    Given path 'characters', characterId
    And headers headers
    And request jsonData
    When method PUT
    Then status 200
    # And match response.id == characterId
    # And match response.name == jsonData.name
  @id:2 @actualizarPersonaje @datosInvalidos400
  Scenario: T-API-HU111-CA10-Error al actualizar personaje con datos inválidos 400 - karate
    * def characterId = 1
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    Given path 'characters', characterId
    And headers headers
    And request jsonData
    When method PUT
    Then status 400
    # And match response.error == '#string'
    # And match response == { error: '#string' }
  @id:3 @actualizarPersonaje @personajeNoEncontrado404
  Scenario: T-API-HU111-CA11-Personaje no encontrado al actualizar 404 - karate
    * def characterId = 99999
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    Given path 'characters', characterId
    And headers headers
    And request jsonData
    When method PUT
    Then status 404
    # And match response.error == '#string'
    # And match response == { error: '#string' }
  @id:4 @actualizarPersonaje @errorInterno500
  Scenario: T-API-HU111-CA12-Error interno al actualizar personaje 500 - karate
    * def characterId = 1
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    Given path 'characters', characterId
    And headers headers
    And request jsonData
    When method PUT
    Then status 500
    # And match response.error == '#string'
    # And match response == { error: '#string' }
