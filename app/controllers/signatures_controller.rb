class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def index
    client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
    # @signature_request_list = client.get_signature_requests
  end

  def show

  end

  def new
  end

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

  def create
    embedded_request = create_embedded_request(agent_name: params[:agent_name], email_address: params[:email_address], business_name: params[:business_name], address_number: params[:address_number], city_state_zip: params[:city_state_zip], bank_name: params[:bank_name], bank_routing_number: params[:bank_routing_number], bank_account_number: params[:bank_account_number], checking_account: params[:checking_account], savings_account: params[:savings_account] )
    @sign_url = get_sign_url(embedded_request)
    render :embedded_signature
  end


  private

  def create_embedded_request(options = {})
    client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
    client.create_embedded_signature_request_with_template(
    :test_mode => 1,             #Set to 1 to signify this is just a test
    :client_id => ENV["hellosign_client_id"],
    :template_ids => [
      ENV["agent_w9_form"],
      ENV["agent_contract_agreement"],
      ENV["agent_direct_deposit_form"]
    ],
    :title => "Contracts",
    :subject => "W9 Form and Agent Contract",
    :message => "Please fill out all relevant information, sign, date.",
    :signers => [
        {
          :name => options[:agent_name],
          :email_address => options[:email_address],
          :role => 'Agent'
        },
        {
          :name => 'Colin Rubbert',
          :email_address => 'colinrubbert@gmail.com',
          :role => 'TTS CEO'
        }
      ],
      :custom_fields => {
        :agent_name => options[:agent_name],
        :business_name => options[:business_name],
        :address_number => options[:address_number],
        :city_state_zip => options[:city_state_zip],
        :bank_name => options[:bank_name],
        :bank_routing_number => options[:bank_routing_number],
        :bank_account_number => options[:bank_account_number],
        :checking_account => options[:checking_account],
        :savings_account => options[:savings_account]
      }
    )
  end

  def get_sign_url(embedded_request)
    sign_id = get_signature_id(embedded_request)
    HelloSign.get_embedded_sign_url(signature_id: sign_id).sign_url
  end

  def get_signature_id(embedded_request)
    embedded_request.signatures[0].signature_id
  end

end
