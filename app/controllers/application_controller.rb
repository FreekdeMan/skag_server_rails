require 'adwords_api'

class ApplicationController < ActionController::Base

  API_VERSION = :v201705

  before_action :authenticate
  protect_from_forgery

  private

  # Returns the API version in use.
  def get_api_version()
    return API_VERSION
  end

  # Returns currently selected account.
  def selected_account()
    @selected_account ||= session[:selected_account]
    return @selected_account
  end

  # Sets current account to the specified one.
  def selected_account=(new_selected_account)
    @selected_account = new_selected_account
    session[:selected_account] = @selected_account
  end

  # Checks if we have a valid credentials.
  def authenticate()
    token = session[:token]
    redirect_to login_prompt_path if token.nil?
    return !token.nil?
  end

  # Returns an API object.
  def get_adwords_api()
    Rails.logger.info("# ApplicationController with OAuth: #{ENV["OAUTH_CLIENT_ID"]}")
    @api ||= create_adwords_api()
    return @api
  end

  # Creates an instance of AdWords API class. Uses a configuration file and
  # Rails config directory.
  def create_adwords_api()
    config_filename = File.join(Rails.root, 'config', 'adwords_api.yml.erb')
    template = ERB.new File.new(config_filename).read
    processed = YAML.load template.result(binding)
    @api = AdwordsApi::Api.new(processed)
    token = session[:token]
    # If we have an OAuth2 token in session we use the credentials from it.
    if token
      credentials = @api.credential_handler()
      credentials.set_credential(:oauth2_token, token)
      credentials.set_credential(:client_customer_id, selected_account)
    end
    return @api
  end
end
