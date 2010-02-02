require "rubygems"

require "sinatra"
require "erb"
require "yaml"

MIKO_CONFIG = YAML::load(File.open(File.dirname(__FILE__) + "/config.yml"))

set :views, File.dirname(__FILE__) + '/'
set :public, File.dirname(__FILE__) + '/assets'
set :sessions, true

FileUtils.mkdir_p(File.join([File.dirname(__FILE__), '/content', '/page']))
FileUtils.mkdir_p(File.join([File.dirname(__FILE__), '/content', '/static']))

require "lib/auth"
require "lib/tags"
require "lib/pages"