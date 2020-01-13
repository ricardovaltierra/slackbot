module MbRuby
  class Bot < SlackRubyBot::Bot    
    help do
      title 'My Ruby Bot'
      desc 'This office bot, which will hepl you as an office assistant'
      
      command :are you there? do
        title 'are you there?'
        desc "Welcome command, to recieve you properly :)"
        long_desc "Welcome command, gives you a brief explanation of how can you interact with the bot"
      end

      command :Could you please? do
        title 'Could you please'
        desc "Begin a sentence with this words to ask something"
        long_desc "Begin a sentence to ask to the bot "
      end
    end
  end

  class WFSearch < SlackRubyBot::Commands::Base

    command 'are you there?' do |client, data, _match|
      client.say(channel: data.channel,  text: HelloText.say_hello)
    end

    command 'Could you please' do |client, data, _match|

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
        client.message text: "Here's your answer: \n" + result, channel: data.channel
      else
        client.message text: "
          Sorry, I don't know \nBut you find it here! \n
          https://duckduckgo.com/?q=#{URI.escape(q)}+!google",
          channel: data.channel
      end
    end
  end

  class HelloText
    def self.say_hello
      "Hello, I'm your Research Bot Assistant! \nAsk me anything (altough I'm not a smarty) and I'll show up what you need \nOtherwize I'll google it! :D"
    end  
  end
end