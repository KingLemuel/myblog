class Article < ActiveRecord::Base
  #paperclip basis
  has_attached_file :avatar, 
        :styles => { :large => "900x300", :medium => "300x300>", :thumb => "100x100>" }, 
        :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  #slugging
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  #validations
  validates :title, presence: true
  validates :content, presence: true
  
  #delete capability for avatar - review this code
  attr_accessor :delete_avatar
  before_validation { self.avatar.clear if self.delete_avatar == '1' }
end
