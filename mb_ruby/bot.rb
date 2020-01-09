
require 'slack-ruby-bot'
require 'httparty'

module MbRuby
  class Bot < SlackRubyBot::Bot    
    help do
      title 'My Ruby Bot'
      desc 'This bot is about getting a given youtube video'
      
      command :get_link do
        title 'get youtube video link'
        desc 'Returns the url of a given youtube video topic'
        long_desc 'Returns the url of a given youtube video topic'
      end
    end
  end
end