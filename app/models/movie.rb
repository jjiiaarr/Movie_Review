class Movie < ApplicationRecord
  validates :title, presence: true
  validates :blurb, presence: true
  validates :country, presence: true

  belongs_to :user

  has_many :reviews
end