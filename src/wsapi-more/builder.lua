module('wsapi_more', package.seeall)

class("Builder", _M) do
  local static = Builder:classtable()
  
  function Builder:initialize(callback)
    self.stack = {}
    callback(self)
  end
  
  function static:app(callback)
    local builder = Builder(callback)
    return builder:to_app()
  end
  
  function Builder:use(middleware)
    table.insert(self.stack, middleware)
  end
  
  function Builder:run(application)
    table.insert(self.stack, application)
  end
  
  function Builder:map(path, callback)
    self.stack
  end
  
  function Builder:to_app()
    local app = nil
    
    for i = #self.stack, 1, -1 do
      if not app and self.stack[i]:derives(wsapi.Application) then
        app = self.stack[i]()
      else
        app = self.stack[i](app)
      end
    end
    
    return app
  end
end