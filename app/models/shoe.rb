class Shoe < ApplicationRecord
  belongs_to :user
  after_initialize :default_images
  scope :default_sort, -> { order(updated_at: :desc) }
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 24 }

  def default_images
    if !image_url && !thumb_url
      self.image_url = "https://s3-us-west-1.amazonaws.com/kickscollective/air-jordan-3-silhouette.png"
      self.thumb_url = "https://s3-us-west-1.amazonaws.com/kickscollective/air-jordan-3-silhouette.png"
    end
  end
end
