@REQ_HU111 @HU111 @create_character @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU111 Crear un nuevo personaje (microservicio para gestión de personajes de Marvel)

  Background:
    * url port_marvel_characters_api
    * def headers = { 'Content-Type': 'application/json' }
  @id:1 @crearPersonaje @creacionExitosa201
  Scenario: T-API-HU111-CA03-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    Given path 'characters'
    And headers headers
    And request jsonData
    When method POST
    Then status 201
    # And match response.id == '#number'
    # And match response.name == jsonData.name
  @id:2 @crearPersonaje @datosInvalidos400
  Scenario: T-API-HU111-CA04-Error al crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_invalid.json')
    Given path 'characters'
    And headers headers
    And request jsonData
    When method POST
    Then status 400
    # And match response.error == '#string'
    # And match response == { error: '#string' }
  @id:3 @crearPersonaje @errorInterno500
  Scenario: T-API-HU111-CA05-Error interno al crear personaje 500 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    Given path 'characters'
    And headers headers
    And request jsonData
    When method POST
    Then status 500
    # And match response.error == '#string'
    # And match response == { error: '#string' }
