local class = wsapi_more.class

module("wsapi_more.middleware", package.seeall)

class("URLMap", _M) (wsapi_more.Middleware) do
  function URLMap:run(env)
    local path = env.SCRIPT_NAME .. env.PATH_NAME
  end

  function ContentLength:after_filter(code, header, response, env)
    header["Content-Length"] = header["Content-Length"] or response:len()
    
    return code, header, response
  end
end
