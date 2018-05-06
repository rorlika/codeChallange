class Source < ApplicationRecord
  belongs_to :page
  validates :page_id, presence: true
  validates :page_id, uniqueness: true
end
