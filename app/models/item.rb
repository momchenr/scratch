class Item < ActiveRecord::Base
  attr_accessible :content, :user_id, :title
  validates :content, :length => { :maximum => 140 }
  belongs_to :user
  delegate :email, to: :user
end
