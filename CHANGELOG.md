# Changelog OTPvalidationAPI


## Table of contents

- **[r1.1](#r11)**


**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**



# r1.1 - rc

## Release Notes

This release of OTPValidation contains the definition and documentation of
* one-time-password-sms 1.0.0-rc.1

The API definition(s) are based on
* Commonalities v0.4.0
* Identity and Consent Management v0.2.0


## OTPValidationAPI v1.0.0-rc.1


**OTPvalidationAPI 1.0.0-rc.1** is the first release-candidate version for the v1.0.0 of the OTPValidationAPI.
This version contains significant changes compared to v0.5.0, and it is not backward compatible.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidationAPI/r1.1/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/OTPvalidationAPI/r1.1/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPvalidationAPI/blob/r1.1/code/API_definitions/one-time-password-sms.yaml)
    

### Added

* User Story in documentation/API_documentation directory by @bigludo7 [PR71](https://github.com/camaraproject/OTPvalidationAPI/pull/71)
* Test Definition in Test_Definitions directory by @bigludo7 [PR61](https://github.com/camaraproject/OTPvalidationAPI/pull/61)

### Changed

* Aligned with CAMARA design guidelines & Identity Consent management
* Make the '+' mandatory for the phone number by @bigludo7 [PR50](https://github.com/camaraproject/OTPvalidationAPI/pull/50)
* Cosmetic change following megalinter integration by @bigludo7 [PR53](https://github.com/camaraproject/OTPvalidationAPI/pull/53)
* Update Authorization and authentication part accordingly to ICM by @bigludo7 [PR65](https://github.com/camaraproject/OTPvalidationAPI/pull/65)
* Align securitySchemes with ICM by @fernandopradocabrillo [PR68](https://github.com/camaraproject/OTPvalidationAPI/pull/68)

### Fixed

* n/a

### Removed

* n/a

## New Contributors 

- @fernandopradocabrillo made their first contribution in Fernando replaces Mona as maintainer [#37](https://github.com/camaraproject/OTPvalidationAPI/pull/37)
- @rartych made their first contribution in GitHub workflows [#60](https://github.com/camaraproject/OTPvalidationAPI/pull/60)


