class Post < ActiveRecord::Base
  validates :title, :decription, :body, presence: true
end
