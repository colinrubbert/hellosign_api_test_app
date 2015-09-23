class SignaturesController < ApplicationController
  skip_before_action :verify_authentication_token, only: [:callbacks]

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

end
