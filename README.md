<a href="https://github.com/camaraproject/OTPvalidation/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/pulls" title="Open Pull Requests"><img src="https://img.shields.io/github/issues-pr/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/graphs/contributors" title="Contributors"><img src="https://img.shields.io/github/contributors/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation" title="Repo Size"><img src="https://img.shields.io/github/repo-size/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/releases/latest" title="Latest Release"><img src="https://img.shields.io/github/release/camaraproject/OTPvalidation?style=plastic"></a>

# OTP Validation

Repository to describe, develop, document and test the OTPValidation API family

## Scope

* Service APIs for “OTPValidation” (see APIBacklog.md)  
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
* `NEW`: Release r2.1 with version 1.1.0-rc1 of the API one-time-password-sms is available [here](https://github.com/camaraproject/OTPvalidation/tree/r2.1)
  - API definition **with inline documentation**:
    - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPvalidation/blob/r2.1/code/API_definitions/one-time-password-sms.yaml)
    - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidation/r2.1/code/API_definitions/one-time-password-sms.yaml&nocors)
    - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidation/r2.1/code/API_definitions/one-time-password-sms.yaml)
* Previous releases and pre-releases of the repository are available in https://github.com/camaraproject/OTPvalidation/releases 
* For changes see [CHANGELOG.md](https://github.com/camaraproject/OTPvalidation/blob/main/CHANGELOG.md)

## Contributorship and mailing list

* To subscribe / unsubscribe to the mailing list of this Sub Project and thus be / resign as Contributor please visit <https://lists.camaraproject.org/g/sp-nvs>.
* A message to all Contributors of this Sub Project can be sent using <sp-nvs@lists.camaraproject.org>.



## Relevant Information

Since April 4th 2024, OTP meeting minutes are merged with Sim Swap & Number Verification meeting minutes. WG meeting minutes are placed in [NumberVerification Meeting Minutes](https://lf-camaraproject.atlassian.net/wiki/spaces/CAM/pages/14564484/NumberVerification+Meeting+Minutes)