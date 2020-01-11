require 'slack-ruby-bot'
require 'httparty'
require 'open-uri'
require 'wolfram'
Wolfram.appid= ENV["WOLFRAM_APPID"]
require 'json'
require 'screencap'
require 'imgur2'

module MbRuby
  class Bot < SlackRubyBot::Bot    
    help do
      title 'My Ruby Bot'
      desc 'This office bot, which will hepl you as an office assistant'
      
      command :say_hello do
        title 'say_hello'
        desc "Welcome command, to recieve you properly."
        long_desc "Welcome command, to recieve you properly."
      end    
    end
  end

  class BotCommands < SlackRubyBot::Commands::Base
    command 'say_hello' do |client, data, _match|
      client.say(channel: data.channel,  text: HelloText.say_hello)
    end

    command 'insult' do |client, data, _match|
      result = JSON.parse Http.get('http://quandyfactory.com/insult/json').body
      insult = result['insult']
      client.message text: "Hey #{_match[:expression]}, #{insult}", channel: data.channel
    end

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

  class HelloText
    def self.say_hello
      'Hello! This is a Bot test!'
    end  
  end
end