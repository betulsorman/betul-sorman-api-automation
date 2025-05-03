@delete_pet_by_id_feature
Feature: Get Pet By Id Test Suite

  Background:
    Given url baseUrl
    * def model = read(modelPath + '/pet/pet.json')
    * def petId = karate.call(callersPath + '/pet/getPetCaller.feature@get_pet_caller').firstPetId
    * def responseBody = model.responseBody

  @delete_pet_by_id @smoke
  Scenario: Successfully Delete an Existing Pet
    And path "pet" , petId
    * karate.log("petId: " , petId)
    When method DELETE
    Then status 200
    * karate.log("Deleted petId:", petId)
    And path "pet" , petId
    When method GET
    Then status 404

  @delete_pet_by_id
  Scenario: Delete Pet That Does Not Exist
    * def nonExistentId = 99999999
    * karate.log("Trying to delete non-existent petId:", nonExistentId)
    Given path "pet", nonExistentId
    When method DELETE
    Then status 404