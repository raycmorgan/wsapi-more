module("wsapi_more", package.seeall)

class("Middleware", _M) (wsapi_more.Mountable) do
  function Middleware:initialize(app)
    if type(app) == "function" then
      self.app = app
    elseif app.instanceof then
      self.app = app.run
    else
      error("Arg `app` must be either a function for wsapi.Application instead got: " .. app)
    end
    
    local old_run = self.run
    
    self.run = function(env)
      return old_run(self, env)
    end
  end
  
  function Middleware:before_filter(env)
  end
  
  function Middleware:after_filter(code, header, response, env)
    return code, header, response
  end
  
  function Middleware:run(env)
    self:before_filter(env)
    local code, header, response = self.app(env)
    response = self:buffer(response)
    
    code, header, response = self:after_filter(code, header, response, env)
    return code, header, self:wrap(response)
  end
end