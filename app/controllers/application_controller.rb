class ApplicationController < ActionController::Base
    # REMOVE THIS!!!!
    skip_before_action :verify_authenticity_token
end
