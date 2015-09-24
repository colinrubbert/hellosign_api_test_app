## This is a test application for Hellosign api

#### Notes
* In endpoint controller action Hellosign requires the endpoint to always respond with status 200
```ruby
class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end
end
```
* To setup a test environment to handle responses and requests we will use `ngrok` for tunneling our local environment
* Sign up for `ngrok` [here](https://ngrok.com/) to get an account and authentication token
* Download and install `ngrok` to your environment
* Set your `ngrok` authentication token
```bash
./ngrok authtoken [your_authentication_token]
```
* Start your rails server `rails s` and then start an `ngrok` tunnel
```bash
./ngrok http 3000
```
* Copy your `ngrok` web address
```bash
example: http://96edccba.ngrok.io
```
* Paste your `ngrok` web address in your "Event Callback" input
* Now we will have to append our routes that we have specified in our `routes.rb` file
```ruby
Rails.application.routes.draw do
  post '/signatures/callbacks',
    to: 'signatures#callbacks'
end
```
* In our case we have specified that `/signatures/callbacks` will be how we will route to your callback so our "Event Callback" input box will have to look like this:
```bash
example: http://96edccba.ngrok.io/signatures/callbacks
```
* Once we have inputed this data, `ngrok` and `rails s` are still running lets push the "test" button to assure this is working. We should receive a `200 OK` message in our `ngrok` window and `Success! "Hello API Event Received" was found in the response` in our hellosign API app dashboard
* *WARNING* If you are using the free version of `ngrok` each time you stop your tunnels and restart them the web address will change. If you want a persistent web address you will have to pay for `ngrok`.
* In order to test whether or not your callbacks and embedded forms work you will need to test with your `ngrok` domain and _NOT_ with `localhost`. HelloSign does not allow for testing with localhost callbacks.
