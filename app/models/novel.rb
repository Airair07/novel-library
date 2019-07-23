class Novel < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :story, presence: true, length: { maximum: 1000 }
end
