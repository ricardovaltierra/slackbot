# Slackbot

> Microverse Ruby Capstone Project

<p align="right">
  <br>
  <a href="https://github.com/ricardovaltierra/slackbot">Explore the repo »</a>
  <br>
  <a href="https://github.com/ricardovaltierra/slackbot/issues">Request Feature</a>
</p>

## Table of Contents

* [About the Project](#about-the-project)

* [Preview](#preview)

* [Built With](#built-with)

* [Getting Started](#getting-started)

* [How it Works](#how-it-works)

* [Contributing](#contributing)

* [Contact](#contact)

* [MIT License](#mit-license)

## About The Project

Slack bot developed on official Wolfram and Slack API's resources to interact on a given workspace and make questions like weather, location places and more.

It allows you to make a quick web query by asking your bot without leaving Slack.

## Preview

<img src="img/question_1.gif" data-canonical-src="img/question_1.gif" width="314"/>  <img src="img/question_2.gif" data-canonical-src="img/question_2.gif" width="314"/>  <img src="img/question_3.gif" data-canonical-src="img/question_3.gif" width="314"/>

Feel free to use and recommend it.

## Built With

* [Ruby =< 2.6.5](https://www.ruby-lang.org/en/)

* [YAML](https://yaml.org/)

* [Slack-Ruby-Bot](https://github.com/slack-ruby/slack-ruby-bot#slack-ruby-bot)

* [Slack API](http://api.slack.com)

* [Wolfram API](https://account.wolfram.com/auth/sign-in)

## Getting Started

To get a local copy up and running follow these simple steps.

Clone or fork the <a href="https://github.com/ricardovaltierra/slackbot">repo</a> [git@github.com:ricardovaltierra/slackbot.git]

## How it Works

### Step 1: Clone and install dependencies

Clone the repo and run `bundle install` to get all the gems on your terminal.

### Step 2: Get your tokens for Slack & Wolfram APIs

You will have to register on [WolframID](http://account.wolfram.com/wolframid) and [Slack Bot Integration](http://slack.com/services/new/bot) to get your access tokens (for a register tutorial on Slack and Wolfram click [here](TUTORIAL.md)). Once that done just paste on your `.env` file. 

### Step 3: Add your bot to a channel and run

You're almost done with code part. Now just execute with `rackup` and have fun! Above are some examples, but feel free to see description of each command with '@your_bot's_name are you there?' or '@your_bot's_name help'

<img src="img/question.gif" data-canonical-src="img/question.gif" width="400"/>

<img src="img/help_are_you_there.gif" data-canonical-src="img/help_are_you_there.gif" width="400"/>

<img src="img/help_could_you_please.gif" data-canonical-src="img/help_could_you_please.gif" width="400"/>

Also feel free to play with the code for some commands, like changing responses or adding them on `bot.rb`
    
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project

2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)

3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)

4. Push to the Branch (`git push origin feature/AmazingFeature`)

5. Open a Pull Request

## Contact

Ricardo Valtierra - [@RicardoValtie15](https://twitter.com/RicardoValtie15) - ricardo_valtierra@outlook.com  - [linkedin.com/in/ricardovaltierra/](https://www.linkedin.com/in/ricardovaltierra/)

## MIT License

This project is under the [MIT](LICENSE) license.
