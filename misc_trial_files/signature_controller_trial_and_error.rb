# Multiple files that were used for trial and error purposes

# def create_embedded_request(opts = {})
#   client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
#   client.create_embedded_signature_request_with_template(
#   :test_mode => 1,             #Set to 1 to signify this is just a test
#   :client_id => ENV["hellosign_client_id"],
#   :template_id => ENV["agent_w9_form"],
#   :subject => "Your W9 Form",
#   :message => "Please fill out all relevant information, sign, date.",
#   :signers => [
#       {
#         :name => opts[:name],
#         :email_address => opts[:email_address],
#         :role => 'Agent'
#       }
#     ],
#   )
#   sign_id = client.signatures[0].signature_id
#   embedded = client.get_embedded_sign_url :signature_id => sign_id
#   @sign_url = embedded.sign_url
#   render :embedded_signature
# end
#
# def get_sign_url(embedded_request)
#   sign_id = get_first_signature_id(embedded_request)
#   client.get_embedded_sign_url(signature_id: sign_id).sign_url
# end
#
# def get_first_signature_id(embedded_request)
#   embedded_request.signatures[0].signature_id
# end


# def create
  # embedded_request = create_embedded_request(name: params[:name], email_address: params[:email_address])
  # @sign_url = get_sign_url(embedded_request)
  # render :embedded_signature
# end

# signature_id = 1e80c6977888b384e1e14cc3ca4a8ddb


 # def create_embedded_request(opts = {})
 #   client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
 #   client.create_embedded_unclaimed_draft(
 #   :test_mode => 1,             #Set to 1 to signify this is just a test
 #   :client_id => ENV["hellosign_client_id"],
 #   :type => 'request signature',
 #   :subject => "Your W9 Form - Please fill out all relevant information, sign, date.",
 #   :requester_email_address => 'colinrubbert@gmail.com',
 #   :files => ['W9 Form.pdf'],
 #   :is_for_embedded_signing => 1,
 #   :signers => [
 #       {
 #         :name => opts[:name],
 #         :email_address => opts[:email_address],
 #         :role => 'Agent',
 #       }
 #     ],
 #   )
 #
 #   new_template_id = request.data[ENV["agent_w9_form"]]
 #   edit_url = request.data["edit_url"]
 #   is_embedded_draft = request.data["is_embedded_draft"]
 # end


############ Sends an email request !!###############

 # def create_embedded_request(opts = {})
 #   client = HelloSign::Client.new :api_key => ENV["hellosign_api_key"]
 #   client.send_signature_request_with_template(
 #   :test_mode => 1,             #Set to 1 to signify this is just a test
 #   :template_id => ENV["agent_w9_form"],
 #   :title => 'Agent W9 Tax Form',
 #   :subject => "Your W9 Form",
 #   :message => "Please fill out all relevant information, sign, and date.",
 #   :signers => [
 #     {
 #       :name => opts[:name],
 #       :email_address => opts[:email_address],
 #       :role => 'Agent',
 #     }
 #   ],
 #
 #   )
 # end
