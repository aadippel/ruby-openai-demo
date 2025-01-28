# Write your solution here!
require "openai"
require "dotenv/load"

# Instantiate a client with your OpenAI API key
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

# Part 1: Interaction with the user
puts "Hello! How can I help you today?"
puts "-" * 50  # Prints a line of fifty "-"

# Waits for the user to type in a request
user_input = gets.chomp

# Send the request to the OpenAI API
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: [
      {
        "role" => "system",
        "content" => "You are a helpful assistant."
      },
      {
        "role" => "user",
        "content" => user_input
      }
    ]
  }
)

# Parse the response from the API
choices = api_response.fetch("choices")
first_choice = choices.at(0)
message = first_choice.fetch("message")
assistant_response = message["content"]

# Print the response from the API
puts assistant_response
puts "-" * 50  # Prints another line of fifty "-"
