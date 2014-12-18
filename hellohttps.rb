require 'sinatra/base'
require 'webrick'
require 'webrick/https'
require 'openssl'

class MyServer  < Sinatra::Base
    get '/' do
      "Hello, world!\n"
    end
end

CERT_PATH = '/Users/twer/dev/security/https/'

webrick_options = {
  :Port               => 8443,
  :Logger             => WEBrick::Log::new($stderr, WEBrick::Log::DEBUG),
  :DocumentRoot       => "/ruby/htdocs",
  :SSLEnable          => true,
  :SSLVerifyClient    => OpenSSL::SSL::VERIFY_NONE,
  :SSLCertificate     => OpenSSL::X509::Certificate.new(  File.open(File.join(CERT_PATH, "cert.pem")).read),
  :SSLPrivateKey      => OpenSSL::PKey::RSA.new(          File.open(File.join(CERT_PATH, "key.pem")).read),
  :SSLCertName        => [ [ "CN",WEBrick::Utils::getservername ] ],
  :app                => MyServer
}
Rack::Server.start webrick_options
