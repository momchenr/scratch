class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :city, :state, :phone
  has_many :items
  
  validates_presence_of :username
  validates_uniqueness_of :username
  
  def to_param
    username
  end

  def location
    [city, state].reject(&:blank?).join(",")
  end
  
end
