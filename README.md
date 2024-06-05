Create a "credentials.properties" file and place below into resources folder located in -> "AuctionSiteMavenBuild/src/main/resources"


#Local Database
DATABASE_CONNECTION=jdbc:mysql://localhost:(port 4 digit number without parentheses)/(enter you database name without parentheses)
DATABASE_USERNAME=(enter your database username without parentheses)
DATABASE_PASSWORD=(enter your database password without parentheses)

#Or use AWS Database below (just uncomment)

#AWS Database
#DATABASE_CONNECTION=jdbc:mysql://(Copy AWS endpoint here):(port 4 digit number without parentheses)/(enter you database name without parentheses)
#DATABASE_USERNAME=(enter your database username without parentheses)
#DATABASE_PASSWORD=(enter your database password without parentheses)

#AWS S3 Bucket
AWS_BUCKET=(enter your AWS S3 Bucket name without parentheses)
AWS_REGION=(enter your AWS S3 Region name without parentheses)
