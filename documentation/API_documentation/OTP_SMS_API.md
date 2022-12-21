# Overview

One Time Password SMS API is used to send short-lived OTPs (one time passwords) to a phone number via SMS and validate it afterwards, in order to verify the phone number as a proof of possession.

## 1\. Introduction

One Time Password SMS API performs real-time checks to verify that the user possessed the device that carries the indicated mobile phone number. It provides a frequent method of verifying a user's phone number by delivering an OTP (one-time password) through SMS and validating it afterwards.

SMS OTP (one time password) is a secure method for providing one-time access to an application or performing a single transaction. OTP is most effective and legitimate for a single transaction, unlike user-generated passwords. It is a secure authentication method where a text containing a unique alphanumeric or numeric code is sent to a mobile number (MSISDM).

The recipient then uses this code or password as an additional layer of security to login to a service, website or app.


## 2\. Quick Start

The usage of the API is based on several resources.

Before starting to use the API, the developer needs to know about the below specified details:

**API service endpoint**

Two endpoints are defined in One Time Password SMS API: <br>
- POST /one-time-password-sms/v0/send-code : Sends an SMS with the desired message and an OTP code to the received phone number
- POST /one-time-password-sms/v0/validate-code : Verifies the received code as input is valid for the given authentication_id.

**Authentication**

Security access token based on two-legged authentication is required for this API with dedicated scope.

Sample API invocations are presented in Section 4.6.

## 3\. Authentication and Authorization

One Time Password SMS API uses OAUTH 2.0 client credentials grant which is applicable for server to server use cases involving trusted partners or clients without any protected user data involved. [[1]](#1)

## 4\. API Documentation

### 4.1 API Version

0.1.0

### 4.2 Details

#### 4.2.1 Endpoint Definition

Following table defines API endpoints of exposed REST based for One Time Password SMS API operations.

| **Endpoint** | **Operation** | **Description** |
| -------- | --------- | ----------- |
| POST /one-time-password-sms/v0/send-code | **Request to send an OTP code** | Create request in order to send an OTP code with the given message to a mobile phone number |
| POST /one-time-password-sms/v0/validate-code | **Request to validate an OTP code** | Create a request to validate an OTP code for the given authentication_id |


#### One Time Password SMS API Resource Operations:
<br>

| **Request code** |
| -------------------------- |
| **HTTP Request**<br> POST /one-time-password-sms/v0/send-code<br>**Query Parameters**<br> No query parameters are defined.<br>**Path Parameters**<br> No path parameters are defined.<br>**Request Body Parameters**<br> **phone_number**: A phone number belonging to the user. 'E164 with +' format.<br> **message**: Message template used to compose the content of the SMS sent to the phone number. It must include the following label indicating where to include the short code `{{code}}`.

 <br>**Response**<br> **200: OK**<br>  Response body: <br>**authentication_id** : Unique id of the verification attempt the code belongs to.<br> **400:** **INVALID_ARGUMENT**<br> **401:** **UNAUTHENTICATED. <br> **403:** **PERMISSION_DENIED** <br> **403:** ONE_TIME_PASSWORD_SMS.MAX_OTP_CODES_EXCEEDED** <br> **404:** **NOT_FOUND**<br> **405:** **METHOD_NOT_ALLOWED**<br> **406:** **NOT_ACCEPTABLE**<br> **415:** **UNSUPPORTED_MEDIA_TYPE**<br> **429:** **TOO_MANY_REQUESTS**<br> **500:** **INTERNAL**<br> **503:** **UNAVAILABLE**<br> **504:** **TIMEOUT**<br>
<br>

<br>

| **Validate code** |
| -------------------------- |
| **HTTP Request**<br> POST /one-time-password-sms/v0/validate-code<br>**Query Parameters**<br> No query parameters are defined.<br>**Path Parameters**<br> No path parameters are defined.<br>**Request Body Parameters**<br> **authentication_id**: Unique id of the verification attempt the code belongs to.<br> **code**: Temporal, short code to be validated.

 <br>**Response**<br> **204: The OTP was successfully validated**<br> **400:** **INVALID_ARGUMENT**<br> **400:** **ONE_TIME_PASSWORD_SMS.VERIFICATION_FAILED** <br> **401:** **UNAUTHENTICATED. <br> **403:** PERMISSION_DENIED** <br> **404:** **NOT_FOUND**<br> **405:** **METHOD_NOT_ALLOWED**<br> **406:** **NOT_ACCEPTABLE**<br> **415:** **UNSUPPORTED_MEDIA_TYPE**<br> **429:** **TOO_MANY_REQUESTS**<br> **500:** **INTERNAL**<br> **503:** **UNAVAILABLE**<br> **504:** **TIMEOUT**<br>
<br>

<br>

### 4.3 Errors

Since CAMARA One Time Password SMS API is based on REST design principles and blueprints, well defined HTTP status codes and families specified by community are followed [[2]](#2).

Details of HTTP based error/exception codes for One Time Password SMS API are described in Section 4.2 of each API REST based method.
Following table provides an overview of common error names, codes, and messages applicable to One Time Password SMS API.

| No | Error Name | Error Code | Error Message |
| --- | ---------- | ---------- | ------------- |
|1	|400 |	INVALID_ARGUMENT |	"Client specified an invalid argument, request body or query param" |
|2	|400 |	ONE_TIME_PASSWORD_SMS.VERIFICATION_FAILED |	"The maximum number of attempts for this authentication_id was exceeded without providing a valid OTP" |
|3	|401 |	UNAUTHENTICATED |	"Request not authenticated due to missing, invalid, or expired credentials" |
|4	|403 |	PERMISSION_DENIED |	"Client does not have sufficient permissions to perform this action" |
|5	|403 |	ONE_TIME_PASSWORD_SMS.MAX_OTP_CODES_EXCEEDED |	"Too many OTPs have been requested for this MSISDN. Try later." |
|6	|404 |	NOT_FOUND |	"A specified resource is not found" |
|7	|405 |	METHOD_NOT_ALLOWED | "The requested method is not allowed/supported on the target resource" |
|8	|406 |	NOT_ACCEPTABLE | "The server can't produce a response matching the content requested by the client through Accept-* headers" |
|9	|415 |	UNSUPPORTED_MEDIA_TYPE | "The server refuses to accept the request because the payload format is in an unsupported format" |
|10	|429 |	TOO_MANY_REQUESTS |	"Either out of resource quota or reaching rate limiting" |
|14	|500 |	INTERNAL | "Server error" |
|15	|503 |	UNAVAILABLE | "Service unavailable" |
|15	|504 |	TIMEOUT | "Request timeout exceeded. Try later." |

<br>

### 4.4 Policies

N/A
<br>

### 4.5 Code Snippets
<br>
<span class="colour" style="color:rgb(36, 41, 47)">Snippets elaborates REST based API call with "*curl"* to request  </span>


Please note, the credentials for API authentication purposes need to be adjusted based on target security system configuration.

| Snippet 1. Request code  |
| ----------------------------------------------- |
| curl -X 'POST' `https://sample-base-url/one-time-password-sms/v0/validate-code`   <br>    -H 'accept: application/json' <br>    -H 'Content-Type: application/json'<br>    -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbG...."<br>    -d '{ "phone_number": "+346661113334", <br> "message": "{{code}} is your short code to authenticate with Cool App via SMS"}'  |
| The response will be: <br> 200 <br>   -d '{ "authentication_id": "ea0840f3-3663-4149-bd10-c7c6b8912105" }'|
<br>

| Snippet 2. Validate code  |
| ----------------------------------------------- |
| curl -X 'POST' `https://sample-base-url/one-time-password-sms/v0/validate-code`   <br>    -H 'accept: application/json' <br>    -H 'Content-Type: application/json'<br>    -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbG...."<br>    -d '{ "authentication_id": "ea0840f3-3663-4149-bd10-c7c6b8912105", <br> "code": "AJY3"}'  |
| The response will be: <br> 204 |
<br>



### 4.6 FAQs

(FAQs will be added in a later version of the documentation)

### 4.7 Terms

N/A

### 4.8 Release Notes

N/A


## References


<a name="1">[1] [CAMARA Commonalities : Authentication and Authorization Concept for Service APIs](https://github.com/camaraproject/WorkingGroups/blob/main/Commonalities/documentation/Working/CAMARA-AuthN-AuthZ-Concept.md) <br>
<a name="2">[2] [HTTP Status codes spec](https://restfulapi.net/http-status-codes/) <br>