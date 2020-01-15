Slackbot
==============

Microverse Capstone Project consisting a bot deveolped to interact with Slack users on a given Workspace. Build yours!

## What it does?
It allows you to make a quick search by asking your bot without leaving Slack. Some example questions may be:

![Example question 1](img/question_1.gif)

![Example question 2](img/question_2.gif)

But if you try something he may not know:
![Example question 3](img/question_3.gif)

## How it works?
The Bot is working  on top of the following resources:

- [Slack-Ruby-Bot](https://github.com/slack-ruby/slack-ruby-bot#slack-ruby-bot)
- [Slack API](http://api.slack.com)
- [Wolfram API](http://account.wolfram.com/wolframid)

And powered by:

- Ruby
- Slack
- YML

## Usage
### Step 1: Clone and install dependencies
Clone the repo and run `bundle install` to get all the gems on your terminal.
### Step 2: Get your tokens for Slack & Wolfram APIs
You will have to register on [WolframID](http://account.wolfram.com/wolframid) and [Slack Bot Integration](http://slack.com/services/new/bot) to get your access tokens (for a register tutorial on Slack and Wolfram click here). Once that done just paste on your `.env` file. 
### Step 4: Add your bot to a channel and run
You're almost done with code part. Now just