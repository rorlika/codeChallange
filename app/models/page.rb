class Page < ApplicationRecord
  has_one :source
  # validates :url, presence: true
  # validates :url, uniqueness: true
end
