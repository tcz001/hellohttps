openssl req -x509 -sha256 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365

gem install sinatra
You need to use Webrick to serve Sinatra
ruby hello.rb
ruby hellohttps.rb
