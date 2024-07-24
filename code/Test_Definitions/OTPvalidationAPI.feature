Feature: CAMARA OTPvalidationAPI, v:wip 

# Environment variables:
# * api_root: API root of the server URL
# * phone_number: A public identifier (MSISDN) addressing a telephone subscriptionable to receive SMS. Accordingly to E.164 standard, must be prefixed with '+'.
#     *For additional test scenarios, operator could provide phone number for line that cannot receive SMS, line that blocked SMS reception, not belonging to the operator, designing a landline number.
# * message: Message template used to compose the content of the SMS sent to the phone number. It must include the following label indicating where to include the short code {{code}}. Operator could specified a max_lenght for the message.
# * authentication_id: identifier of a a send-code request. Identifier retrieved in send-code response.
# * max_sent: Maximum allowed request to send code for a given device
# * max_try: Maximum allowed try to validate the code for a given autorisation request.
# References to OAS spec schemas refer to schemas specifies in one-time-password-sms.yaml, version wip

Background: Common OTPvalidationAPI setup
    Given an environment at "apiRoot"                                                               |
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

####################################
# Happy path scenarios for send-code
####################################

  @OTPvalidationAPI_01_send_code_success_scenario
  Scenario: Validation for sucess send-code scenario
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator" 
    And the response body complies with the OAS schema at "/components/schemas/SendCodeResponse"

  @OTPvalidationAPI_02_send_code_success_scenario_without_x-correlator
  Scenario: Validation for sucess send-code scenario without x-correlator
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    And the header "Authorization" is not set
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 200
    And the response header "Content-Type" is "application/json"
    And the response body complies with the OAS schema at "/components/schemas/SendCodeResponse"


########################################
# Happy path scenarios for validate-code
########################################

@OTPvalidationAPI_01_validate_code_sucess_scenario
Scenario:  Validation for sucess validate-code scenario
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 204
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_02_validate_code_sucess_scenario_without_x-correlator
Scenario:  Validation for sucess validate-code scenario without x-correlator
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    And the header "Authorization" is not set
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 204


########################################
# Rainy path scenarios for sent_code
########################################

@OTPvalidationAPI_03_send_code_max_otp_code
  Scenario: Validation for failed scenario too many codes have been requested
  Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    And (config_var:"max_send"-1) of send-code requests for this phone number has been submitted
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.MAX_OTP_CODES_EXCEEDED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_04_send_code_phone_number_not_allowed
  Scenario: Validation for failed scenario for a phone number that cannot receive SMS
  Given the request body property "$.phoneNumber" is set to a phone number that cannot receive SMS
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_NOT_ALLOWED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_05_send_code_phone_number_not_allowed_3
  Scenario: Validation for failed scenario for a phone number that target a landline
  Given the request body property "$.phoneNumber" is set to a phone number that target an landline
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_NOT_ALLOWED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_06_send_code_phone_number_blocked
  Scenario: Validation for failed scenario for a phone number that block SMS reception
  Given the request body property "$.phoneNumber" is set to a phone number that that has an active SMS barring
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_BLOCKED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

# Following part describe scenario to test error code defined in the yaml
# These scenarios cover following http status: 400, 401, 404, 405, 406, 415

# Following error code is not managed in scenarios
# -429 as it could not be easily tested

###########################
#  400 errors for send_code
###########################

  @OTPvalidationAPI_400.1_send_code_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

  @OTPvalidationAPI_400.2_send_code_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.3_missing_phone_number_in_request_body
  Scenario: Missing phone number in the request
    Given the request body property "$.phoneNumber" is not set
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.4_send_code_incorrect_phone_number_request_body
  Scenario: Incorrect phone number in the request
    Given the request body property "$.phoneNumber" is set to "3301"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.5_send_code_missing_message
  Scenario: Missing message request attribute
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is not valued
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.6_send_code_missing_code_request_body
  Scenario: Missing {{code}} in message request attribute
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to "message without code"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.7_send_code_message_too_long
  Scenario: message attribute exceed maximum lenght authorized
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is longer than config_var:"max_lenght"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

###########################
#  401 errors for send_code
###########################

  @OTPvalidationAPI_401.1_send_code_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

  @OTPvalidationAPI_401.2_send_code_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then  the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

  @OTPvalidationAPI_401.3_send_code_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 


###########################
#  404 errors for send_code
###########################

  @OTPvalidationAPI_404.1_send_code_phone_number_not_belong_to_operator
    Scenario: Validation for failed scenario for a phone number that did not belong to the operator
    Given the request body property "$.phoneNumber" is set to a phone number that did not belong to the operator
      And the request body property "$.message" is set to config_var: "message"
      And the resource "/one-time-password-sms/v0/send-code"
      When the HTTP "POST" request is sent
      Then the response property "$.status" is 404
      And the response property "$.code" is "NOT_FOUND"
      And the response property "$.message" contains a user friendly text
      And the response header "x-correlator" has same value as the request header "x-correlator" 
    
###########################
#  405 errors for send_code
###########################

  @OTPvalidationAPI_405.1_send_code_method_not_allowed
  Scenario: method not allowed
  # As API Gateway can prevent this test by restricting path/routes this test should be considered as optional
      Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
      And the request body property "$.message" is set to config_var: "message"
      And the resource "/one-time-password-sms/v0/send-code"
      When the HTTP "GET" request is sent
      Then the response property "$.status" is 405
      And the response header "x-correlator" has same value as the request header "x-correlator"
      And the response property "$.message" contains a user friendly text

###########################
#  406 errors for send_code
###########################

@OTPvalidationAPI_406_send_code_not_acceptable_scenario
Scenario:  Not acceptable accept
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    And the header "Accept" is set to "application/xml"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 406
    And the response property "$.code" is "NOT_ACCEPTABLE"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

###########################
#  415 errors for send_code
###########################

@OTPvalidationAPI_415_send_code_unsupported_media_type_scenario
Scenario:  Not acceptable accept
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    And the header "Content-Type" is set to "application/xml"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 415
    And the response property "$.code" is "UNSUPPORTED_MEDIA_TYPE"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 


########################################
# Rainy path scenarios for validate_code
########################################

@OTPvalidationAPI_08_validate_code_invalid_otp_scenario
Scenario:  Validations for invalid otp validate-code scenario
    Given request body property "$.authenticationId" is set to the value from send-code request
    And the request body property "$.code" is set to a value distinct from the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.INVALID_OTP"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_09_validate_code_verification_expired_scenario_1
Scenario:  Validations for verification expired validate-code scenario
    Given request body property "$.authenticationId" is set to the value from send-code request
    And the request body property "$.code" is set to the received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    And the time elapsed since the send-code exceed the allowed time
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_EXPIRED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_10_validate_code_verification_expired_scenario_2
Scenario:  Validations for verification expired because a new one has been requested for the same phone number
    Given Two send-code request has been sequentially triggered for the same phoneNumber
    And request body property "$.authenticationId" is set to the value got for the first send-code request
    And the request body property "$.code" is set to the received in the SMS for this first request
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_EXPIRED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_11_validate_code_verification_expired_scenario_3
Scenario:  Validations for verification expired because authenticationId is no longer valid because it has already been used
    Given a validate-code has been succesfully performed for a authenticationId
    And request body property "$.authenticationId" is valued again with this authenticationId
    And the request body property "$.code" is set to the code received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_EXPIRED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

@OTPvalidationAPI_12_validate_code_verification_failed_scenario
Scenario:  Validations for verification failed validate-code scenario whe maximum number of attempts for this authenticationId was exceeded without providing a valid OTP
    Given an authenticationId has been retrieved from a send-code request
    And (config_var:"max_try"-1) calls with the request body property "$.code" set to a value distinct from the value received in the SMS were performed
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_FAILED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

# Following part describe scenario to test error code defined in the yaml
# These scenarios cover following http status: 400, 401, 404, 405, 406, 415

# Following error code is not managed in scenarios
# -429 as it could not be easily tested
# -403 as there is no valid scenario

###############################
#  400 errors for validate_code
###############################

  @OTPvalidationAPI_400.1_validate_code_no_request_body
  Scenario: Missing request body
    Given the request body is not included
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

  @OTPvalidationAPI_400.2_validate_code_empty_request_body
  Scenario: Empty object as request body
    Given the request body is set to "{}"
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

  @OTPvalidationAPI_400.3_validate_code_missing_authenticationId
  Scenario: missing authenticationId as request parameter
    Given the request body property "$.authenticationId" is not valued
    And the request body property "$.code" is set to a format valid value
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

  @OTPvalidationAPI_400.3_validate_code_missing_code
  Scenario: missing code as request parameter
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is not valued
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response status code is 400
    And the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

  @OTPvalidationAPI_400.4_validate_code_exceed_code_max_length
    Scenario: exceed the maxLength for code
      Given request body property "$.authenticationId" is set to the value from send-code request
      And the request body property "$.code" is set to "thisCodeExceedsTenCharacters"
      And the resource "/one-time-password-sms/v0/validate-code"
      When the HTTP "POST" request is sent
      Then the response status code is 400
      And the response property "$.status" is 400
      And the response property "$.code" is "INVALID_ARGUMENT"
      And the response property "$.message" contains a user friendly text
      And the response header "x-correlator" has same value as the request header "x-correlator"

###############################
#  401 errors for validate_code
###############################

  @OTPvalidationAPI_401.1_validate_code_no_authorization_header
  Scenario: No Authorization header
    Given the header "Authorization" is removed
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 


  @OTPvalidationAPI_401.2_validate_code_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 


  @OTPvalidationAPI_401.3_validate_code_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 


###############################
#  404 errors for validate_code
###############################

  @OTPvalidationAPI_404_validate_code_resource_not_found
  Scenario: resource not found 
      Given the request body property "$.authenticationId" is set to an unknown value
      And the resource "/one-time-password-sms/validate-code"
      When the HTTP "POST" request is sent
      Then the response property "$.status" is 404
      And the response property "$.code" is "NOT_FOUND"

      And the response header "x-correlator" has same value as the request header "x-correlator" 
      And the response property "$.message" contains a user friendly text

###############################
#  405 errors for validate_code
###############################

  @OTPvalidationAPI_405_validate_code_method_not_allowed
  Scenario: method not allowed
  # As API Gateway can prevent this test by restricting path/routes this test should be considered as optional
      Given an authenticationId has been retrieved from a send-code request
      And the request body property "$.code" is set to the value received in the SMS
      And the resource "/one-time-password-sms/v0/validate-code"
      When the HTTP "GET" request is sent
      Then the response property "$.status" is 405
      And the response header "x-correlator" has same value as the request header "x-correlator" 

###############################
#  406 errors for validate_code
###############################

@OTPvalidationAPI_406_validate_code_not_acceptable_scenario
Scenario:  Not acceptable accept
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    And the header "Accept" is set to "application/xml"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 406
    And the response property "$.code" is "NOT_ACCEPTABLE"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

###########################
#  415 errors for send_code
###########################

@OTPvalidationAPI_415_validate_code_unsupported_media_type_scenario
Scenario:  Not acceptable accept
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    And the header "Content-Type" is set to "application/xml"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 415
    And the response property "$.code" is "UNSUPPORTED_MEDIA_TYPE"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 
