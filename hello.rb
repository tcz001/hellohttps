require 'sinatra/base'
require 'webrick'

class MyServer  < Sinatra::Base
    get '/' do
      "Hello, world!\n"
    end
end

webrick_options = {
  :Port               => 8000,
  :Logger             => WEBrick::Log::new($stderr, WEBrick::Log::DEBUG),
  :DocumentRoot       => "/ruby/htdocs",
  :app                => MyServer
}
Rack::Server.start webrick_options
