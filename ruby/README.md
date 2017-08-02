This directory shows a simple example of a customer-side authentication flow
that returns JWT tokens signed with the Apptentive-provided token to the device.

## Installation / Running

### Docker

```
docker build -t apptentive-sdk-auth-example-ruby .
docker run -p 4000:80 apptentive-sdk-auth-example-ruby
```

Once the container has been built and started, you can make requests against `localhost:4000`.

### Local System

If you want to install the dependencies and run locally:

```
bundle install
bundle exec rackup config.ru -p 80 -s thin -o 0.0.0.0
```
