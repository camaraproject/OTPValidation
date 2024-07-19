<a href="https://github.com/camaraproject/OTPvalidationAPI/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/camaraproject/OTPvalidationAPI?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidationAPI/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/camaraproject/OTPvalidationAPI?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidationAPI/pulls" title="Open Pull Requests"><img src="https://img.shields.io/github/issues-pr/camaraproject/OTPvalidationAPI?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidationAPI/graphs/contributors" title="Contributors"><img src="https://img.shields.io/github/contributors/camaraproject/OTPvalidationAPI?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidationAPI" title="Repo Size"><img src="https://img.shields.io/github/repo-size/camaraproject/OTPvalidationAPI?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidationAPI/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=plastic"></a>

# OTP Validation

Repository to describe, develop, document and test the OTP Validation API family

## Scope

* Service APIs for “OTP Validation” (see APIBacklog.md)  
  * One Time Password SMS API performs real-time checks to verify that the user possessed the device that carries the indicated mobile phone number.
  * It provides a frequent method of verifying possession of the device by delivering an OTP (one-time password) through SMS and validating it afterwards.
  * NOTE: The scope of this API family should be limited (at least at a first stage) to 4G and 5G.
* Describe, develop, document and test the APIs (with 1-2 Telcos)
  * Started: October 2022
  * Location: virtually

## Meetings


Current schedule, registration, & meeting links are available on the confluence page: [Meetings information](https://wiki.camaraproject.org/display/CAM/OTPValidation)
  
## Status and released versions

* Note: Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until a new release is created. For example, changes may be reverted before a release is created. **For best results, use the latest available release**.
* **The latest available release and version of CAMARA OTPValidaton API is 1.0.0-rc.1 This is the first stable version candidate of the API**. It is suitable for implementors and could be use with customers in productive environments.
* The Release Tag is [r1.1](https://github.com/camaraproject/OTPvalidationAPI/releases/tag/r1.1).
  - API definition **with inline documentation**:
    - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPvalidationAPI/blob/r1.1/code/API_definitions/one-time-password-sms.yaml)
    - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidationAPI/blob/r1.1/code/API_definitions/one-time-password-sms.yaml&nocors)
    - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidationAPI/blob/r1.1/code/API_definitions/one-time-password-sms.yaml)
* The previous version 0.5.0 is available on [release-0.5.0](https://github.com/camaraproject/OTPvalidationAPI/tree/release-0.5.0) branch.

## Contributorship and mailing list

* To subscribe / unsubscribe to the mailing list of this Sub Project and thus be / resign as Contributor please visit <https://lists.camaraproject.org/g/sp-nvs>.
* A message to all Contributors of this Sub Project can be sent using <sp-nvs@lists.camaraproject.org>.



## Relevant Information

Since April 4th 2024 WG meeting minutes are placed in [OTP Validation Wiki Confluence site](https://wiki.camaraproject.org/display/CAM/OTP+Validation)
