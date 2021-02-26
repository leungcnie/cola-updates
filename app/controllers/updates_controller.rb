require 'net/http'
require 'json'

class UpdatesController < ApplicationController
  def index
    uri = URI('https://raw.githubusercontent.com/Vericatch/devtestapiapp/master/mock_response.json')
    response = JSON.parse(Net::HTTP.get(uri))

    # Save data to database
    # response.each do |update|
    #   Update.create(created_at: update["created_at"], followers: update["followers"], user_id: update["id"], message: update["message"], sentiment: update["sentiment"], updated_at: update["updated_at"], user_handle: update["user_handle"])
    # end

    # Get all updates from db and sort by sentiment
    all_updates = Update.all.order(sentiment: :desc)

    # Filter only updates that contain coke keywords
    @updates = all_updates.select {|update| update["message"].downcase.include?("coke") || update["message"].downcase.include?("coca-cola") || update["message"].downcase.include?("diet-cola")}

    # Sort by sentiment
    # @updates = coke_updates.sort_by {|update| -update["sentiment"]}

    # Percentage of coke keyword updates
    @percentage = (@updates.length().to_f / all_updates.length().to_f) * 100

  end
end
