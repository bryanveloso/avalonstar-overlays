require 'rubygems'

require 'middleman/rack'
require 'rack'
require 'rack/contrib/try_static'

# The project root directory.
$root = ::File.dirname(__FILE__)

# Build the static site when the app boots
`bundle exec middleman build`

# Enable proper HEAD responses
use Rack::Head

# Deflate Gzip things
use Rack::Deflater

# Attempt to serve static HTML files
use Rack::TryStatic,
  :root => 'tmp',
  :urls => %w[/],
  :try => ['.html', 'index.html', '/index.html']
