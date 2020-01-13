$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-ruby-bot'
require 'dotenv'
Dotenv.load

require 'wolfram'
require 'mb_ruby/bot'
MbRuby::App.instance.run