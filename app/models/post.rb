class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, :decription, :body, presence: true
end
