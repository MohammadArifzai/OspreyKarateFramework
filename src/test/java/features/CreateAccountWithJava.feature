@Regression
Feature: Create Account with Java Data Generator

  @CreateAccount_3
  Scenario: Create An Account with Random Email address
    Given url BASE_URL
    And path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def randomEmail = dataGenerator.getEmail()
    And request
      """
      {
        "email": "#(randomEmail)",
        "firstName": "Mohammad",
        "lastName": "Edris",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Student",
        "dateOfBirth": "1998-07-13"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == randomEmail