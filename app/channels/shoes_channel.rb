class ShoesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "shoes_#{params['shoe_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(body: data['comment'], shoe_id: data['shoe_id'])
  end
end
