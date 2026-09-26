# Overview

One Time Password SMS API is used to send short-lived OTPs (one time passwords) to a phone number via SMS and validate it afterwards, in order to provide a proof of possession of the phone number.

## 1\. Introduction

One Time Password SMS API performs real-time checks to verify that the user possessed the device that carries the indicated mobile phone number. It provides a frequent method of verifying possession of the device by delivering an OTP (one-time password) through SMS and validating it afterwards.

SMS OTP (one time password) is a secure method for providing one-time access to an application or performing a single transaction. OTP is most effective and legitimate for a single transaction, unlike user-generated passwords. It is a secure authentication method where a text containing a unique alphanumeric or numeric code is sent to a mobile number (MSISDM).

The recipient then uses this code or password as an additional layer of security to login to a service, website or app.


## 2\. Quick Start

The usage of the API is based on several resources.

Before starting to use the API, the developer needs to know about the below specified details:

**API service endpoint**

Two endpoints are defined in One Time Password SMS API: <br>
- POST /one-time-password-sms/v2/send-code : Sends an SMS with the desired message and an OTP code to the received phone number
- POST /one-time-password-sms/v2/validate-code : Verifies the received code as input is valid for the given authenticationId.

## 3\. Authentication and Authorization

Authentication and Authorization are described in `info.description` of `code/API_definitions/one-time-password-sms.yaml`. 

## 4\. API Documentation

API documentation is available in `info.description` of `code/API_definitions/one-time-password-sms.yaml`. 
