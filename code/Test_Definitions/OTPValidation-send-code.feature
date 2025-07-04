Feature: CAMARA OTPvalidationAPI, v1.1.1-rc.3 - operation sendCode

# Environment variables:
# * api_root: API root of the server URL
# * phone_number: A public identifier (MSISDN) addressing a telephone subscriptionable to receive SMS. Accordingly to E.164 standard, must be prefixed with '+'.
#     *For additional test scenarios, operator could provide phone number for line that cannot receive SMS, line that blocked SMS reception, not belonging to the operator, designing a landline number.
# * message: Message template used to compose the content of the SMS sent to the phone number. It must include the following label indicating where to include the short code {{code}}. Operator could specified a max_lenght for the message.
# References to OAS spec schemas refer to schemas specifies in one-time-password-sms.yaml

Background: Common OTPvalidationAPI setup
    Given an environment at "apiRoot"
    and the resource "/one-time-password-sms/v1rc3/send-code"                                                            |

    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the request body is set by default to a request body compliant with the schema

####################################
# Happy path scenarios for send-code
####################################

@OTPvalidationAPI_01_send_code_success_scenario
Scenario: Validation for sucess send-code scenario
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "/components/schemas/SendCodeResponse"

@OTPvalidationAPI_02_send_code_success_scenario_without_x-correlator
Scenario: Validation for sucess send-code scenario without x-correlator
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
    And the header "Authorization" is set
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 200
    And the response header "Content-Type" is "application/json"
    And the response body complies with the OAS schema at "/components/schemas/SendCodeResponse"



################################################################################
# Rainy path scenarios for send-code
################################################################################

# Following part describe scenario to test error code defined in the yaml
# These scenarios cover following http status: 400, 401, 403 & 404

# Following error code is not managed in scenarios
# -429 as it could not be easily tested

###########################
#  400 errors for send-code
###########################

@OTPvalidationAPI_400.1_send_code_no_request_body
Scenario: Missing request body for send_code
    Given the request body is not included
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_400.2_send_code_empty_request_body
Scenario: Empty object as request body for send_code
    Given the request body is set to "{}"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_400.4_send_code_incorrect_phone_number_request_body
Scenario: Incorrect phone number in the request
    Given the request body property "$.phoneNumber" is set to "3301"
    And the request body property "$.message" is set to config_var: "message"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_400.5_send_code_missing_message
Scenario: Missing message request attribute
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is not valued
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_400.6_send_code_missing_code_request_body
Scenario: Missing {{code}} in message request attribute
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to "message without code"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_400.7_send_code_message_too_long
Scenario: message attribute exceed maximum lenght authorized
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is longer than config_var:"max_lenght"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 400
    And the response property "$.code" is "INVALID_ARGUMENT"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

###########################
#  401 errors for send-code
###########################

@OTPvalidationAPI_401.1_send_code_no_authorization_header
Scenario: No Authorization header for send-code
    Given the header "Authorization" is removed
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_401.2_send_code_expired_access_token
Scenario: Expired  for send-code
    Given the header "Authorization" is set to an expired 
    When the HTTP "POST" request is sent
    Then  the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_401.3_send_code_invalid_access_token
Scenario: Invalid access token for send-code
    Given the header "Authorization" is set to an invalid access token
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

###########################
#  403 errors for send-code
###########################

@OTPvalidationAPI_03_send_code_max_otp_code
Scenario: Validation for failed scenario too many codes have been requested
    Given the request body property "$.phoneNumber" is set to config_var: "phone_number"
    And the request body property "$.message" is set to config_var: "message"
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
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_NOT_ALLOWED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_05_send_code_phone_number_not_allowed_3
Scenario: Validation for failed scenario for a phone number that target a landline
    Given the request body property "$.phoneNumber" is set to a phone number that target a landline
    And the request body property "$.message" is set to config_var: "message"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_NOT_ALLOWED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

@OTPvalidationAPI_06_send_code_phone_number_blocked
Scenario: Validation for failed scenario for a phone number that block SMS reception
    Given the request body property "$.phoneNumber" is set to a phone number that that has an active SMS barring
    And the request body property "$.message" is set to config_var: "message"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 403
    And the response property "$.code" is "ONE_TIME_PASSWORD_SMS.PHONE_NUMBER_BLOCKED"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"

###########################
#  404 errors for send-code
###########################

@OTPvalidationAPI_404.1_send_code_phone_number_not_belong_to_operator
Scenario: Validation for failed scenario for a phone number that did not belong to the operator
    Given the request body property "$.phoneNumber" is set to a phone number that did not belong to the operator
    And the request body property "$.message" is set to config_var: "message"
    When the HTTP "POST" request is sent
    Then the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text
    And the response header "x-correlator" has same value as the request header "x-correlator"
