module ApplicationHelper
  def back_to_marketplace
    if params[:controller] == "shoes"  && params[:action] == "show"
      link_to "Back To Marketplace", shoes_path
    end
  end

  def login_helper
    if user_signed_in?
      render partial: 'shared/signed_in_links'
    else
      render partial: 'shared/no_account_links'
    end
  end

  def portal_button
    if user_signed_in?
      link_to "Back To Marketplace", shoes_path, class: "btn btn-lg btn-info"
    else
      render partial: 'shared/no_session_portal_links'
    end
  end

  def alerts
    if notice
      '<p class="notice">'.html_safe + notice + '</p>'.html_safe
    elsif alert
      '<p class="alert">'.html_safe + alert + '</p>'.html_safe
    end
  end

  def user_badges(user)
    if user.reputation > 6
      '<span class="badge badge-pill badge-success"> Reputable Seller </span>'.html_safe
    end
  end

  def edit_authorization(shoe)
    if current_user == shoe.user
      link_to "Edit Listing", edit_shoe_path(shoe), class: 'btn btn-warning'
    end
  end

  def session_greeting
    if user_signed_in?
      '<h3>Welcome back '.html_safe + current_user.username + ' !</h3>'.html_safe
    else
      '<h3>Create an account so you can start posting!</h3'.html_safe
    end
  end

  def action_button_for_forms(form)
    if params[:action] == "edit"
      form.submit "Update", class: 'form-btn'
    else
      form.submit "Post", class: 'form-btn'
    end
  end
end
