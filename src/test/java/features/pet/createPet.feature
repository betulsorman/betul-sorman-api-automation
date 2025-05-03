@create_pet_feature
Feature: Create Pet Test Suite

  Background:
    Given url baseUrl
    And path "pet"
    * def model = read(modelPath + '/pet/pet.json')
    * def requestBody = model.requestBody
    * def responseBody = model.responseBody
    * def utils = Java.type('helpers.Utils')

  @pet_create @smoke
  Scenario: Successful Create Pet
    * requestBody.id = utils.generateRandomNumbersInt(8)
    * requestBody.category.id = utils.generateRandomNumbersInt(8)
    * requestBody.category.name = utils.generateRandomString(8)
    * requestBody.name = utils.generateRandomString(8)
    * requestBody.photoUrls[0] = utils.generateRandomString(8)
    * requestBody.tags[0].id = utils.generateRandomNumbersInt(8)
    * requestBody.tags[0].name = utils.generateRandomString(8)
    * requestBody.status = utils.generateRandomStatus()
    And request requestBody
    When method POST
    Then status 200
    And match response.id == requestBody.id
    And match response.name == requestBody.name
    And match response == responseBody
    * def petId = response.id
    * karate.log("Pet created with ID: " ,petId)
