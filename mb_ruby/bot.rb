
require 'slack-ruby-bot'
require 'httparty'

module MbRuby
  class Bot < SlackRubyBot::Bot    
    help do
      title 'My Ruby Bot'
      desc 'This office bot, which will heplp you as an office assistant'
      
      command :say_hello do
        title 'say_hello'
        desc "Welcome command, to recieve you properly"
        long_desc "Welcome command, to recieve you properly"
      end
    end
  end
end