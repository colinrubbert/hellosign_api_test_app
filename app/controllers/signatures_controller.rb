class SignaturesController < ApplicationController

  def new_embedded
  end

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

end
