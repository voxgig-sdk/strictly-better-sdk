-- StrictlyBetter SDK error

local StrictlyBetterError = {}
StrictlyBetterError.__index = StrictlyBetterError


function StrictlyBetterError.new(code, msg, ctx)
  local self = setmetatable({}, StrictlyBetterError)
  self.is_sdk_error = true
  self.sdk = "StrictlyBetter"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function StrictlyBetterError:error()
  return self.msg
end


function StrictlyBetterError:__tostring()
  return self.msg
end


return StrictlyBetterError
