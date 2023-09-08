class ChatGptController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:ask] # You may want to handle CSRF differently in a real app

  def index
  end

  def ask
    require 'openai'

    begin
      prompt = params[:prompt]
      client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: prompt}], # Required.
          temperature: 0.7,
        }
      )

      render json: { reply: response.dig("choices", 0, "message", "content") }
    rescue => e
      render json: { error: "An error occurred: #{e.message}" }, status: 500
    end
  end
end
