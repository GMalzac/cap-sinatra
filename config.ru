require_relative './db.rb'
require_relative './app.rb'
require_relative './app2.rb'

run Rack::URLMap.new(
  '/parent' => App,
  '/child'   => App2
)
