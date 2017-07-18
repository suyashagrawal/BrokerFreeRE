RailsAdmin.config do |config|
  config.authorize_with do 
    authenticate_or_request_with_http_basic('Need Authentication') do |username, password|
      username == 'BrokerFree' && password == '#$#$123#$' 
    end 
  end 
end