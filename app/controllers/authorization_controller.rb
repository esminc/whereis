require 'google/api_client'

class AuthorizationController < ApplicationController
  def index
    # TODO: 書き直す
    auth =
    "https://accounts.google.com/o/oauth2/auth?" +
    "client_id=-------------.apps.googleusercontent.com" +
    "&" +
    "redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Foauth2callback" +
    "&" +
    "scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar" +
    "&" +
    "response_type=code"

    @account = HTTPClient.new.get_content(auth)
  end

  def oauth2callback(code)
    # TODO: 

    # Initialize the client & Google+ API
    @client = Google::APIClient.new

    # Initialize OAuth 2.0 client
    @client.authorization.client_id     = '-------------.apps.googleusercontent.com'
    @client.authorization.client_secret = '------------------------'
    @client.authorization.redirect_uri  = 'http://localhost:3000/oauth2callback'
    @client.authorization.scope         = 'https://www.googleapis.com/auth/calender'

    # Request authorization
#    redirect_uri = @client.authorization.authorization_uri

    # Wait for authorization code then exchange for token
    @client.authorization.code = code
    @client.authorization.fetch_access_token!
  
    calendar = @client.discovered_api('calendar', 'v3')

    events_list = @client.execute(
                    api_method: calendar.events.list,
                    parameters: {
#                      'calendarId' => 'e-matsumoto@esm.co.jp',
                      'calendarId' => 'primary',
                      'timeMax'    => '2013-06-21T00:00:00Z',
                      'timeMin'    => '2013-06-20T00:00:00Z'
                    }
                  )

    p events_list.data.items.to_json

    render json: events_list.data.items.to_json
  end

end
