require 'slack-ruby-bot/rspec'

describe SlackRubyBot::Commands do
  it 'responds with any message' do
    expect(message: "#{SlackRubyBot.config.user} hi").to respond_with_slack_message
  end
  it 'says hi' do
    expect(message: "#{SlackRubyBot.config.user} hi").to respond_with_slack_message('hi')
  end
end