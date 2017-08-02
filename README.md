# Example of Apptentive SDK Login

This repository is a working example of the code required as part of Apptentive's
login/encryption feature. When using Apptentive's login feature,
Apptentive requires you to generate a JWT token signed with a secret provided by Apptentive.
This JWT token is generated on your server and returned to the SDK for inclusion with
requests to the Apptentive server on behalf of a logged in user.

## Language Examples
* ruby
* java

## Authentication Flow

* Customer enters their authentication information on your mobile app
* Your server processes that authentication information and finds the person has supplied valid auth information
* NEW: Your server must generate a JWT for that user and return it to the device
* NEW: You must pass the JWT to the platform-specific "login" method to create/re-enter the logged in Apptentive Conversation
* NEW: Your user now has an isolated, encrypted session on their device
* NEW: Log the customer out of their Apptentive session when their session times out or they explicitly request to be logged out
