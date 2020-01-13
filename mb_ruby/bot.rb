


module MbRuby
  class App < SlackRubyBot::App
  end

  class WFSearch < SlackRubyBot::Commands::Base

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