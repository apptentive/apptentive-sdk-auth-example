require "sinatra"
require "sinatra/base"

class App < Sinatra::Base
  DAY_IN_SECONDS = 60 * 60 * 24
  APPTENTIVE_JWT_SIGNING_ALGORITHM = "HS512"
  # this value is provided in the Apptentive dashboard
  APPTENTIVE_JWT_SIGNING_SECRET = "jwt_signing_secret"

  # The URL/route you make this request to is up to you
  post "/:user_id/authenticate" do
    # Authenticate the user
    if valid_user_login?(params[:username], params[:password])
      now = Time.now.to_i
      jwt_payload = {
        iat: now,
        exp: now + 3 * DAY_IN_SECONDS,
        sub: params[:username]
        }

      [200, { "Content-Type" => "application/json" }, { token: generate_jwt_token_from_payload(jwt_payload) }.to_json]
    else
      [401, { "Content-Type" => "application/json" }, { error: "User not authorized." }.to_json]
    end
  end

  # This is a placeholder method meant to be replaced with the customer's authentication implementation
  # You do not need to implement it exactly, it is just meant to show that the customer should do their own authentication
  # @param [String] username
  # @param [String] password
  # @return [Boolean] Whether or not the user's authentication information is valid
  def valid_user_login?(username, password)
    true
  end

  # Generate a JWT token string to include in the API response payload
  # @param [Hash] payload The hash payload for the token, including the iat and sub keys, with an optional exp key
  # @return [String] JWT token string
  def generate_jwt_token_from_payload(payload)
    JWT.encode(payload, APPTENTIVE_JWT_SIGNING_SECRET, APPTENTIVE_JWT_SIGNING_ALGORITHM)
  end
end
