require_relative 'rss'
require_relative 'open-uri'

module MbRuby
  module Commands
      class GetLink < SlackRubyBot::Commands::Base
          command 'get_youtube_link' do |client, data, _match|
              url = 'https://www.driftingruby.com/episodes/feed.rss'
              rss = RSS:Parser.parse(open(url).read, false).items.first
              client.say(channel: data.channel, text: rss.link)
          end
      end
  end
end