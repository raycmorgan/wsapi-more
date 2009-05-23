package = "wsapi_more"
version = "1.0-3"
source = {
  url = "http://cloud.github.com/downloads/raycmorgan/wsapi-more/wsapi-more-1.0-3.tar.gz"
}
description = {
	summary = "addons for the wsapi library",
	detailed = [[
		wsapi-more is a bundle of addons for the wsapi library.
		It contains classes for easily constructing Middleware and
		Applications (endpoints) as well as linking them up to run
		via any wsapi based server.
	]],
	homepage = "http://wiki.github.com/raycmorgan/wsapi-more",
	maintainer = "Ray Morgan <raycmorgan@gmail.com>",
	license = "MIT/X11"
}
dependencies = {
	"lua >= 5.1",
	"wsapi"
}
build = {
	type = "module",
	modules = {
		wsapi_more = "src/wsapi-more.lua",
		["wsapi-more.Mountable"] = "src/wsapi-more/mountable.lua",
		["wsapi-more.Builder"] = "src/wsapi-more/builder.lua",
		["wsapi-more.class"] = "src/wsapi-more/class.lua",
		["wsapi-more.Application"] = "src/wsapi-more/application.lua",
		["wsapi-more.Middleware"] = "src/wsapi-more/middleware.lua",
		["wsapi-more.middleware.ContentLength"] = "src/wsapi-more/middleware/content-length.lua"
	}
}
