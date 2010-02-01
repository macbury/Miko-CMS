require "rubygems"

require "sinatra"
require "erb"
require "yaml"

MIKO_CONFIG = YAML::load(File.open(File.dirname(__FILE__) + "/config.yml"))

set :views, File.dirname(__FILE__) + '/'
set :public, File.dirname(__FILE__) + '/assets'
set :sessions, true

require "lib/auth"
require "lib/tags"
require "lib/pages"