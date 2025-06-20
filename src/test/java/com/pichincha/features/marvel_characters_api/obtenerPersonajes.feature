@REQ_HU111 @HU111 @get_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU111 Obtener todos los personajes (microservicio para gestión de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * def headers = { 'Content-Type': 'application/json' }
  @id:1 @obtenerTodosPersonajes @respuestaExitosa200
  Scenario: T-API-HU111-CA01-Obtener todos los personajes exitosamente 200 - karate
    Given path 'characters'
    And headers headers
    When method GET
    Then status 200
    # And match response == '#array'
    # And match each response contains { id: '#number', name: '#string', alterego: '#string' }
  @id:2 @obtenerTodosPersonajes @errorInterno500
  Scenario: T-API-HU111-CA02-Error interno al obtener todos los personajes 500 - karate
    Given path 'characters'
    And headers headers
    When method GET
    Then status 500
    # And match response.error == '#string'
    # And match response == { error: '#string' }
