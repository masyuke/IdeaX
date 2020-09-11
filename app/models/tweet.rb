class Tweet < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :content, presence: true

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
