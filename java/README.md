This directory shows a simple example of a customer-side authentication flow
that returns JWT tokens signed with the Apptentive-provided token to the device.

### Run Locally

```
# install dependencies and build jar
mvn dependency:resolve
mvn verify
mvn package

# run with java8
java -jar target/sdk_auth_example.Server-jar-with-dependencies.jar
```

Once the container has been built and started, you can make requests against `localhost:4567`.
