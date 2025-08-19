# API Readiness Checklist

Checklist for one-time-password-sms v1.1.1 in r3.2


| Nr | API release assets  | alpha | release-candidate |  public-release<br>initial | public-release<br> stable | Status | Reference information |
|----|----------------------------------------------|:-----:|:-----------------:|:-------:|:------:|:----:|:----:|
|  1 | API definition                               |   M   |         M         |    M    |    M   |   Y   | [link](/code/API_definitions/one-time-password-sms.yaml) |
|  2 | Design guidelines from Commonalities applied |   O   |         M         |    M    |    M   |  Y    |  [r3.2](https://github.com/camaraproject/Commonalities/releases/tag/r3.2)    |
|  3 | Guidelines from ICM applied                  |   O   |         M         |    M    |    M   |   Y   |  [r3.2](https://github.com/camaraproject/IdentityAndConsentManagement/releases/tag/r3.2)    |
|  4 | API versioning convention applied            |   M   |         M         |    M    |    M   |   Y   |  v1.1.1    |
|  5 | API documentation                            |   M   |         M         |    M    |    M   |   Y   | Embed documentation into API spec - [link](/code/API_definitions/one-time-password-sms.yaml)  |
|  6 | User stories                                 |   O   |         O         |    O    |    M   |   Y   | [link](/documentation/API_documentation/OTPValidationAPI_User_Story.md) |
|  7 | Basic API test cases & documentation         |   O   |         M         |    M    |    M   |   Y   | [send code](code/Test_Definitions/one-time-password-sendCode.feature) / [validate code](code/Test_Definitions/one-time-password-validateCode.feature)|
|  8 | Enhanced API test cases & documentation      |   O   |         O         |    O    |    M   |   Y   |  [send code](code/Test_Definitions/one-time-password-sendCode.feature) / [validate code](code/Test_Definitions/one-time-password-validateCode.feature) |
|  9 | Test result statement                        |   O   |         O         |    O    |    M   |   N   | Not yet available |
| 10 | API release numbering convention applied     |   M   |         M         |    M    |    M   |   Y   |    |
| 11 | Change log updated                           |   M   |         M         |    M    |    M   |   Y   | [link](/CHANGELOG.md) |
| 12 | Previous public-release was certified        |   O   |         O         |    O    |    M   |   Y   | see (1)    |
| 13 | API description (for marketing)              |   O   |         O         |    M    |    M   |   Y   | [wiki link](https://lf-camaraproject.atlassian.net/wiki/spaces/CAM/pages/81101463/OTPValidation+API+description) |


(1) The certified company(s) can be found on the following link: [GSMA Open Gateway Portal](https://open-gateway.gsma.com/).

Note: the checklists of a public API version and of its preceding release-candidate API version can be the same.

The documentation for the content of the checklist is here: see API Readiness Checklist section in the [API Release Process](https://lf-camaraproject.atlassian.net/wiki/x/jine).


