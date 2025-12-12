<a href="https://github.com/camaraproject/OTPvalidation/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/pulls" title="Open Pull Requests"><img src="https://img.shields.io/github/issues-pr/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/graphs/contributors" title="Contributors"><img src="https://img.shields.io/github/contributors/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation" title="Repo Size"><img src="https://img.shields.io/github/repo-size/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=plastic"></a>
<a href="https://github.com/camaraproject/OTPvalidation/releases/latest" title="Latest Release"><img src="https://img.shields.io/github/release/camaraproject/OTPvalidation?style=plastic"></a>
<a href="https://github.com/camaraproject/Governance/blob/main/ProjectStructureAndRoles.md" title="Incubating API Repository"><img src="https://img.shields.io/badge/Incubating%20API%20Repository-green?style=plastic"></a>

# OTPValidation

Incubating API Repository to evolve and maintain the definitions and documentation of OTPValidation Service API within the Sub Project [Number Insights](https://lf-camaraproject.atlassian.net/wiki/x/BYEpBQ)

* API Repository [wiki page](https://lf-camaraproject.atlassian.net/wiki/x/yDXe)

## Scope

* Service APIs for “OTPValidation” (see APIBacklog.md)  
  * The OTP SMS API facilitates real-time verification of a user's device by sending a unique code via SMS to the specified mobile phone number. The process involves three key steps:
1. **Code Generation and Delivery:**  
   The send-code operation is used by the API consumer (e.g., an application) to request a one-time code to be sent by SMS to the application user's mobile phone along with an message to the user's mobile device.
2. **User Input:**  
   The user receives the SMS and enters the received code into the application.
3. **Verification:**  
   The application submits the entered code using the validate-code operation, which then verifies its accuracy and responds with a confirmation indicating whether the code is valid.

This process ensures secure, real-time validation of user possession of the specified device, enhancing authentication security.
  *  by delivering a one-time password (OTP) to it through SMS and validating the received code with the user's operator after the code is entered as requested.
  * Started: October 2022
  * Incubating stage since: February 2025

  
<!-- CAMARA:RELEASE-INFO:START -->
<!-- This section is automatically maintained by the CAMARA project-administration tooling: https://github.com/camaraproject/project-administration -->

## Release Information

> [!NOTE]
> Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until a new release is created. For example, changes may be reverted before a release is created. **For best results, use the latest available release**.

* **NEW**: The latest public release is [r3.2](https://github.com/camaraproject/OTPValidation/releases/tag/r3.2) (Fall25), with the following API versions:
  * **one-time-password-sms v1.1.1**
  [[YAML]](https://github.com/camaraproject/OTPValidation/blob/r3.2/code/API_definitions/one-time-password-sms.yaml)
  [[ReDoc]](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.2/code/API_definitions/one-time-password-sms.yaml&nocors)
  [[Swagger]](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/OTPValidation/r3.2/code/API_definitions/one-time-password-sms.yaml)
* The latest public release is always available here: https://github.com/camaraproject/OTPValidation/releases/latest
* Other releases of this repository are available in https://github.com/camaraproject/OTPValidation/releases
* For changes see [CHANGELOG.md](https://github.com/camaraproject/OTPValidation/blob/main/CHANGELOG.md)

_The above section is automatically synchronized by CAMARA project-administration._
<!-- CAMARA:RELEASE-INFO:END -->

## Contributing

* Meetings are held virtually
  * Schedule: Every 4 weeks, Thursday, 7:30 AM UTC (8:30 CET/9:30 CEST)
  * [Registration / Join](https://zoom-lfx.platform.linuxfoundation.org/meeting/94893248838?password=05b2197d-309e-41ef-aadf-639f71ef7f38)
  * Minutes: Access [meeting minutes](https://lf-camaraproject.atlassian.net/wiki/spaces/CAM/pages/14564484/Minutes+-+Number+Insights)
* Mailing list
  * Subscribe / Unsubscribe to the mailing list <https://lists.camaraproject.org/g/sp-number-insights>.
  * A message to the community of this Sub Project can be sent using <sp-number-insights@lists.camaraproject.org>.



