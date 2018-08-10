module SessionRedirect
  extend ActiveSupport::Concern
  def after_sign_in_path_for(resource)
    shoes_path
  end
end
