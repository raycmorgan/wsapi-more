wsapi-more: Addons for the wsapi library
========================================

wsapi-more is a bundle of addons for the wsapi library.
It contains classes for easily constructing Middleware and
Applications (endpoints) as well as linking them up to run
via any wsapi based server.

## Builder

A simple way to construct an application stack.
Example from test/test_app.lua

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