@update_pet_feature
Feature: Update Pet Test Suite

  Background:
    Given url baseUrl
    And path "pet"
    * def model = read(modelPath + '/pet/pet.json')
    * def requestBody = model.requestBody
    * def responseBody = model.responseBody
    * def utils = Java.type('helpers.Utils')

  @update_pet @smoke
  Scenario: Successfully Update Existing Pet
    * def petId = karate.call(featuresPath + '/pet/createPet.feature@pet_create').petId
    * requestBody.id = petId
    * requestBody.category.id = utils.generateRandomNumbersInt(8)
    * requestBody.category.name = utils.generateRandomString(8)
    * requestBody.name = "Updated_" + utils.generateRandomString(5)
    * requestBody.photoUrls = [utils.generateRandomString(8)]
    * requestBody.tags = [{ id: utils.generateRandomNumbersInt(8), name: utils.generateRandomString(8) }]
    * requestBody.status = utils.generateRandomStatus()
    And request requestBody
    When method PUT
    Then status 200
    And match response.id == petId
    And match response.name == requestBody.name
    And match response == responseBody
    * karate.log("Updated Pet ID: ", petId)

