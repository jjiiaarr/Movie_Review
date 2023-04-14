class Movie < ApplicationRecord
  validates :title, presence: true
  validates :blurb, presence: true
  validates :country, presence: true

  has_many :reviews
end