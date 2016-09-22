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
    response[:attachments] = [ generate_attachment ]
    response = response.to_json
  end
end
  status 200
  body response
end

def generate_request
  @user_query = params[:text].gsub(/\s/,'+')

  if @user_query.length == 0
    uri = "http://api.giphy.com/v1/gifs/random?tag=appa&api_key=dc6zaTOxFJmzC"
  else
    uri = "http://api.giphy.com/v1/gifs/random?tag=appa+#{@user_query}&api_key=dc6zaTOxFJmzC""
  end

  request = HTTParty.get(uri)
  puts "[LOG] #{request.body}"
  result = JSON.parse(request.body)
end

def generate_text
  if generate_request[0].nil?
    response = "No gif found. :("
  else
    response = "Yip Yip!"
  end
  response
end

def generate_attachment
  if generate_request[0].nil?
    response = ""
  else
  @imageurl = generate_request["data"]["image_original_url"]

  response = {
            image_url: "#{@imageurl}" }
  end
response
end
