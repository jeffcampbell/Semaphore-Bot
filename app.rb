# encoding: utf-8
require "rubygems"
require "bundler/setup"
Bundler.require(:default)

configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true
end

get "/" do
  ""
end

post "/" do
  response['content-type'] = 'application/json'
  response = ""
begin
  puts "[LOG] #{params}"
  params[:text] = params[:text]
  unless params[:token] != ENV["OUTGOING_WEBHOOK_TOKEN"]
    response = { text: generate_text }
    response[:response_type] = "in_channel"
    response = response.to_json
  end
end
  status 200
  body response
end

def generate_text
  user_query = params[:text].gsub!(/[^0-9A-Za-z]/, '')

    char_array = user_query.scan /\w/

    char_array.each_with_index do |value|
      translations << ":semaphore-#{value}:"
    end

    if char_array.size > 0
      response = "#{translations.join("\n")}"
    else
      response = "No message. Please flag again"
    end
    response
end
