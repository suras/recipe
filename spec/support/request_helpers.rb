module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
    def http_login(token, email)
      # request = ActionController::TestRequest.new(:host => "http://localhost:3000")
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token ,{:email => email})
    end
  end
end
