package.path = "./src/?.lua;" .. package.path

require 'luarocks.require'
require "xavante"
require 'wsapi.xavante'
require 'wsapi-more'

class = wsapi_more.class

class("TestApp", _G) (wsapi_more.Application) do
  function TestApp:run(env)
    return 200, {}, "Hello World"
  end
end




app = wsapi_more.Builder:app(function(b)
  b:use(wsapi_more.middleware.ContentLength)
  b:run(TestApp)
end)


xavante.HTTP {
  server = {host="*", port = 5555},
  defaultHost = {
    rules = {
      {
        match = {".*"}, 
        with = wsapi.xavante.makeHandler(app, "/", "/", "")
      }
    }
  }
}
xavante.start()
