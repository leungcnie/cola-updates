require 'net/http'
require 'json'

class UpdatesController < ApplicationController
  def index
    uri = URI('https://raw.githubusercontent.com/Vericatch/devtestapiapp/master/mock_response.json')
    @updates = JSON.parse(Net::HTTP.get(uri))
  end
end
