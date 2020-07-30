# frozen_string_literal: true

require 'discordrb/webhooks'
require 'dotenv'

Dotenv.load
WEBHOOK_URL = ENV['WEBHOOK_URL']

client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
client.execute do |builder|
  builder.content = 'Hello World!'
  builder.add_embed do |embed|
    embed.title = 'Embed Title'
    embed.description = 'I\'m from the future'
    embed.timestamp = Time.new(2040, 6, 21, 9, 30, 43, '-05:00')
  end
end
