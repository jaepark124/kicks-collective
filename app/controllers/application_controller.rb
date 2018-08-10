class ApplicationController < ActionController::Base
  include DeviseWhitelist, SessionRedirect
end
