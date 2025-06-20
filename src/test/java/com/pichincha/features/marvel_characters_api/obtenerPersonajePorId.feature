@REQ_HU111 @HU111 @get_character_by_id @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU111 Obtener personaje por ID (microservicio para gestión de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * def headers = { 'Content-Type': 'application/json' }
  @id:1 @obtenerPersonajePorId @respuestaExitosa200
  Scenario: T-API-HU111-CA06-Obtener personaje por ID exitosamente 200 - karate
    * def characterId = 1
    Given path 'characters', characterId
    And headers headers
    When method GET
    Then status 200
    # And match response.id == characterId
    # And match response == { id: '#number', name: '#string', alterego: '#string', description: '#string', powers: '#array' }
  @id:2 @obtenerPersonajePorId @personajeNoEncontrado404
  Scenario: T-API-HU111-CA07-Personaje no encontrado por ID 404 - karate
    * def characterId = 99999
    Given path 'characters', characterId
    And headers headers
    When method GET
    Then status 404
    # And match response.error == '#string'
    # And match response == { error: '#string' }
  @id:3 @obtenerPersonajePorId @errorInterno500
  Scenario: T-API-HU111-CA08-Error interno al obtener personaje por ID 500 - karate
    * def characterId = 1
    Given path 'characters', characterId
    And headers headers
    When method GET
    Then status 500
    # And match response.error == '#string'
    # And match response == { error: '#string' }
