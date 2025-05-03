@caller_get_pet
Feature: Get Pet Callers

  Background:
    Given url baseUrl
    And path "/pet/findByStatus"
    * def model = read(modelPath + '/pet/pet.json')

  @get_pet_caller @smoke
  Scenario Outline: Successful Get Pet Caller
    * param status = <status>
    * method GET
    * status 200
    * match header Content-Type == "application/json"
    * match each response[*].id == '#present'
    * match each response[*].status == <status>
    * match each response[*].id == '#notnull'
    * def firstPetId = response[0]["id"]
    * karate.log("firstPetId: " , firstPetId)
    Examples:
      | status      |
      | "available" |
      | "pending"   |
      | "sold"      |


