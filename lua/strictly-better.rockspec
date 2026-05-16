package = "voxgig-sdk-strictly-better"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/strictly-better-sdk.git"
}
description = {
  summary = "StrictlyBetter SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["strictly-better_sdk"] = "strictly-better_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
