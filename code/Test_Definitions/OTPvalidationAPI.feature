Feature: CAMARA OTPvalidationAPI, v:wip 

# Environment variables:
# * api_root: API root of the server URL
# * phone_number: A public identifier (MSISDN) addressing a telephone subscriptionable to receive SMS. Accordingly to E.164 standard, must be prefixed with '+'.
# * message: Message template used to compose the content of the SMS sent to the phone number. It must include the following label indicating where to include the short code {{code}}
# * authentication_id: identifier of a a send-code request. Identifier retrieved in send-code response.

# * max_try: Maximum allowed try to validate the code for a given autorisation request.
# References to OAS spec schemas refer to schemas specifies in one-time-password-sms.yaml, version wip

Background: Common OTPvalidationAPI setup
    Given an environment at "apiRoot"                                                               |
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

######################
# Happy path scenarios
######################

  @OTPvalidationAPI_01_send_code_success_scenario
  Scenario: Validations for sucess send-code scenario
    # valid testing
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator" 
    And the response body complies with the OAS schema at "/components/schemas/SendCodeResponse"

@OTPvalidationAPI_02_validate_code_sucess_scenario
Scenario:  Validations for sucess validate-code scenario
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 204

########################################
# Rainy path scenarios for validate_code
########################################

@OTPvalidationAPI_03_validate_code_invalid_otp_scenario
Scenario:  Validations for invalid otp validate-code scenario
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to a value distinct from the value received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.INVALID_OTP"
    And the response property "$.message" contains a user friendly text


@OTPvalidationAPI_04_validate_code_verification_expired_scenario
Scenario:  Validations for verification expired validate-code scenario
    Given an authenticationId has been retrieved from a send-code request
    And the request body property "$.code" is set to the received in the SMS
    And the resource "/one-time-password-sms/v0/validate-code"
    And the time elapsed since the send-code exceed the allowed time
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_EXPIRED"
    And the response property "$.message" contains a user friendly text

@OTPvalidationAPI_05_validate_code_verification_failed_scenario
Scenario:  Validations for verification failed validate-code scenario whe maximum number of attempts for this authenticationId was exceeded without providing a valid OTP
    Given an authenticationId has been retrieved from a send-code request
    And (config_var:"max-try"-1) calls with the request body property "$.code" set to a value distinct from the value received in the SMS were performed
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.VERIFICATION_FAILED"
    And the response property "$.message" contains a user friendly text


# Following part describe scenario to test error code defined in the yaml
# These scenarios cover following http status: 400, 401, 403, 404, 405, 406, 415

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

 @OTPvalidationAPI_400.3_send_code_incorrect_phone_number_request_body
  Scenario: Incorrect phone number in the request
    Given the request body property "$.phoneNumber" is set to "3301"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 

 @OTPvalidationAPI_400.4_send_code_missing_code_request_body
  Scenario: Missing {{code}} in message request attribute
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to "message without code"
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
    Then the response property "$.status" is 403
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @OTPvalidationAPI_401.2_send_code_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then  the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @OTPvalidationAPI_401.3_send_code_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

###########################
#  403 errors for send_code
###########################

  @OTPvalidationAPI_403.1_send_code_too_many_request
  Scenario: Too many request for same msisdn
    Given the maximun allowed request for a msisdn has been reached
    And the resource "/one-time-password-sms/v0/send-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "PERMISSION_DENIED"
    And the response property "$.message" contains a user friendly text

###########################
#  404 errors for send_code
###########################

  @OTPvalidationAPI_404.1_send_code_resource_not_found
  Scenario: resource not found 
      Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
      And the request body property "$.message" is set to config_var: "message"
      And the resource "/one-time-password-sms/send-code"
      When the HTTP "POST" request is sent
      Then the response property "$.status" is 404
      And the response header "x-correlator" has same value as the request header "x-correlator" 
      And the response property "$.message" contains a user friendly text

###########################
#  405 errors for send_code
###########################

  @OTPvalidationAPI_405.1_send_code_method_not_allowed
  Scenario: method not allowed
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

  @OTPvalidationAPI_401.2_validate_code_expired_access_token
  Scenario: Expired access token
    Given the header "Authorization" is set to an expired access token
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @OTPvalidationAPI_401.3_validate_code_invalid_access_token
  Scenario: Invalid access token
    Given the header "Authorization" is set to an invalid access token
    And the resource "/one-time-password-sms/v0/validate-code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

###############################
#  404 errors for validate_code
###############################

  @OTPvalidationAPI_404.1_validate_code_resource_not_found
  Scenario: resource not found 
      Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
      And the request body property "$.message" is set to config_var: "message"
      And the resource "/one-time-password-sms/validate-code"
      When the HTTP "POST" request is sent
      Then the response property "$.status" is 404
      And the response header "x-correlator" has same value as the request header "x-correlator" 
      And the response property "$.message" contains a user friendly text

###############################
#  405 errors for validate_code
###############################

  @OTPvalidationAPI_405.1_validate_code_method_not_allowed
  Scenario: methpd not allowed
      Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
      And the request body property "$.message" is set to config_var: "message"
      And the resource "/one-time-password-sms/v0/validate-code"
      When the HTTP "GET" request is sent
      Then the response property "$.status" is 405
      And the response header "x-correlator" has same value as the request header "x-correlator" 

###########################
#  406 errors for send_code
###########################

@OTPvalidationAPI_406_validate_code_not_acceptable_scenario
Scenario:  Not acceptable accept
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
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
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the resource "/one-time-password-sms/v0/validate-code"
    And the header "Content-Type" is set to "application/xml"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 415
    And the response property "$.code" is "UNSUPPORTED_MEDIA_TYPE"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator" 
