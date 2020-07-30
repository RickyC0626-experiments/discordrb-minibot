# frozen_string_literal: true

require 'discordrb'
require 'dotenv'

Dotenv.load
bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.message(with_text: "#{ENV['PREFIX']}ping") do |event|
  event.respond 'Pong!'
end

bot.message(with_text: "#{ENV['PREFIX']}game") do |event|
  event.respond "You are playing #{event.author.game || 'nothing at all'}"
end

at_exit { bot.stop }
bot.run
