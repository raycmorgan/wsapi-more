module("wsapi_more", package.seeall)

class("Mountable", _M) do
  function Mountable:buffer(response)
    local buffer = {}
    
    local stream = { 
      write = function(self, data)
        table.insert(buffer, data) 
        return true
      end
    }
    
    wsapi.common.send_content(stream, response, "write")
    return table.concat(buffer)
  end
  
  function Mountable:wrap(response)
    return coroutine.wrap(function() coroutine.yield(response) end)
  end
end