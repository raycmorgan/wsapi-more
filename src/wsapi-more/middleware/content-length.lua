local class = wsapi_more.class

module("wsapi_more.middleware", package.seeall)

class("ContentLength", _M) (wsapi_more.Middleware) do
  function ContentLength:after_filter(code, header, response, env)
    header["Content-Length"] = header["Content-Length"] or response:len()
    
    return code, header, response
  end
end