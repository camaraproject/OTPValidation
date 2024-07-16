# OTPVAlidationAPI API User Story

OTP Validation user story is splitted in 2 steps. Both steps are mandatory to perform  this user story.

##  Step 1 - Request to send a code

| **Item** | **Details** |
| ---- | ------- |
| ***Summary*** | As an enterprise application developer, I want to verify the phone number associated with the line from which the call was made, so I can get a proof of possession of the phone number.  |
| ***Roles, Actors and Scope*** | **Roles:** Customer:User, Customer:BusinessManager, Customer:Administrator<br> **Actors:** Application service providers, hyperscalers, application developers, end users, Communication service Provider (CSP). <br> **Scope:**  <br> - Customer:User asks CSP to send a message featuring a 'code' variable via SMS. The message is specified by Customer:User. In the API response a request identifier is provided to link with validation step. |
| ***Pre-conditions*** |The preconditions are listed below:<br><ol><li>The Customer:BusinessManager and Customer:Administrator have been onboarded to the CSP's API platform.</li><li>The Customer:BusinessManager has successfully subscribed to the OTP Validation API product from the product catalog.</li><li>The Customer:Administrator has onboarded the Customer:User to the platform.</li><li>The Customer:User performs an authorization request to CSP</li><li>The Customer:user has the access token allowing a secure access of the API.|
| ***Activities/Steps*** | **Starts when:** The customer application makes a POST send-code via the OTPValidation API providing in the request the phone number keyed by the user on the application and a message to be displayed in the SMS. This message must indicate where the code must be indicated (like _"Your code to validate your onboarding for niceApp is {code}"_).<br>**Ends when:** The CSP OTP Validation server performs two operations: 1/answers to the API request providing a request identifier (authenticationId), and 2/send the SMS to the line identified by provided phone number. |
| ***Post-conditions*** | The customer application has a request identifier (authenticationId) and will be able to validate code keyed by the end user.  |
| ***Exceptions*** | Several exceptions might occur during the OTP Validation API operations<br>- Unauthorized: Not valid credentials.<br>- Invalid input: Not valid input data to invoke operation (e.g. phone number without the '+' prefix).<br>- Permission denied: Too any request to send code for a phone number in a short time. <br>- Permission denied: phone number not able to receive SMS.|


##  Step 2 - Validate a code

| **Item** | **Details** |
| ---- | ------- |
| ***Summary*** | As an enterprise application developer, I want to verify the phone number associated with the line from which the call was made, so I can get a proof of possession of the phone number.  |
| ***Roles, Actors and Scope*** | **Roles:** Customer:User, Customer:BusinessManager, Customer:Administrator<br> **Actors:** Application service providers, hyperscalers, application developers, end users, Communication service Provider (CSP). <br> **Scope:**  <br> - Following a send code request, Customer:User asks end user to keyed the code received by SMS. Then Customer:User sends this code to the CSP to validate that the code matches the one send by the CSP in the SMS.  |
| ***Pre-conditions*** |The preconditions are listed below:<br><ol><li>The Customer:BusinessManager and Customer:Administrator have been onboarded to the CSP's API platform.</li><li>The Customer:BusinessManager has successfully subscribed to the OTP Validation API product from the product catalog.</li><li>The Customer:Administrator has onboarded the Customer:User to the platform.</li><li>The Customer:User performs an authorization request to CSP</li><li>The Customer:User has the access token allowing a secure access of the API.</li><li> The Customer:User has performed a valid send-code previously and has the request identifier (authenticationId).</li><li> The end user received via a SMS a code and keyed it on the application. |
| ***Activities/Steps*** | **Starts when:** The Customer-User makes a POST validate-code via the OTPValidation API providing in the request the code keyed by the end user on the application and the authenticationId obtained in the response of the send-code step. .<br>**Ends when:** The CSP OTP Validation server check the code and answers 204 if the code matches else an exception is sent. |
| ***Post-conditions*** | The customer application could continue offering its service to the end user with the confirmation of the end user phone number.  |
| ***Exceptions*** | Several exceptions might occur during the OTP Validation API operations<br>- Unauthorized: Not valid credentials.<br>- Invalid input: Not valid input data to invoke operation (e.g. code not provided).<br>- Invalid input: The maximum number of attempts for this authenticationId was exceeded without providing a valid OTP <br>- Invalid input:The provided OTP is not valid for this authenticationId<br>- Invalid input:The authenticationId is no longer valid|
