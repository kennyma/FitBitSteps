
## Requirements
Create an iOS application that displays steps information from Fitbit  

Build your UI according to this mock: https://drive.google.com/file/d/0B64OB33WYv7JMG1Mb2VBdUJWanc/view

The app should:
* Fetch today's data from Fitbit on app start
* Fetch today's data from Fitbit on a regular basis while app is in foreground
* Display old data if any while fetching for new data
* Persist data to database
* Display list of historical step data
* Pre-fetch data as user scroll through the list of historical step data

## Guidelines
* This starter project contains code for user authentication against Fitbit API so you don't have to implement authentication.
* Optimize your app for users with many years of data from Fitbit
* Write production quality code with an emphasis on maintainability
* Refactor existing code if necessary
* Write tests  
* It's OK to use Google or other online resources
* When done, push your solution as a new branch

## Resources
* Fitbit API doc: https://dev.fitbit.com/reference/web-api/basics/
* Client ID: 228NRR
* Client Secret: 45d700afa2244b04fc30f26b205eeb8b
* Auth URI: https://www.fitbit.com/oauth2/authorize
* Access/Refresh token request URI: https://api.fitbit.com/oauth2/token
* Callback URL: mhStepTracker://oauth-callback
