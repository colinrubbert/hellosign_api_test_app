class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def new
  end

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

  def create
    embedded_request = create_embedded_request(name: params[:name], email: params[:email])
    @sign_url = get_sign_url(embedded_request)
    render :embedded_request
  end

  private

  def create_embedded_request(opts = {})
    HelloSign.send_request_with_template(
    :test_mode => 1,             #Set to 1 to signify this is just a test
    :template_id => ENV["agent_w9_form"],
    :title => 'Agent W9 Tax Form',
    :subject => "Your W9 Form",
    :message => "Please fill out all relevant information, sign, and date.",
    :signers => [
      {
        # Email addresses of reciepients
        email_address: opts[:email],
        name: opts[:name]
      }
    ],
    :custom_fields => {
      # These will be custom fields that need to be filled out
    }
    )
  end

  def get_sign_url(embedded_request)
    sign_id = get_first_signature_id(embedded_request)
    Hellosign.get_embedded_sign_url(signature_id: sign_id).sign_url
  end

  def get_first_signature_id(embedded_request)
    embedded_request.signatures[0].signature_id
  end

end
