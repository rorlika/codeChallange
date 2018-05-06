class Page < ApplicationRecord
  has_one :source, dependent: :destroy
  validates :url, presence: true
  validates :url, uniqueness: true
end
