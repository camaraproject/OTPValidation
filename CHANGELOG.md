# Changelog OTPValidation


## Table of contents

- **[r1.2](#r12)**
- **[r1.1](#r11)**
- **[v0.5.0](#v050)**

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

# r1.2

## Release Notes

This release contains the definition and documentation of
* one-time-password-sms 1.0.0

The API definition(s) are based on
* Commonalities v0.4.0
* Identity and Consent Management v0.2.0

## one-time-password-sms 1.0.0

**one-time-password-sms 1.0.0 is the public release for v1.0.0 of the OTPValidation API.**

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.2/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.2/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r1.2/code/API_definitions/one-time-password-sms.yaml)

**Main Changes**

* API and test definitions updated to conform to the Commonalities v0.4.0 and Identity and Consent Management v0.2.0 guidelines included in the CAMARA Fall24 meta-release
* Additional documentation & test cases added.


### Added

* User Story in documentation/API_documentation directory by @bigludo7 [PR71](https://github.com/camaraproject/OTPValidationAPI/pull/71)
* Test Definition in Test_Definitions directory by @bigludo7 [PR61](https://github.com/camaraproject/OTPValidationAPI/pull/61)

### Changed

* Aligned with CAMARA design guidelines & Identity Consent management
* Make the '+' mandatory for the phone number by @bigludo7 [PR50](https://github.com/camaraproject/OTPValidationAPI/pull/50)
* Cosmetic change following megalinter integration by @bigludo7 [PR53](https://github.com/camaraproject/OTPValidationAPI/pull/53)
* Update Authorization and authentication part accordingly to ICM by @bigludo7 [PR65](https://github.com/camaraproject/OTPValidationAPI/pull/65)
* Align securitySchemes with ICM by @fernandopradocabrillo [PR68](https://github.com/camaraproject/OTPValidationAPI/pull/68)

### Fixed

* N/A

### Removed

* Remove 405 error code in the yaml & test definition by @bigludo7 [PR80](https://github.com/camaraproject/OTPValidationAPI/pull/80)

## New Contributors
* N/A



# r1.1 - rc

## Release Notes

This release of OTPValidation contains the definition and documentation of
* one-time-password-sms 1.0.0-rc.1

The API definition(s) are based on
* Commonalities v0.4.0
* Identity and Consent Management v0.2.0


## OTPValidation v1.0.0-rc.1


**one-time-password-sms 1.0.0-rc.1** is the first release-candidate version for the v1.0.0 of the one-time-password-sms API.
This version contains significant changes compared to v0.5.0, and it is not backward compatible.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.1/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.1/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r1.1/code/API_definitions/one-time-password-sms.yaml)
    

### Added

* User Story in documentation/API_documentation directory by @bigludo7 [PR71](https://github.com/camaraproject/OTPValidationAPI/pull/71)
* Test Definition in Test_Definitions directory by @bigludo7 [PR61](https://github.com/camaraproject/OTPValidationAPI/pull/61)

### Changed

* Aligned with CAMARA design guidelines & Identity Consent management
* Make the '+' mandatory for the phone number by @bigludo7 [PR50](https://github.com/camaraproject/OTPValidationAPI/pull/50)
* Cosmetic change following megalinter integration by @bigludo7 [PR53](https://github.com/camaraproject/OTPValidationAPI/pull/53)
* Update Authorization and authentication part accordingly to ICM by @bigludo7 [PR65](https://github.com/camaraproject/OTPValidationAPI/pull/65)
* Align securitySchemes with ICM by @fernandopradocabrillo [PR68](https://github.com/camaraproject/OTPValidationAPI/pull/68)

### Fixed

* n/a

### Removed

* n/a

## New Contributors 

- @fernandopradocabrillo made their first contribution in Fernando replaces Mona as maintainer [#37](https://github.com/camaraproject/OTPvalidationAPI/pull/37)
- @rartych made their first contribution in GitHub workflows [#60](https://github.com/camaraproject/OTPvalidationAPI/pull/60)

# v0.5.0

**This is the first alpha release of the OTPValidation API**

- API definition **with inline documentation**

## Please note:

- This is an alpha version, it should be considered as a draft
- There are bug fixes to be expected and incompatible changes in upcoming versions 
- The release is suitable for implementors, but it is not recommended to use the API with customers in productive environments
- Version numbers before v0.5.0 were used during the development of this version but not released
- 
### Added

* CHANGELOG.md
* API definition ready for a release

### Changed

* Aligned with CAMARA design guidelines

### Fixed

* n/a

### Removed

* n/a
