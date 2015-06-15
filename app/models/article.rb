class Article < ActiveRecord::Base

  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :content, presence: true
end
