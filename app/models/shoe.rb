class Shoe < ApplicationRecord
  belongs_to :user
  after_initialize :default_images
  scope :default_sort, -> { order(updated_at: :desc) }
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 24 }
  mount_uploader :main_image, ShoeUploader
  mount_uploader :thumb_image, ShoeUploader

  def default_images
    if !main_image && !thumb_image
      self.main_image = "https://s3-us-west-1.amazonaws.com/kickscollective/air-jordan-3-silhouette.png"
      self.thumb_image = "https://s3-us-west-1.amazonaws.com/kickscollective/air-jordan-3-silhouette.png"
    end
  end
end
