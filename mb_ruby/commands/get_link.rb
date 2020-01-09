require 'rss'
require 'open-uri'

module MbRuby
  module Commands
      class GetLink < SlackRubyBot::Commands::Base
          command 'get_link' do |client, data, _match|
              url = 'https://www.driftingruby.com/episodes/feed.rss'
              rss = RSS:Parser.parse(open(url).read, false).items.first
              client.say(channel: data.channel, text: rss.link)
          end

          command 'say_hello' do |client, data, _match|
            client.say(channel: data.channel, text: HelloText.say_hello)
          end

          command 'say_selse' do |client, data, _match|
            client.say(channel: data.channel, text: HelloText.say_selse)
          end
      end
  end
end

class HelloText
  def self.say_hello
    'Hello! This is a Bot!'
  end

  def self.say_selse
    'This is a method test!'
  end
end