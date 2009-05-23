require 'luarocks.require'

local require = require

module('wsapi_more')

require 'wsapi-more.class'
require 'wsapi-more.builder'
require 'wsapi-more.mountable'
require 'wsapi-more.application'
require 'wsapi-more.middleware'
require 'wsapi-more.middleware.content-length'