This is the repository prior to converting to a Maven Project:
https://github.com/cliffjg/AuctionSite

To run this project ->
Create a "credentials.properties" file and place below into resources folder located in -> "AuctionSiteMavenBuild/src/main/resources"

<br>
<br>
#Local Database
<br>DATABASE_CONNECTION=jdbc:mysql://localhost:(port 4 digit number without parentheses)/(enter you database name without parentheses)
<br>DATABASE_USERNAME=(enter your database username without parentheses)
<br>DATABASE_PASSWORD=(enter your database password without parentheses)

<br>####Or use AWS Database below (just uncomment)###

<br>#AWS Database
<br>#DATABASE_CONNECTION=jdbc:mysql://(Copy AWS endpoint here):(port 4 digit number without parentheses)/(enter you database name without parentheses)
<br>#DATABASE_USERNAME=(enter your database username without parentheses)
<br>#DATABASE_PASSWORD=(enter your database password without parentheses)

<br><br>####AWS S3 Bucket###

#AWS S3 Bucket
<br>AWS_BUCKET=(enter your AWS S3 Bucket name without parentheses)
<br>AWS_REGION=(enter your AWS S3 Region name without parentheses)
