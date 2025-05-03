@get_pet_by_id_feature
Feature: Get Pet By Id Test Suite

  Background:
    Given url baseUrl
    * def model = read(modelPath + '/pet/pet.json')
    * def petId = karate.call(callersPath + '/pet/getPetCaller.feature@get_pet_caller').firstPetId

  @get_pet_by_id
  Scenario: Successful Get Pet By Id
    And path "pet" , petId
    When method GET
    Then status 200
    And match response.id == petId
    * karate.log("Returned Pet ID: ", response.id)

  @get_pet_by_id
  Scenario: Get Pet By Invalid ID
    * def invalidPetId = 99999999
    Given path "pet", invalidPetId
    When method GET
    Then status 404