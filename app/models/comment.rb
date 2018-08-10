class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

  after_create_commit { CommentBroadcastJob.perform_later(self) }

  validates :body, presence: true
end
