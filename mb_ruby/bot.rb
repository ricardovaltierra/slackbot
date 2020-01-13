require 'slack-ruby-bot'
require 'dotenv'
Dotenv.load
require 'wolfram'
Wolfram.appid= ENV["WOLFRAM_APPID"]
require 'uri'
require 'http'
require 'json'
require 'mechanize'
require 'screencap'
require 'imgur2'

module RubyBot
  class App < SlackRubyBot::App
  end

  class Hiiii < SlackRubyBot::Commands::Base
    command 'hi' do |client, data, _match|
      client.message text: 'hiiiiiiiiiiii', channel: data.channel
    end
  end

  class Image < SlackRubyBot::Commands::Base

    command 'imageme' do |client, data, _match|


      Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }
      .get("http://theironyard.com/about/team/")
      .search(".bio h2").select{|tag| tag.text =~ /#{_match[:expression]}/i}.map do |tag|
        {
          name: tag.text,
          src: "http://theironyard.com/" + tag.parent.parent.search("img").attr("src").value
        }
      end
      .each do |args|
        client.message text: args[:name], channel: data.channel
        client.message text: args[:src], channel: data.channel
      end


    end
  end

  class Screenshot < SlackRubyBot::Commands::Base

    command 'screenshot' do |client, data, _match|

      url = URI(_match[:expression].match(/\<(.*)\>/)[1]) rescue nil

      if url
        fetcher_object = Screencap::Fetcher.new(url.to_s)
        screenshot = fetcher_object.fetch width: 1700, height: 850
        imgur_client = Imgur2.new ENV['IMGUR_API']
        url = imgur_client.upload screenshot
        image_url = url["upload"]["links"]["original"]
        client.message text: image_url, channel: data.channel
      else
        client.message text: _match[:expression] + "isn't a URL, yo", channel: data.channel

      end
    end
  end

  class Insults < SlackRubyBot::Commands::Base

    command 'insult' do |client, data, _match|

      result = JSON.parse Http.get('http://quandyfactory.com/insult/json').body
      insult = result['insult']
      client.message text: "Hey #{_match[:expression]}, #{insult}", channel: data.channel

    end

  end

  class WolframSearch < SlackRubyBot::Commands::Base


    command 'wolf' do |client, data, _match|

      q = _match[:expression]
      result = Wolfram::Query.new(q).fetch
      hash = Wolfram::HashPresenter.new(result).to_hash

      result = ""

      hash.fetch(:pods, {}).each do |key, values|
        next if values.join("") == ""
        result << "\n" + key + "\n"
        result << values.join("\n")
      end

      if result != ""
        client.message text: result, channel: data.channel
      else
        client.message text: "
          No results found for #{q}. \n
          Try https://duckduckgo.com/?q=#{URI.escape(q)}+!google",
          channel: data.channel
      end

    end
  end
end

RubyBot::App.instance.run