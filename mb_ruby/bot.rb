module MbRuby
  class Bot < SlackRubyBot::Bot    
    help do
      title 'About me'
      desc 'Bot for searching purposes. Ask for something that you would usually google to get it fast'
      
      command :are_you_there? do
        title 'are you there?'
        desc "Welcome command, to recieve you properly :)"
        long_desc "\n\nI'll give you a brief explanation of how can you interact with me"
      end

      command :Could_you_please? do
        title 'Could you please'
        desc "Ask me..."
        long_desc "\n\nBegin a sentence to ask me something like: 'Could you please tell me the distance between" + 
        " Earth and Sun?' \n\nOr: Could you please tell me what time is on Paris?" + 
        "\n\nPlease avoid personal questions. I refuse to guess."
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