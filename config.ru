$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'wolfram'
Wolfram.appid= ENV["WOLFRAM_APPID"]

require 'dotenv'
Dotenv.load

require 'mb_ruby'
MbRuby::Bot.run