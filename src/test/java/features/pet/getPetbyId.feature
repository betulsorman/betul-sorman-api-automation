@get_pet_by_id_feature
Feature: Get Pet By Id Test Suite

  Background:
    Given url baseUrl
    * def model = read(modelPath + '/pet/pet.json')
    * def petId = karate.call(callersPath + '/pet/getPetCaller.feature@get_pet_caller').firstPetId
    And path "pet" , petId

  @get_pet_by_id
  Scenario: Successful Get Pet By Id
    * karate.log("petId: " , petId)
    When method GET
    Then status 200
    And match each response[*].id == model.successResponseBody.id
    * karate.log("petId: " , petId)