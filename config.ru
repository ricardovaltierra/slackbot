$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-ruby-bot'
require 'mb_ruby/bot'
MbRuby::App.instance.run