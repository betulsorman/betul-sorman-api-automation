@caller_get_user
Feature: Get User Callers

  Background:
    Given url baseUrl
    * def model = read(modelPath + '/user/user.json')
    And path "/kloia-users-demos"

  @get_user_caller
  Scenario: Successful Get User Caller
    When method GET
    Then status 200
    And match each response.data[*].id == model.successUserArrayResponse.id
    And match each response.data[*].attributes == model.successUserArrayResponse.attributes
    * def firstUserId = response.data[0]["id"]
    * karate.log("firstUserId: " , firstUserId)



