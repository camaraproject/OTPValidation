# Changelog OTPValidation


## Table of contents

- **[r3.2](#r32)**
- **[r3.1](#r31)**
- **[r2.3](#r23)**
- **[r2.2](#r22)**
- **[r2.1](#r21)**
- **[r1.2](#r12)**
- **[r1.1](#r11)**
- **[v0.5.0](#v050)**

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

# r3.2

## Release Notes

This release contains the definition and documentation of

* one-time-password-sms 1.1.1


The API definition(s) are based on
* Commonalities v0.6.0 (r3.3)
* Identity and Consent Management v0.4.0 (r3.3)

## one-time-password-sms 1.1.1

This is the **release** of the one-time-password-sms API version 1.1.1. 


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.2/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.2/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r3.2/code/API_definitions/one-time-password-sms.yaml)

In the following there is the list of the modifications with respect to the previous release r2.3.

### Added
N/A

### Changed
- Align x-correlator definition with Commonalities 0.6.0, changed pattern and example (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/111
- Align attribute description for code and description in the ErrorInfo schema (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/115

### Fixed
N/A


### Removed
N/A

**Full Changelog**: https://github.com/camaraproject/OTPValidation/compare/r2.3...r3.1

# r3.1

## Release Notes

This pre-release contains the definition and documentation of

* one-time-password-sms 1.1.1-rc.3


The API definition(s) are based on
* Commonalities v0.6.0-rc.1 (r3.2)
* Identity and Consent Management v0.4.0-rc.1 (r3.2)

## one-time-password-sms 1.1.1-rc3

This is the first **pre-release** of the one-time-password-sms API version 1.1.1. 


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.1/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.1/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r3.1/code/API_definitions/one-time-password-sms.yaml)

In the following there is the list of the modifications with respect to the previous release r2.3.

### Added
N/A

### Changed
- Align x-correlator definition with Commonalities 0.6.0, changed pattern and example (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/111

### Fixed
N/A


### Removed
N/A

**Full Changelog**: https://github.com/camaraproject/OTPValidation/compare/r2.3...r3.1


# r2.3

## Release Notes

This public release contains the definition and documentation of



* one-time-password-sms 1.1.0

The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## one-time-password-sms 1.1.0

This is the **release** of the one-time-password-sms API version 1.1.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.3/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.3/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r2.3/code/API_definitions/one-time-password-sms.yaml)

Changes with respect to the previous release r1.2.


### Added

N/A

### Changed
- Align x-correlator definition with Commonalities 0.5.0, added pattern and example (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89 and https://github.com/camaraproject/OTPValidation/pull/92
- Split the test file feature in 2: https://github.com/camaraproject/OTPValidation/pull/101
- Restructure test cases (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Change error structure as defined in commonalities 0.5.0 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Update 429 error message: https://github.com/camaraproject/OTPValidation/pull/92
- servers.url format aligned with current guidelines (`'{apiRoot}/one-time-password-sms/v1rc2'`) by @hdamker in https://github.com/camaraproject/OTPValidation/pull/97

### Fixed

* Fix test cases @OTPvalidationAPI_02_send_code_success_scenario_without_x-correlator and @OTPvalidationAPI_02_validate_code_sucess_scenario_without_x-correlator (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89

### Removed
- Remove from the yaml the errors 406, 415, 500, 503 & 504 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Remove test cases for 406 & 415 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89

**Full Changelog**: https://github.com/camaraproject/OTPValidation/compare/r1.2...r2.3

# r2.2

## Release Notes

This pre-release contains the definition and documentation of

* one-time-password-sms 1.1.0-rc.2


The API definition(s) are based on
* Commonalities v0.5.0-rc.1
* Identity and Consent Management v0.3.0-rc.1

## one-time-password-sms 1.1.0-rc.2

This is the second **pre-release** of the one-time-password-sms API version 1.1.0-rc.2. Main purpose of the rc.2 version is to address https://github.com/camaraproject/OTPValidation/issue/96 (alignment of server.url with current guideline).


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.2/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.2/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r2.2/code/API_definitions/one-time-password-sms.yaml)

In the following there is the list of the modifications with respect to the previous release r2.1.

### Added

N/A

### Changed
- servers.url format aligned with current guidelines (`'{apiRoot}/one-time-password-sms/v1rc2'`) by @hdamker in https://github.com/camaraproject/OTPValidation/pull/97

### Fixed

N/A

### Removed

N/A

**Full Changelog**: https://github.com/camaraproject/OTPValidation/compare/r2.1...r2.2


# r2.1

## Release Notes

This pre-release contains the definition and documentation of

* one-time-password-sms 1.1.0-rc.1


The API definition(s) are based on
* Commonalities v0.5.0
* Identity and Consent Management v0.3.0

## one-time-password-sms 1.1.0-rc1

This is the first **pre-release** of the one-time-password-sms API version 1.1.0-rc.1. It contains mainly alignments with the Commonalities 0.5.0. 


- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.1/code/API_definitions/one-time-password-sms.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r2.1/code/API_definitions/one-time-password-sms.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/OTPValidation/blob/r2.1/code/API_definitions/one-time-password-sms.yaml)

In the following there is the list of the modifications with respect to the previous release r1.2.

### Added

N/A

### Changed
- Align x-correlator definition with Commonalities 0.5.0, added pattern and example (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89 and https://github.com/camaraproject/OTPValidation/pull/92
- Restructure test cases (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Change error structure as defined in commonalities 0.5.0 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Update 429 error message: https://github.com/camaraproject/OTPValidation/pull/92

### Fixed

* Fix test cases @OTPvalidationAPI_02_send_code_success_scenario_without_x-correlator and @OTPvalidationAPI_02_validate_code_sucess_scenario_without_x-correlator (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89

### Removed
- Remove from the yaml the errors 406, 415, 500, 503 & 504 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89
- Remove test cases for 406 & 415 (no change for the consumer): https://github.com/camaraproject/OTPValidation/pull/89

**Full Changelog**: https://github.com/camaraproject/OTPValidation/compare/r1.2...r2.1


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
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.2/code/API_definitions/one-time-password-sms.yaml)
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
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r1.1/code/API_definitions/one-time-password-sms.yaml)
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


