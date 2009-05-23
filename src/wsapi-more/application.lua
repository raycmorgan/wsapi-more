module('wsapi_more', package.seeall)

class("Application", _M) (wsapi_more.Mountable) do
  function Application:initialize()
    local old_run = self.run
    
    self.run = function(env)
      local status, headers, body = old_run(self, env)
      if type(body) == "string" then
        return status, headers, self:wrap(body)
      else
        return status, headers, body
      end
    end
  end
end