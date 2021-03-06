class Item < ActiveRecord::Base
#  include Tire::Model::Search
#  include Tire::Model::Callbacks
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :content, :user_id, :title, :price, :image
  validates :content, :length => { :maximum => 140 }
  belongs_to :user
  delegate :email, :city, :state, to: :user

  def self.search(search)
    if search
      where('title ILIKE ? OR content ILIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def location
    [city.to_s.camelcase, state.to_s.upcase].reject(&:blank?).join(", ")
  end

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '600x600#'
  }
#  mapping do
#    indexes :content #analyzer: 'snowball'
#    indexes :created_at, type: 'date'
#    indexes :title
#  end

#def self.search(params)
#  tire.search(page: params[:page], per_page: 2) do
#    query do
#      boolean do
#        must { string params[:query], default_operator: "AND" } if params[:query].present?
#        must { range :created_at, lte: Time.zone.now }
#      end
#    end
#    sort { by :created_at, "desc" } if params[:query].blank?
#     # raise to_curl
#    end
#  end
end
