@Regression
Feature: Create Account End 2 End Feature


 # 1) Using /api/accounts/add-primary-account
 # Create an Account.

  #Then using /api/accounts/add-account-car
  #Add a car to Created Account

 # Then using /api/accounts/add-account-phone
 # Add a phone to Created Account.

  Background: Setup Test
Given url BASE_URL
    @End2EndCreateAccount

Scenario:  Create Account add phone and Car to Created Account

  * def createAccountResult = callonce read('CreateAccountWithJava.feature')
  * def createdAccountId = createAccountResult.response.id
  * def generateTokenResult = callonce read('GenerateValidToken.feature')
  * def validToken = "Bearer " + generateTokenResult.response.token
  Given path "/api/accounts/add-account-car"
  And param primaryPersonId = createdAccountId
  And header Authorization = validToken
  And request
      """
      {
        "make": "Honda",
        "model": "Accord",
        "year": "2023",
        "licensePlate": "ary123"
      }
      """
  When method post
  Then status 201
  And assert response.make == "Honda"
  Given path "/api/accounts/add-account-phone"