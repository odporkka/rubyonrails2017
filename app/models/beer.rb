class Beer < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}

	belongs_to :brewery
	has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, presence: true
  validates :style, presence: true

  def to_s
    self.name + ", " + self.brewery.name
  end
end
