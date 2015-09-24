class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def new
  end

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

  def create
    client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
    client.create_embedded_signature_request_with_template(
    :test_mode => 1,             #Set to 1 to signify this is just a test
    :client_id => ENV["hellosign_client_id"],
    :template_id => ENV["agent_w9_form"],
    :subject => "Your W9 Form",
    :message => "Please fill out all relevant information, sign, date.",
    :signers => [
        {
          :name => "Colin Rubbert",
          :email_address => "colinrubbert@gmail.com",
          :role => 'Agent'
        }
      ],
    )

    embedded = client.get_embedded_sign_url :signature_id => '72f17b7a021381aebc7681a638371bbe'
    @sign_url = embedded.sign_url
    render :embedded_signature
  end

end
